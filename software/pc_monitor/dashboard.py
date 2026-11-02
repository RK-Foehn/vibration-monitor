"""Competition dashboard for the verified UART0 CSV protocol (no FPGA writes)."""

from __future__ import annotations

import argparse
from collections import deque
from datetime import datetime
import os
import queue
import random
import threading
import tempfile
import time
import tkinter as tk
from tkinter import filedialog, messagebox, ttk

# Writable cache location even when the profile's Matplotlib cache is locked.
os.environ.setdefault("MPLCONFIGDIR", os.path.join(tempfile.gettempdir(), "vibration_demo_mpl"))
from matplotlib import rcParams
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure

rcParams["font.family"] = ["Microsoft YaHei", "SimHei", "DejaVu Sans"]
rcParams["axes.unicode_minus"] = False

from analysis import BaselineCalibration
from protocol import HEADER, Measurement, SequenceTracker, UartDecoder, status_labels
from storage import CsvRecorder, compare_captures


BG = "#0B1020"
PANEL = "#172338"
TEXT = "#E7EEF8"
MUTED = "#AAB9CF"
BLUE = "#54B8FF"
ORANGE = "#FFAD5A"
GREEN = "#51D6A3"
RED = "#FF6F78"
PHASES = ("停机", "正常运行", "受控扰动", "其他")


class SerialReader(threading.Thread):
    """Only this worker touches pyserial. Tk is touched only on the main thread."""

    def __init__(self, port: str, baud: int, messages: queue.Queue) -> None:
        super().__init__(daemon=True)
        self.port, self.baud, self.messages = port, baud, messages
        self.stop_requested = threading.Event()
        self.queue_overflow = 0

    def _send(self, kind: str, value: str) -> None:
        try:
            self.messages.put_nowait((kind, value))
        except queue.Full:
            self.queue_overflow += 1

    def run(self) -> None:
        try:
            import serial

            pending = bytearray()
            discarding_line = False
            with serial.Serial(
                self.port, self.baud, bytesize=serial.EIGHTBITS,
                parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE,
                timeout=0.2, xonxoff=False, rtscts=False, dsrdtr=False,
            ) as stream:
                self._send("connected", self.port)
                while not self.stop_requested.is_set():
                    chunk = stream.read(min(stream.in_waiting or 1, 4096))
                    for byte in chunk:
                        if byte == 10:
                            if not discarding_line:
                                self._send("line", pending.rstrip(b"\r").decode("ascii", "replace"))
                            pending.clear()
                            discarding_line = False
                        elif not discarding_line:
                            pending.append(byte)
                            if len(pending) > 4096:
                                self._send("parse_error", "UART 行超过 4096 字节；已丢弃该行")
                                pending.clear()
                                discarding_line = True
                if pending:
                    self._send("parse_error", "断开时存在不完整的 UART 行，未计入窗口")
        except Exception as exc:
            self._send("serial_error", str(exc))
        finally:
            self._send("disconnected", self.port)


