# 板卡依据与 Vitis 2023.2 流程

## 已确认的资料

用户提供的硬件 ZIP 包含核心板原理图 V2.5（12 页）、底板原理图 V3.9（7 页）、开发板规格书 V1.2（41 页）、引脚表、XDC、走线长度和改版说明。没有 XSA、PS preset Tcl/XML、完整嵌入式开发教程或 Hello World 示例工程。

规格书属于硬件用户资料，并不等同于完整软件开发手册。厂家发布过《领航者 ZYNQ 之嵌入式开发指南》，第一章为 Hello World；其旧版 SDK 界面不能照搬到 Vitis 2023.2。厂家资料入口本次访问失败，完整手册未下载：
http://www.openedv.com/docs/boards/FPGA/zdyz_linhanz.html

| 项目 | 资料依据与结论 |
| --- | --- |
| 器件 | 用户确认 XC7Z020CLG400-2；Vivado part 名应核对为 xc7z020clg400-2 |
| PS UART | 核心板原理图第 4 页：MIO14/C5 为 UART_RXD，MIO15/C8 为 UART_TXD；对应 PS UART1 路由 |
| PS 参考时钟 | 同页 X2 为 33.333333 MHz；不能把 PL 的 50 MHz 填入 PS 输入时钟 |
| MIO 电压 | 核心板原理图：Bank500 为 3.3 V，Bank501 为 1.8 V |
| DDR | 核心板原理图第 8 页及规格书第 14 页：7020 版两片 NT5CC256M16，32-bit 总线、合计 1 GB；具体时序和走线补偿仍须使用匹配厂商配置或已验证 XSA |
| USB UART | 底板原理图第 6 页：U14 CH340C，经 P5 与 PS/PL 选择连接 |
| P5 跳帽 | 规格书第 28 页：PS 使用 1–3、2–4；PL 使用 3–5、4–6。按实板针号辨认，不凭照片上下方向判断 |
| JTAG 启动 | 规格书第 26 页：BOOT 两位拨码都 ON 为 JTAG；先核对实板版本及丝印 |

实际共用板子的版本仍需与上述资料核对。底板新版已更换部分外设，不能将旧教程全板配置直接当成实板配置。串口测试使用 USB UART 口，不是 USB SLAVE 口；USB UART 连接不等于 JTAG 下载器连接。

## 安装准备

与队伍 Vivado 2023.2 对齐，选 Vitis Embedded 2023.2 Windows。官方归档页提供约 5.1 GB 的 Windows 独立安装包，明确支持 Zynq-7000：
https://www.amd.com/en/support/downloads/adaptive-socs-and-fpgas/development-tools/2023-2.html

已打开对应下载入口，当前需要 AMD 账号登录。未下载或安装成功。此电脑的 PATH、常见安装目录、开始菜单及安装记录中未找到 Vitis/Vivado；这不证明其它自定义目录绝对不存在。队长电脑的 Vivado 版本不代表本机已有工具。

若队长能提供匹配 XSA，PS 开发电脑可先只装 Vitis Embedded；无需为了打印串口安装 Linux 或下载完整的上百 GB 全产品包。安装目录建议用英文路径，所需磁盘空间以安装器检查为准。

## 硬件平台输入

优先索取队长在 Vivado 2023.2 导出的、含 Zynq PS 的 XSA，以及 PS 配置截图或生成脚本。核对 UART1=MIO14..15、PS 输入时钟、DDR 型号/宽度/容量/时序、Bank 电压与板卡版本。

如果现有工程只有 PL，需由持有 Vivado 的电脑创建最小 Zynq PS 硬件平台：选择准确器件，添加 ZYNQ7 Processing System，使用匹配领航者 7020 的厂商 PS 配置，启用 UART1 路由并检查 DDR/时钟，验证设计后导出 XSA。不要选 ZC702、ZedBoard 或 PYNQ 的预设代替。DDR 时序、频率和板级延迟不可仅凭容量猜填。

