"""Non-overwriting CSV/event logging and simple comparison of two captures."""

from __future__ import annotations

import csv
import json
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from statistics import mean, median

from protocol import Measurement, SequenceEvent


FIELDS = (
    "received_local_iso", "source", "phase", "result_seq", "peak_raw_counts",
    "sumsq_hi_hex", "sumsq_lo_hex", "sum_squares_raw_counts_squared",
    "sample_count", "raw_window_rms_counts", "status_live_hex",
    "drops_live", "ps_skipped", "pc_seq_event", "pc_seq_gap",
    "raw_uart_line",
)
EVENT_FIELDS = ("received_local_iso", "kind", "detail", "raw_uart_line")


class CsvRecorder:
    def __init__(self, path: str | Path) -> None:
        self.path = Path(path)
        self.events_path = self.path.with_name(self.path.stem + ".events.csv")
        self.summary_path = self.path.with_name(self.path.stem + ".summary.json")
        for item in (self.path, self.events_path, self.summary_path):
            if item.exists():
                raise FileExistsError(f"拒绝覆盖已有文件: {item}")
        self.path.parent.mkdir(parents=True, exist_ok=True)
        self.data_file = self.path.open("x", newline="", encoding="utf-8-sig")
        try:
            self.event_file = self.events_path.open("x", newline="", encoding="utf-8-sig")
        except Exception:
            self.data_file.close()
            raise
        self.data_writer = csv.DictWriter(self.data_file, fieldnames=FIELDS)
        self.event_writer = csv.DictWriter(self.event_file, fieldnames=EVENT_FIELDS)
        self.data_writer.writeheader()
        self.event_writer.writeheader()
        self.stats = {"measurements": 0, "parse_errors": 0, "serial_errors": 0,
                      "sequence_gaps": 0, "anomaly_events": 0}
        self.closed = False

    def record(self, measurement: Measurement, phase: str, sequence: SequenceEvent) -> None:
        if self.closed:
            raise RuntimeError("CSV 已关闭")
        self.data_writer.writerow({
            "received_local_iso": measurement.received_at.isoformat(),
            "source": measurement.source,
            "phase": phase,
            "result_seq": measurement.sequence,
            "peak_raw_counts": measurement.peak,
            "sumsq_hi_hex": f"{measurement.sum_squares >> 32:08X}",
            "sumsq_lo_hex": f"{measurement.sum_squares & 0xFFFFFFFF:08X}",
            "sum_squares_raw_counts_squared": measurement.sum_squares,
            "sample_count": measurement.sample_count,
            "raw_window_rms_counts": f"{measurement.raw_rms:.6f}",
            "status_live_hex": f"{measurement.status:08X}",
            "drops_live": measurement.drop_count,
            "ps_skipped": measurement.ps_skipped,
            "pc_seq_event": sequence.kind,
            "pc_seq_gap": sequence.skipped,
            "raw_uart_line": measurement.raw_line,
        })
        self.data_file.flush()
        self.stats["measurements"] += 1

    def event(self, kind: str, detail: str, raw_line: str = "") -> None:
        if self.closed:
            raise RuntimeError("CSV 已关闭")
        self.event_writer.writerow({
            "received_local_iso": datetime.now().astimezone().isoformat(),
            "kind": kind, "detail": detail, "raw_uart_line": raw_line,
        })
        self.event_file.flush()
        if kind == "parse_error":
            self.stats["parse_errors"] += 1
        elif kind == "serial_error":
            self.stats["serial_errors"] += 1
        elif kind == "sequence_gap":
            self.stats["sequence_gaps"] += 1
        elif kind == "threshold_event":
            self.stats["anomaly_events"] += 1

    def close(self) -> None:
        if self.closed:
            return
        self.data_file.close()
        self.event_file.close()
        # Exclusive creation protects an earlier session's summary too.
        with self.summary_path.open("x", encoding="utf-8") as out:
            json.dump(self.stats, out, ensure_ascii=False, indent=2)
        self.closed = True


@dataclass(frozen=True)
class CaptureSummary:
    path: Path
    rows: int
    sources: tuple[str, ...]
    phases: tuple[str, ...]
    peak_median: float
    peak_mean: float
    rms_median: float


def summarize_capture(path: str | Path) -> CaptureSummary:
    """Accept this dashboard's CSV or teammate receiver's windows.csv."""
    path = Path(path)
    peaks: list[float] = []
    rms_values: list[float] = []
    sources: set[str] = set()
    phases: set[str] = set()
    with path.open(newline="", encoding="utf-8-sig") as source_file:
        reader = csv.DictReader(source_file)
        for row in reader:
            peak_text = row.get("peak_raw_counts") or row.get("peak_raw")
            sum_text = row.get("sum_squares_raw_counts_squared") or row.get("sum_squares_raw")
            count_text = row.get("sample_count")
            if not peak_text or not sum_text or not count_text:
                raise ValueError(f"缺少 Peak/平方和/样本数字段: {path}")
            peak, total, count = int(peak_text), int(sum_text), int(count_text)
            if count <= 0 or total < 0 or peak < 0:
                raise ValueError(f"CSV 数值非法: {path}")
            peaks.append(float(peak))
            rms_values.append((total / count) ** 0.5)
            sources.add(row.get("source", "UNKNOWN") or "UNKNOWN")
            phases.add(row.get("phase", "未标记") or "未标记")
    if not peaks:
        raise ValueError(f"CSV 没有有效窗口: {path}")
    return CaptureSummary(path, len(peaks), tuple(sorted(sources)),
                          tuple(sorted(phases)), median(peaks), mean(peaks),
                          median(rms_values))


def compare_captures(first: str | Path, second: str | Path) -> str:
    a, b = summarize_capture(first), summarize_capture(second)
    warning = "\n注意：两组来源不同，不可作为同类实测对比。" if a.sources != b.sources else ""
    return (
        f"A: {a.path.name} | {a.rows} 窗口 | 来源 {','.join(a.sources)} | 阶段 {','.join(a.phases)}\n"
        f"   Peak 中位数 {a.peak_median:.2f} counts，均值 {a.peak_mean:.2f} counts；"
        f"原始 RMS 中位数 {a.rms_median:.2f} counts\n"
        f"B: {b.path.name} | {b.rows} 窗口 | 来源 {','.join(b.sources)} | 阶段 {','.join(b.phases)}\n"
        f"   Peak 中位数 {b.peak_median:.2f} counts，均值 {b.peak_mean:.2f} counts；"
        f"原始 RMS 中位数 {b.rms_median:.2f} counts"
        f"{warning}\n仅比较原始 X 轴计数，不代表机械故障诊断。"
    )
