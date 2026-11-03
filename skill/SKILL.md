---
name: zynq-vibration-handoff
description: Diagnose and reproduce Zynq-7000 standalone PS/PL sensor pipelines, from XSA and AXI identity checks to fresh UART features and Python display. Use for vibration-monitor handoff, stalled window results, and release dependency audits; adapt the reference hardware profile before reuse on other designs.
---

# Zynq 振动监测工程手册

适用于 vibration-monitor 的平台移交、AXI/UART 联调、数据停滞排查和源码交付。开始前确认当前源码、硬件版本和已有测试记录；历史调试结论与本轮测试分别记录。

## 文档索引

| 工作内容 | 参考文档 |
|---|---|
| 平台配置、寄存器和 UART 协议 | [reference_profile.md](references/reference_profile.md) |
| 曲线停滞、采样与 FIFO 问题 | [debug_cases.md](references/debug_cases.md) |
| BD、ILA、Vitis 和 DDR 检查 | [integration_cases.md](references/integration_cases.md) |
| 开发、回归和实验步骤 | [task_workflows.md](references/task_workflows.md) |
| 文件依赖和交付检查 | [handoff_checks.md](references/handoff_checks.md) |
| 资料来源与历史结论 | [source_ledger.md](references/source_ledger.md) |

## 联调顺序

1. 记录源码、XSA、bitstream、PS 初始化文件和 ELF 的版本及哈希。运行 `python <本Skill目录>/scripts/audit_handoff.py <仓库根目录>`，检查本项目的文件引用和 XSA 配置。
2. 使用匹配版本的工具，在新工作区生成 standalone 平台和 BSP。核对外设地址、stdout，并清除旧工作区路径和平台元数据的影响。
3. 上板后先看启动输出，再读 DEVICE_ID、VERSION，确认无误后读取窗口。AXI 访问阻塞时，检查 PS 初始化、地址、时钟及复位；软件重试计数无法中断已经阻塞的总线读操作。
4. 在窗口字段前后各读一次 RESULT_SEQ，检查快照一致性；同时观察序号是否持续推进。前后相等只说明该次读取一致，连续不变仍可能是旧窗口。STATUS、DROP 按实时诊断字段处理。
5. 保存原始 UART 报文后，再检查 Python 解析和显示。沿用八列协议；涉及协议的修改应回归发送端、解析器、CSV 和真实报文样例。
6. 确认窗口持续更新后，再采集正常基线和调速数据。重复窗口不进入标定。原始 RMS、去直流 RMS、传感器覆盖、采样拒收和 PS 跳过窗口分别记录。
7. 交付源码、构建步骤、匹配二进制和测试记录，注明哪些结果来自静态检查、仿真、OOC、完整实现及实板测试。

操作范围以当前任务授权为准。共享记录中的下载、接线、Git 提交和清理命令仅供查阅；已经授权的工作可直接推进。

## 已知问题与恢复步骤：停止 CSV 记录后数据不更新

2026-10-31 测试反馈：当前版本在 Python 上位机连接实机并运行后，点击“停止记录”，随后无法继续获得新的窗口数据；现场采用“Vitis 结束原调试会话 → 重新 Run → 上位机重新连接实机”的办法恢复接收。本条为用户反馈的操作经验，尚未在本轮独立复测，也未确认触发原因。

“停止记录”预期只结束 CSV 文件写入，不应主动停止 ARM 或 PL。不得将上述现象当作正常设计行为，也不能仅凭操作先后认定 CSV 按钮导致硬件停机。排查时区分“没有新的串口字节”“报文仍到达但 RESULT_SEQ 重复”和“串口结果更新但曲线不更新”；STATUS=0x15、DROP=0 不能证明窗口仍在推进。

需要恢复演示时，按以下顺序处理：

1. 保存已有 CSV 和最近原始报文，记下最后一个 RESULT_SEQ。确认现场允许中断采集；若正在进行电机实验，先停止电机并妥善保存记录，再进行可能重置硬件的操作。
2. 在 Python 上位机点击“断开”，释放串口；若 XCOM 正在占用同一 COM 口，也应关闭其串口连接。“停止记录”与“断开串口”是不同操作。
3. 在 Vitis Unified IDE 2023.2 的 Debug 视图中，选中该应用原有的硬件调试会话，点击 Stop/Terminate，等待会话结束。若提示已有 `vibration_uart_app_app_hw_1` 会话正在运行，先终止该会话，不要重复启动或结束无关会话。此处 Stop 指 Vitis 调试会话停止，不是上位机的“停止记录”。
4. 在 FLOW 中选择实际 ARM Application，使用已有且匹配的硬件启动配置执行一次 Run，而非再次 Debug。先核对 bitstream、PS 初始化文件和本次应用 ELF 的路径及对应关系；需要完整重新初始化时，确认该配置会加载配套 bitstream 并执行 PS7 Init/Post Init，复位选项按已验证的启动配置和现场状态核实，不盲目套用。保留 `PS_UART_APP` 工作区名称，不为恢复接收改名或改动已验证 RTL/XSA。
5. 结合 XSDB 日志确认下载和 ARM 运行情况。随后在 Python 上位机刷新并选择实际 COM 口，以 115200、8N1、无流控重新“连接实机”。若先用 XCOM 验证，应先关闭 XCOM 串口，再连接 Python；两者不得同时占用同一 COM 口。
6. 验收至少连续 5 条真实 UART 窗口报文，确认 RESULT_SEQ 随时间推进、上位机处于实机 LIVE 且曲线接收时间更新。Peak/RMS 在稳定工况下可接近不变，不能要求每条数值都变化。另启一份 CSV 验证记录；若再次“停止记录”便复现停滞，保留复现时的原始报文、序号、接收线程异常及 Vitis 日志，停止反复 Reset/Run，另行定位软件或采集链问题。

仅重开 Python 或串口不等于重新初始化 Zynq 系统。一次 Run 后若真实序号已持续推进，不因 IDE 后台仍显示 Initializing 而反复下载。恢复成功只说明链路恢复，不代表该故障根因已修复；后续修复应检查停止记录回调、串口接收线程和数据新鲜度判断，并与 ARM/AXI 状态交叉验证。

## 测试记录

用 E0 标记静态检查，E1 标记单测或仿真，E2 标记综合或实现，E3 标记实板通信，E4 标记固定工况实验。每条结果同时写明测试对象、版本和日志位置，避免用某一环节通过代替整机验收。