第一阶段 UART 走 PS MIO，不需要自定义 AXI 外设。纯 PS 工程可按 AMD 教程采用不含 bitstream 的 XSA；若后续使用带 PL 的整体平台，应以队长提供的配套文件为准。MIO 不用在 PL 的 XDC 中重新约束。

## Vitis Unified IDE 2023.2

以下为依据官方文档整理的待执行流程，尚未在本机安装后逐项验证。

1. 建立独立英文路径工作区，例如 `vitis_workspace/navigator_ps`。不要把 IDE 生成目录直接放进受版本控制的源码目录。
2. 创建 Platform Component，选择 Hardware Design/XSA 文件。
3. 处理器选 `ps7_cortexa9_0`，操作系统选 `standalone`。创建并构建平台；检查域的 BSP 配置，将 stdin/stdout 指向物理 `ps7_uart_1` 或其在该版本生成的对应名称。
4. 在 Examples 中选择 Hello World，创建 Application Component，关联上述平台和 standalone 域。不要选择 Linux 应用或硬件加速平台示例。
5. 先构建原始 Hello World，确认 XSA/BSP/工具链可用，再替换 main 源文件。保留模板的 `platform.c`、`platform.h`、链接脚本和构建描述；删除/排除原来含 main 的示例源文件，防止重复定义。
6. 构建 `DEMO_ENABLE_XYZ=0` 的 Hello 版本，再构建默认值 1 的模拟数据版本。保存完整构建日志；检查 ELF 是 Cortex-A9 裸机目标。
7. 在 BSP 或生成的初始化代码中确认串口初始化和波特率。`xil_printf` 不负责配置 MIO 路由，也不保证自行设置波特率；`platform.c`、PS 初始化和域配置应一起检查。

2023.2 同时存在 Classic 与 Unified 流程。Classic 中对应 Platform Project/Application Project；不要混用 Classic 的 XSCT 教程与 Unified 的组件生成流程。具体以安装后可用 IDE 为准。

## 共用板卡时的验收

1. 与队长记录当前启动拨码、P5 跳帽和正在运行的 PL 实验；约定停机窗口后再做复位和下载。
2. 断电后按实板针号把 P5 改到 PS 侧，核对 JTAG 启动配置；连接合适电源、JTAG 下载器和 USB UART。
3. 在电脑设备管理器确定 CH340 对应 COM 口，终端设 115200、8N1、无流控，开启原始文本日志。
4. 使用 Vitis 的匹配平台启动/调试配置执行 PS 初始化，再下载 ELF。确认在 main 处能停住后继续运行。不要仅下载 ELF 而跳过必要的 PS/DDR 初始化。
5. Hello-only 版本应打印一次 `Hello Zynq`。默认版本应继续输出 SIMULATED 标记、CSV 表头与递增序号。
6. 默认版本连续观察至少 60 秒；记录实际持续时间和行数，保存日志并运行校验工具。时间需要独立记录，不能只靠行数推算。首次验收不写 QSPI/eMMC/SD 启动镜像。
7. 完成后按约定恢复共用板卡设置；分别记录 PS 程序版本与队长 PL 工程版本。

常见故障：无 COM 口先查 USB 数据线与 CH340 驱动；能运行但无字查 P5、UART1 路由和 stdout；乱码查双方波特率与 PS 时钟；停在 main 前查 JTAG 连接、启动流程及 DDR 初始化；重复 main 错误查是否保留了两份示例主程序。

## 官方流程参考

- AMD UG1400 2023.2 Getting Started: https://docs.amd.com/r/2023.2-English/ug1400-vitis-embedded/Getting-Started-with-the-Vitis-Software-Platform
- AMD UG1400 2023.2 Creating an Application Component: https://docs.amd.com/r/2023.2-English/ug1400-vitis-embedded/Creating-an-Application-Component
- AMD UG1165 Hello World: https://docs.amd.com/r/2023.2-English/ug1165-zynq-embedded-design-tutorial/Example-2-Creating-and-Running-a-Hello-World-Application

AMD 示例板的跳线、UART 引脚与 DDR 参数不得照搬；领航者板级事实以上述本地厂商资料为依据。
