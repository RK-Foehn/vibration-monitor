# PC 实时监测上位机

当前提交目录名为 `software/pc_monitor`（原名 `competition_demo`）。本目录独立于 FPGA/Vitis 工程，通过 UART0 接收真实 PL 窗口结果。目录改名不等于 Vitis 平台迁移已完成；PS 侧说明见 `../ps_uart_app/README.md`。

本目录基于队友交付包 `F:\2026\PS_UART0_software_handoff_20261029\PS_UART0_software_handoff_20261029` 的**实板固定 CSV 协议**。`legacy/receiver.py`、`legacy/monitor.py` 是从该交付包按字节复制的原始工作版本，未修改；新仪表盘只复用其中 `receiver.parse_row` 的严格校验，不改变 ARM UART 协议。`tests/fixtures/real_uart_excerpt.txt` 是交付包中的真实原始报文摘录，保留 CRLF。不要将离线 Demo 视作板卡测试。

## 安装与运行（Windows / Python 3）

推荐 Python 3.10 及以上，并包含 Tkinter。在本目录打开 PowerShell，创建新的隔离环境（不要从其他电脑复制 `.venv`）：

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe -m unittest discover -s tests -v
.\.venv\Scripts\python.exe -m unittest discover -s legacy/tests -v
.\.venv\Scripts\python.exe dashboard.py
```

环境准备好后推荐双击 `run_windows_local.cmd`，它固定使用本目录的 `.venv` 并预检依赖。历史 `run_windows.cmd` 使用 PATH 中的 `python`，解释器不一致可能出现 `No module named serial`。如果按根 README 在仓库根创建了 `.venv`，请从根目录直接运行，不要误以为子目录脚本会使用根环境。

只检查界面可运行 `.\.venv\Scripts\python.exe dashboard.py --demo`，窗口顶部始终显示“模拟数据 · 非实测”。Python 安装须包含 Tkinter；可用 `.\.venv\Scripts\python.exe -m tkinter` 单独检查。串口仅在按“连接实机”后打开，参数默认 **115200、8 数据位、无校验、1 停止位、无流控**。刷新并选择设备管理器中实际出现的 COM 口；COM3/COM8 只是历史电脑上的编号，不能直接套用。

同一个 COM 口不能被串口助手、队友旧 `monitor.py`、`receiver.py` 与本仪表盘同时打开。先在串口助手中关闭串口，再在本仪表盘连接；反向切换时先点“断开”并等待端口释放。

## 已核对的线上报文

当前 `../ps_uart_app/vibration_uart_app/src/helloworld.c` 使用 `xil_printf` 经 BSP UART0 输出 ASCII、CRLF。每约 500 ms 读取一次最新窗口。每 20 条窗口会重复来源注释与精确表头：

```text
# source=PL; axis=X; unit=raw_count; rms_includes_DC
seq,peak_raw,sumsq_hi_hex,sumsq_lo_hex,n,skipped,status_live_hex,drops_live
1,28,00000000,00001D8A,16,0,00000015,0
```

第 1/2/5/6/8 列是无符号十进制；第 3/4/7 列是**无 `0x` 前缀的十六进制**。`SUMSQ=(hi<<32)|lo`；上述真实摘录的平方和为 `0x1D8A=7562`。`skipped` 是 PS 因 500 ms 轮询跳过的窗口数，不是 FIFO 丢帧。`STATUS` 与 `DROP` 是另读的实时诊断值，未包含在 RESULT_SEQ 的一致性快照中。启动可能输出 `Hello Zynq`、`DEVICE_ID`、`VERSION`、`#` 诊断行、`snapshot_rc=...`；这些不当作数据。半途连接会等待下一次表头（约 10 秒）。

`STATUS=0x15` 对应初始化完成、历史 `sensor_overrun` 锁存、已有结果快照。bit2 **不代表当前持续覆盖**。`DROP=0` 只表示采集到 FIFO 的帧未被拒收，不能证明传感器内部从未覆盖。详见 `fpga/docs/axi_register_map_v1.md`。

## 操作与判定

1. 设置测试阶段（停机、正常运行、受控扰动、其他），连接实机；确认窗口顶栏写的是“实机串口 · LIVE”且来源为 `PL`，并检查 SEQ 持续推进。LIVE 和接收时间只表示接收状态，重复旧窗口也可能刷新界面。如需留存，点击“开始 CSV 记录”。
2. 在姿态、转速、安装方式保持固定的“正常运行”工况下点击“采集正常基线 30 条”。仅采纳来源明确、初始化正常的 16 点窗口；完成前状态始终是“未标定”。来源未知、初始化错误或窗口样本数异常时，阈值判定暂停。
3. 自动阈值基于 30 条 Peak 的中位数 `M` 与中位数绝对偏差 `MAD`：增强阈值 `ceil(M+max(10,3*MAD,0.2*M))`；超阈值 `ceil(M+max(25,6*MAD,0.5*M))`，且超阈值至少比增强阈值大 1。界面展示两阈值；完成基线后可手工调整。`Peak≥增强` 显示“振动增强”，`Peak≥超阈值` 显示“超阈值”；这只是**原始 X 轴计数相对当前工况基线的变化提示**，不是机械故障诊断。换工况/姿态应重新标定。
4. “暂停显示”仅冻结卡片与曲线，后台接收、解析和 CSV 记录继续。“清空曲线”只清屏，不删记录。结束时“停止记录”，保存主 CSV、同名 `.events.csv` 与 `.summary.json`；已有文件一律拒绝覆盖。
5. “对比两组 CSV”给出窗口数、来源、测试阶段以及 Peak/原始 RMS 的中位数等；兼容队友 `receiver.py` 的 `windows.csv`。比较只用于同来源、同姿态/安装条件下的计数变化。

原始窗口 RMS = `sqrt(SUMSQ / SAMPLE_COUNT)`，单位 counts；**包括重力和直流分量**。现有寄存器没有 `SUM(X)` 或原始 16 点样本，无法精确计算去直流 AC RMS。没有实现或展示 FFT、频谱、故障准确率。

当前实现会记录重复 SEQ，仍可刷新曲线；基线采集也未自动剔除所有重复窗口。因此必须先确认序号正常推进再标定。发生冻结时应先停止实验并排查结果更新链路，不应通过扩大坐标轴、重贴模拟数据或随意调阈值掩盖问题。

## 文件与验证边界

- `protocol.py`：处理实际 UART 固定表头、启动行、行校验和 32 位序号回绕。
- `analysis.py`：基线与公开阈值规则。
- `storage.py`：CSV、事件和统计侧文件；简单跨工况比较。
- `dashboard.py`：Tkinter + Matplotlib；串口工作线程不阻塞 GUI。
- `legacy/`：队友原版接收器、旧显示器与 11 项原测试，保留以便对照，不覆盖其 F 盘原件。
- `tests/`：真实摘录回归、协议/状态/RMS/CSV/阈值测试。

自动测试和离线 Demo 均不能替代当前电脑上的 COM 口、实际 370 电机、已接线 LIS3DH 与连续运行的实机验证。串口助手 EXE 未由本项目启动；不要关闭杀毒软件或随意安装驱动。具体录屏顺序见 `VIDEO_DEMO.md`。

2026-11-02 目录改名后回归：新增测试9项通过，原接收器11项通过（含软件回环）；本轮没有打开真实 COM 口或重新进行电机实验。提交必须保留 `legacy/`、`tests/`、requirements 和启动脚本，排除 `.venv/`、`__pycache__/`。本机旧 `.venv` 依赖系统包，移机必须按依赖清单重建，不代表已完成干净环境安装验证。