class Dashboard:
    def __init__(self, root: tk.Tk, initial_port: str = "") -> None:
        self.root = root
        root.title("基于 Zynq 的旋转机械振动状态监测系统")
        root.geometry("1600x900")
        root.minsize(1200, 740)
        root.configure(bg=BG)

        self.mode = "idle"  # idle, live, demo
        self.reader: SerialReader | None = None
        self.messages: queue.Queue = queue.Queue(maxsize=5000)
        self.decoder = UartDecoder()
        self.sequence = SequenceTracker()
        self.calibration = BaselineCalibration()
        self.recorder: CsvRecorder | None = None
        self.history: deque[tuple[float, int, float]] = deque(maxlen=240)
        self.paused = False
        self.parse_errors = 0
        self.pc_gap_events = 0
        self.skipped_windows = 0
        self.latest_status: int | None = None
        self.latest_drops: int | None = None
        self.last_received_monotonic: float | None = None
        self.demo_random = random.Random(2026)
        self.demo_seq = 0
        self.demo_rows = 0
        self.demo_generation = 0

        self.port_var = tk.StringVar(value=initial_port)
        self.baud_var = tk.StringVar(value="115200")
        self.phase_var = tk.StringVar(value="正常运行")
        self.connection_var = tk.StringVar(value="未连接 · 实机未验证（本次运行）")
        self.mode_var = tk.StringVar(value="未连接")
        self.raw_var = tk.StringVar(value="最近报文：—")
        self.hardware_var = tk.StringVar(value="硬件状态：尚无有效窗口")
        self.rule_var = tk.StringVar(value="未标定：先固定工况采集 30 个正常基线窗口；目前不输出状态判定")
        self.stats_var = tk.StringVar(value="解析失败 0  ·  序号跳变 0  ·  跳过窗口 0")
        self.enhanced_var = tk.StringVar()
        self.alarm_var = tk.StringVar()
        self.metric_vars = {
            key: tk.StringVar(value="—") for key in (
                "seq", "peak", "rms", "count", "status", "drops", "time", "ps_skipped"
            )
        }
        self._build_ui()
        self.refresh_ports()
        root.protocol("WM_DELETE_WINDOW", self.close)
        root.after(80, self._poll_messages)
        root.after(1000, self._check_stale)

    def _label(self, parent, text: str, *, size=11, fg=TEXT, bold=False, **pack):
        font = ("Microsoft YaHei UI", size, "bold" if bold else "normal")
        label = tk.Label(parent, text=text, bg=parent.cget("bg"), fg=fg, font=font)
        label.pack(**pack)
        return label

    def _button(self, parent, text, command):
        return tk.Button(parent, text=text, command=command, bg="#263954", fg=TEXT,
                         activebackground="#365675", activeforeground="white",
                         relief="flat", padx=10, pady=5)

    def _build_ui(self) -> None:
        header = tk.Frame(self.root, bg=BG)
        header.pack(fill="x", padx=24, pady=(14, 8))
        self._label(header, "基于 Zynq 的旋转机械振动状态监测系统",
                    size=22, bold=True, anchor="w")
        self._label(header, "LIS3DH → PL SPI / FIFO / 16点 X轴特征 → AXI4-Lite → PS ARM → UART0 → PC",
                    size=11, fg=MUTED, anchor="w")
        self._label(header, "仅展示原始 X 轴计数；包含重力/直流。阈值提示是工况幅值变化，不是机械故障诊断。",
                    size=10, fg=ORANGE, anchor="w")

        control = tk.Frame(self.root, bg=PANEL)
        control.pack(fill="x", padx=24, pady=5)
        left = tk.Frame(control, bg=PANEL)
        left.pack(side="left", padx=12, pady=8)
        self._label(left, "COM", side="left", padx=(0, 4))
        self.port_box = ttk.Combobox(left, textvariable=self.port_var, width=12)
        self.port_box.pack(side="left")
        self._button(left, "刷新", self.refresh_ports).pack(side="left", padx=4)
        self._label(left, "波特率", side="left", padx=(12, 4))
        ttk.Combobox(left, textvariable=self.baud_var, width=10,
                     values=("115200", "57600", "38400", "9600")).pack(side="left")
        self._button(left, "连接实机", self.connect).pack(side="left", padx=(12, 4))
        self._button(left, "断开", self.disconnect).pack(side="left", padx=4)
        self._button(left, "离线 Demo", self.toggle_demo).pack(side="left", padx=4)

        line = tk.Frame(self.root, bg=BG)
        line.pack(fill="x", padx=24, pady=(2, 4))
        self._label(line, "模式：", side="left", fg=MUTED)
        tk.Label(line, textvariable=self.mode_var, bg=BG, fg=ORANGE,
                 font=("Microsoft YaHei UI", 14, "bold")).pack(side="left")
        tk.Label(line, textvariable=self.connection_var, bg=BG, fg=GREEN,
                 font=("Microsoft YaHei UI", 11)).pack(side="right")

        card_area = tk.Frame(self.root, bg=BG)
        card_area.pack(fill="x", padx=18, pady=4)
        cards = (
            ("SEQ · 窗口序号", "seq"), ("Peak · counts", "peak"),
            ("原始窗口 RMS · counts", "rms"), ("窗口样本数", "count"),
            ("STATUS · 当前读值", "status"), ("DROP · PL 拒收累计", "drops"),
            ("电脑接收时间", "time"), ("PS 跳过窗口", "ps_skipped"),
        )
        for index, (title, key) in enumerate(cards):
            card = tk.Frame(card_area, bg=PANEL, padx=14, pady=8)
            card.grid(row=index // 4, column=index % 4, sticky="nsew", padx=5, pady=5)
            card_area.grid_columnconfigure(index % 4, weight=1)
            self._label(card, title, fg=MUTED, anchor="w")
            tk.Label(card, textvariable=self.metric_vars[key], bg=PANEL, fg=TEXT,
                     font=("Consolas", 19, "bold"), anchor="w").pack(fill="x")

        tools = tk.Frame(self.root, bg=PANEL)
        tools.pack(fill="x", padx=24, pady=5)
        self._label(tools, "阶段", side="left", padx=(12, 4))
        ttk.Combobox(tools, textvariable=self.phase_var, values=PHASES,
                     state="readonly", width=12).pack(side="left")
        self._button(tools, "开始 CSV 记录", self.start_recording).pack(side="left", padx=(12, 4), pady=7)
        self._button(tools, "停止记录", self.stop_recording).pack(side="left", padx=4)
        self._button(tools, "暂停/继续显示", self.toggle_pause).pack(side="left", padx=4)
        self._button(tools, "清空曲线", self.clear_history).pack(side="left", padx=4)
        self._button(tools, "对比两组 CSV", self.compare_files).pack(side="left", padx=4)

        calibration_row = tk.Frame(self.root, bg=PANEL)
        calibration_row.pack(fill="x", padx=24, pady=5)
        self._button(calibration_row, "采集正常基线 30 条", self.start_baseline).pack(side="left", padx=12, pady=7)
        self._label(calibration_row, "增强阈值 Peak≥", side="left", fg=MUTED, padx=(10, 2))
        tk.Entry(calibration_row, textvariable=self.enhanced_var, width=8).pack(side="left")
        self._label(calibration_row, "超阈值 Peak≥", side="left", fg=MUTED, padx=(12, 2))
        tk.Entry(calibration_row, textvariable=self.alarm_var, width=8).pack(side="left")
        self._button(calibration_row, "应用（须先采基线）", self.apply_thresholds).pack(side="left", padx=10)
        tk.Label(self.root, textvariable=self.rule_var, bg=BG, fg=ORANGE,
                 font=("Microsoft YaHei UI", 10), anchor="w").pack(fill="x", padx=26)

        self.figure = Figure(figsize=(11, 4), dpi=100, facecolor=BG)
        self.axes = [self.figure.add_subplot(211), self.figure.add_subplot(212)]
        self.lines = []
        for axis, title, color in zip(self.axes,
                                      ("Peak · counts", "原始窗口 RMS · counts（含重力/直流）"),
                                      (BLUE, ORANGE)):
            axis.set_facecolor(PANEL)
            axis.tick_params(colors=MUTED, labelsize=8)
            for spine in axis.spines.values():
                spine.set_color("#44566F")
            axis.grid(True, color="#33445D", alpha=0.7)
            axis.set_ylabel(title, color=TEXT, fontsize=9)
            self.lines.append(axis.plot([], [], color=color, linewidth=2)[0])
        self.axes[1].set_xlabel("电脑接收时间 · 相对秒", color=MUTED, fontsize=9)
        self.figure.subplots_adjust(left=0.11, right=0.985, top=0.97, bottom=0.13, hspace=0.32)
        self.canvas = FigureCanvasTkAgg(self.figure, master=self.root)
        self.canvas.get_tk_widget().pack(fill="both", expand=True, padx=24, pady=4)

        bottom = tk.Frame(self.root, bg=BG)
        bottom.pack(fill="x", padx=24, pady=(3, 12))
        tk.Label(bottom, textvariable=self.raw_var, bg=BG, fg=MUTED, anchor="w",
                 font=("Consolas", 10)).pack(fill="x")
        tk.Label(bottom, textvariable=self.hardware_var, bg=BG, fg=ORANGE, anchor="w",
                 font=("Microsoft YaHei UI", 10)).pack(fill="x")
        tk.Label(bottom, textvariable=self.stats_var, bg=BG, fg=MUTED, anchor="w").pack(fill="x")
        self.log = tk.Text(bottom, bg=PANEL, fg=TEXT, height=4, relief="flat", wrap="word")
        self.log.pack(fill="x", pady=(4, 0))
        self._log("准备就绪；请选择实机串口，或启动明确标记的离线 Demo。")

    def _log(self, message: str) -> None:
        self.log.insert("end", f"{datetime.now().strftime('%H:%M:%S')}  {message}\n")
        if int(self.log.index("end-1c").split(".")[0]) > 150:
            self.log.delete("1.0", "51.0")
        self.log.see("end")

    def refresh_ports(self) -> None:
        try:
            from serial.tools import list_ports
            ports = [port.device for port in list_ports.comports()]
            self.port_box.configure(values=ports)
            if ports and not self.port_var.get():
                self.port_var.set(ports[0])
            if not ports:
                self._log("当前未发现 COM 口；可使用离线 Demo 检查界面。")
        except ImportError:
            self.port_box.configure(values=())
            self._log("未安装 pyserial；实机连接需先安装 requirements.txt。")

    def _new_session(self) -> None:
        self.decoder = UartDecoder()
        self.sequence.reset()
        self.calibration.reset()
        self.latest_status = None
        self.latest_drops = None
        self.last_received_monotonic = None
        self.parse_errors = 0
        self.pc_gap_events = 0
        self.skipped_windows = 0
        self.paused = False
        self.hardware_var.set("硬件状态：尚无有效窗口")
        for value in self.metric_vars.values():
            value.set("—")
        self.clear_history()
        self.rule_var.set("未标定：先固定工况采集 30 个正常基线窗口；目前不输出状态判定")
        self.enhanced_var.set("")
        self.alarm_var.set("")

    def connect(self) -> None:
        if self.reader and self.reader.is_alive():
            messagebox.showwarning("串口尚未释放", "请先断开并等待约 1 秒。")
            return
        # A previous reader has fully exited. Discard its queued disconnect
        # event so it cannot mark the new connection as disconnected.
        while True:
            try:
                self.messages.get_nowait()
            except queue.Empty:
                break
        self.reader = None
        if self.mode == "demo":
            self.toggle_demo()
        if self.recorder:
            self.stop_recording()
        port = self.port_var.get().strip()
        try:
            baud = int(self.baud_var.get())
            if not port or baud <= 0:
                raise ValueError("请选择 COM 口和正波特率")
            import serial  # noqa: F401 -- explicitly test dependency before starting.
        except (ValueError, ImportError) as exc:
            messagebox.showerror("无法连接", str(exc))
            return
        self._new_session()
        self.mode = "live"
        self.mode_var.set("实机串口 · 等待连接")
        self.connection_var.set(f"正在打开 {port} · {baud} · 8N1")
        self.reader = SerialReader(port, baud, self.messages)
        self.reader.start()

    def disconnect(self) -> None:
        if self.reader:
            self.reader.stop_requested.set()
        if self.mode == "live":
            self.mode = "idle"
            self.mode_var.set("未连接")
            self.connection_var.set("已请求断开 COM 口")
            self._log("已请求关闭串口；切换串口助手前请确认端口已释放。")
            self.stop_recording()

    def toggle_demo(self) -> None:
        if self.mode == "demo":
            self.demo_generation += 1
            self.mode = "idle"
            self.mode_var.set("未连接")
            self.connection_var.set("离线 Demo 已停止")
            self.stop_recording()
            self._log("模拟数据已停止。")
            return
        if self.reader and self.reader.is_alive():
            messagebox.showwarning("请先断开", "先关闭实机串口，再启动离线 Demo。")
            return
        if self.recorder:
            self.stop_recording()
        self._new_session()
        self.demo_generation += 1
        generation = self.demo_generation
        self.mode = "demo"
        self.demo_seq, self.demo_rows = 0, 0
        self.mode_var.set("模拟数据 · 非实测")
        self.connection_var.set("离线 Demo；未连接开发板")
        self._handle_line("# source=SIMULATED; axis=X; unit=raw_count; rms_includes_DC")
        self._handle_line(HEADER)
        self._demo_tick(generation)

    def _demo_tick(self, generation: int) -> None:
        if self.mode != "demo" or generation != self.demo_generation:
            return
        if self.demo_rows and self.demo_rows % 20 == 0:
            self._handle_line("# source=SIMULATED; axis=X; unit=raw_count; rms_includes_DC")
            self._handle_line(HEADER)
        self.demo_seq = 1 if self.demo_rows == 0 else (self.demo_seq + 3) & 0xFFFFFFFF
        self.demo_rows += 1
        center = {"停机": 20, "正常运行": 35, "受控扰动": 95, "其他": 50}[self.phase_var.get()]
        samples = [max(-32768, min(32767, center + self.demo_random.randint(-8, 8)))
                   for _ in range(16)]
        peak = max(abs(x) for x in samples)
        total = sum(x * x for x in samples)
        self._handle_line(
            f"{self.demo_seq},{peak},{total >> 32:08X},{total & 0xFFFFFFFF:08X},"
            f"16,{0 if self.demo_rows == 1 else 2},00000011,0"
        )
        self.root.after(500, lambda: self._demo_tick(generation))

    def _poll_messages(self) -> None:
        for _ in range(300):
            try:
                kind, value = self.messages.get_nowait()
            except queue.Empty:
                break
            if kind == "connected" and self.mode == "live":
                self.mode_var.set("实机串口 · LIVE")
                self.connection_var.set(f"已打开 {value}；等待协议表头（最长约 10 秒）")
                self._log(f"串口 {value} 已打开；目前尚未确认收到有效窗口。")
            elif kind == "line" and self.mode == "live":
                try:
                    self._handle_line(value)
                except (OSError, ValueError) as exc:
                    self._log(f"记录/解析处理异常：{exc}")
                    self.connection_var.set("接收处理中断；请检查磁盘和 CSV 文件")
                    if self.recorder:
                        self.stop_recording()
            elif kind in {"parse_error", "serial_error"}:
                self.parse_errors += 1
                self._log(f"{kind}: {value}")
                if self.recorder:
                    self.recorder.event("serial_error" if kind == "serial_error" else "parse_error", value)
                if kind == "serial_error" and self.mode == "live":
                    self.mode_var.set("串口异常 · 已断开")
                    self.connection_var.set(value)
                    self.mode = "idle"
                    self.stop_recording()
            elif kind == "disconnected":
                if self.mode == "live":
                    self.mode = "idle"
                    self.mode_var.set("串口已断开")
                    self.stop_recording()
                self.connection_var.set(f"{value} 已关闭；可切换到串口助手")
        if self.reader and self.reader.queue_overflow:
            lost = self.reader.queue_overflow
            self.reader.queue_overflow = 0
            self.parse_errors += lost
            self._log(f"UI 队列溢出，丢弃 {lost} 条串口事件；本次显示/记录不完整")
            if self.recorder:
                self.recorder.event("serial_error", f"UI 队列溢出 {lost} 条")
        self._update_stats()
        self.root.after(80, self._poll_messages)

    def _handle_line(self, line: str) -> None:
        self.raw_var.set("最近报文：" + line[:170])
        event = self.decoder.feed_line(line)
        if event.kind == "error":
            self.parse_errors += 1
            self._log(f"报文拒收：{event.message} | {line[:100]}")
            if self.recorder:
                self.recorder.event("parse_error", event.message, line)
            return
        if event.kind == "info":
            if event.message or line.startswith(("# source=", "# STOP", "snapshot_rc=")):
                self._log(event.message or line)
            if line == "Hello Zynq":
                self.sequence.reset()
                self.calibration.reset()
                self.rule_var.set("设备重启；基线已清除，需要重新标定")
            return
        if event.kind == "header":
            self._log("已识别固件精确 CSV 表头；开始校验窗口行。")
            return
        measurement = event.measurement
        assert measurement is not None
        if self.mode == "live" and measurement.source == "SIMULATED":
            self.parse_errors += 1
            self._log("实机模式拒收标记为 SIMULATED 的报文。")
            if self.recorder:
                self.recorder.event("parse_error", "实机模式收到 SIMULATED 来源", line)
            return
        sequence = self.sequence.observe(measurement.sequence)
        if sequence.kind == "gap":
            self.pc_gap_events += 1
            self.skipped_windows += sequence.skipped
            if self.recorder:
                self.recorder.event("sequence_gap", f"窗口序号跳过 {sequence.skipped}", line)
        elif sequence.kind in {"duplicate", "backward_or_reset"}:
            self._log(f"序号异常：{sequence.kind}；检查设备重启/报文顺序。")
            if self.recorder:
                self.recorder.event("sequence_anomaly", sequence.kind, line)
        if self.recorder:
            self.recorder.record(measurement, self.phase_var.get(), sequence)
        self.last_received_monotonic = time.monotonic()
        self._update_measurement(measurement)
        if not self.paused:
            self.history.append((self.last_received_monotonic, measurement.peak,
                                 measurement.raw_rms))
            self._draw_history()
        if self.calibration.pending is not None:
            if (self.phase_var.get() != "正常运行" or measurement.source == "UNKNOWN"
                    or measurement.sample_count != 16 or not (measurement.status & 1)
                    or (measurement.status & 2)):
                self._log("基线只采纳正常运行、来源明确且初始化正常的 16 点窗口。")
            else:
                finished = self.calibration.add(measurement.peak)
                if finished:
                    self.enhanced_var.set(str(finished.enhanced))
                    self.alarm_var.set(str(finished.alarm))
                    self._log(f"基线完成：{finished.points} 条；Peak 中位数 {finished.baseline_peak:.1f} counts。")
                    self._show_rule()
                else:
                    self.rule_var.set(f"正在采集正常基线：{len(self.calibration.pending)}/{self.calibration.target} 条")
        if measurement.source == "UNKNOWN":
            classification = "来源未确认，阈值判定暂停"
        elif measurement.sample_count != 16 or not (measurement.status & 1) or (measurement.status & 2):
            classification = "采集状态异常，阈值判定暂停"
        else:
            classification = self.calibration.classify(measurement.peak)
        if classification.startswith(("超阈值", "振动增强")):
            if self.recorder:
                self.recorder.event("threshold_event", classification, line)
            self._log(classification + f"，Peak={measurement.peak} counts")
        if not self.paused:
            self.connection_var.set(f"{measurement.source} | {classification}")
        self._update_stats()

    def _update_measurement(self, item: Measurement) -> None:
        previous_status, previous_drops = self.latest_status, self.latest_drops
        self.latest_status, self.latest_drops = item.status, item.drop_count
        self.hardware_var.set(
            f"硬件状态：{' / '.join(status_labels(item.status))}；"
            "sensor_overrun 是历史锁存，非实时持续报警"
        )
        if previous_status is None or (item.status & ~previous_status & 0x0E):
            if item.status & 0x0E:
                detail = "STATUS 诊断位：" + "、".join(status_labels(item.status)) + "；bit2 是历史锁存，不是连续报警。"
                self._log(detail)
                if self.recorder:
                    self.recorder.event("hardware_status", detail, item.raw_line)
        if previous_drops is not None and item.drop_count > previous_drops:
            detail = f"DROP_COUNT 增加 {item.drop_count - previous_drops}；这与传感器内部 overrun 不同。"
            self._log(detail)
            if self.recorder:
                self.recorder.event("hardware_status", detail, item.raw_line)
        if self.paused:
            return
        values = {
            "seq": str(item.sequence), "peak": str(item.peak),
            "rms": f"{item.raw_rms:.2f}", "count": str(item.sample_count),
            "status": f"0x{item.status:08X}", "drops": str(item.drop_count),
            "time": item.received_at.strftime("%H:%M:%S.%f")[:-3],
            "ps_skipped": str(item.ps_skipped),
        }
        for key, value in values.items():
            self.metric_vars[key].set(value)

    def _draw_history(self) -> None:
        if not self.history:
            for line in self.lines:
                line.set_data([], [])
            self.canvas.draw_idle()
            return
        start = self.history[0][0]
        xs = [item[0] - start for item in self.history]
        for axis, line, index in zip(self.axes, self.lines, (1, 2)):
            ys = [item[index] for item in self.history]
            line.set_data(xs, ys)
            axis.set_xlim(max(0, xs[-1] - 120), max(10, xs[-1] + 1))
            axis.set_ylim(0, max(10, max(ys) * 1.15))
        self.canvas.draw_idle()

    def _update_stats(self) -> None:
        self.stats_var.set(
            f"解析/串口异常 {self.parse_errors}  ·  窗口序号跳变 {self.pc_gap_events}  ·  "
            f"跳过窗口 {self.skipped_windows}  ·  CSV {'正在记录' if self.recorder else '未记录'}"
        )

    def _check_stale(self) -> None:
        if self.mode == "live" and self.last_received_monotonic is not None:
            if time.monotonic() - self.last_received_monotonic > 3:
                self.connection_var.set("超过 3 秒未收到有效窗口；请检查固件与串口")
        self.root.after(1000, self._check_stale)

    def toggle_pause(self) -> None:
        self.paused = not self.paused
        self._log("显示已暂停，串口接收和 CSV 记录继续" if self.paused else "显示已继续")

    def clear_history(self) -> None:
        self.history.clear()
        if hasattr(self, "lines"):
            self._draw_history()
        self._log("只清空屏幕曲线；不会删除已保存 CSV 或重置设备计数。")

    def start_baseline(self) -> None:
        if self.mode not in {"live", "demo"}:
            messagebox.showwarning("尚无数据", "先连接实机或启动离线 Demo。")
            return
        if self.phase_var.get() != "正常运行":
            messagebox.showwarning("阶段不符", "先把阶段设为“正常运行”并保持固定工况。")
            return
        self.calibration.start(30)
        self.rule_var.set("基线采集中：0/30；在完成前不输出正常/增强/超阈值")
        self._log("开始采集 30 条正常运行基线；请固定姿态、转速和安装方式。")

    def apply_thresholds(self) -> None:
        try:
            self.calibration.adjust(int(self.enhanced_var.get()), int(self.alarm_var.get()))
        except ValueError as exc:
            messagebox.showerror("阈值无效", str(exc))
            return
        self._show_rule()

    def _show_rule(self) -> None:
        threshold = self.calibration.thresholds
        if threshold is None:
            return
        self.rule_var.set(
            f"正常基线 Peak 中位数 {threshold.baseline_peak:.1f}、MAD {threshold.mad_peak:.1f} counts；"
            f"Peak≥{threshold.enhanced} 为增强，Peak≥{threshold.alarm} 为超阈值。"
            "仅原始 X 轴计数，姿态/重力变化也可能触发。"
        )

    def start_recording(self) -> None:
        if self.recorder:
            messagebox.showinfo("已在记录", str(self.recorder.path))
            return
        path = filedialog.asksaveasfilename(
            title="新建 CSV（不会覆盖已有文件）", defaultextension=".csv",
            filetypes=[("CSV", "*.csv")],
            initialfile="vibration_" + datetime.now().strftime("%Y%m%d_%H%M%S") + ".csv",
        )
        if not path:
            return
        try:
            self.recorder = CsvRecorder(path)
        except (OSError, ValueError) as exc:
            messagebox.showerror("无法记录", str(exc))
            return
        self._log(f"开始记录：{path}；来源={self.mode}，阶段={self.phase_var.get()}")
        self._update_stats()

    def stop_recording(self) -> None:
        if not self.recorder:
            return
        path = self.recorder.path
        try:
            self.recorder.close()
        except OSError as exc:
            self._log(f"保存记录时发生磁盘错误：{exc}；请检查 {path}")
        finally:
            self.recorder = None
        self._log(f"已保存 {path}、.events.csv 和 .summary.json")
        self._update_stats()

    def compare_files(self) -> None:
        first = filedialog.askopenfilename(title="选择 A 组 CSV", filetypes=[("CSV", "*.csv")])
        if not first:
            return
        second = filedialog.askopenfilename(title="选择 B 组 CSV", filetypes=[("CSV", "*.csv")])
        if not second:
            return
        try:
            result = compare_captures(first, second)
        except (OSError, ValueError, KeyError) as exc:
            messagebox.showerror("对比失败", str(exc))
        else:
            messagebox.showinfo("两组 CSV 简单对比", result)

    def close(self) -> None:
        self.disconnect()
        self.stop_recording()
        self.root.destroy()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--port", default="", help="初始 COM 口，如 COM5；不自动连接")
    parser.add_argument("--demo", action="store_true", help="打开界面后启动明显标记的模拟数据")
    args = parser.parse_args()
    root = tk.Tk()
    dashboard = Dashboard(root, args.port)
    if args.demo:
        root.after(200, dashboard.toggle_demo)
    root.mainloop()


if __name__ == "__main__":
    main()
