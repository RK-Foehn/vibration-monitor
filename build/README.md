# 完整工程构建与运行

工具：Vivado 2023.2（安装 Zynq-7000 器件支持）、Vitis 2023.2 Embedded、Python 3.10 或以上（包含 Tkinter）。建议解压到短的英文路径，例如 C:/fpga/vibration-monitor，避免 Windows 长路径限制。安装工具后可使用完整路径替换下文命令中的 vivado、vitis、xsct。

## 1. 查看或重建 FPGA 工程

直接打开 fpga/vivado/zynq_vibration_system/zynq_vibration_system.xpr。交付保留当前工程的 .srcs、.gen、.hw、.runs、IP 定义、生成 HDL、检查点和实现记录。原始生成运行记录可能含开发机路径；重建应从 XPR 或以下入口启动，不直接执行 .runs 下的旧生成脚本。

需要从源码重新综合时，先复制整份工程，在副本根目录执行：

```text
vivado -mode batch -source build/rebuild_fpga.tcl
```

脚本检查器件、验证 BD、生成 IP 输出产品、重新综合实现和生成 bitstream，并将新的带 bitstream XSA 及报告写入 build/generated。脚本会重置副本的 synth_1/impl_1 运行结果，不覆盖 board 中的交付文件。

## 2. 重建 ARM 平台和应用

使用交付的 UART0 XSA，在项目根目录执行：

```text
vitis -s software/ps_uart_app/build.py C:/fpga/vibration_workspace
```

工作区必须是新目录。脚本重新生成 standalone 平台、BSP、应用元数据及 ELF，检查 UART0、AXI 地址，并输出 build_result.json。原始 C/H、链接脚本和 CMake 配置位于 software/ps_uart_app/vibration_uart_app/src。

若使用步骤 1 新生成的硬件，在构建副本中将 build/generated/zynq_vibration_system_uart0.xsa 复制到 fpga/vivado/zynq_vibration_system/zynq_vibration_system_uart0.xsa，再使用另一个新工作区执行上述命令。

## 3. 运行交付的上板文件

连接领航者 XC7Z020 电源、JTAG 下载器和 USB_UART，启动硬件服务器。确认只有目标板接入，并关闭占用串口的程序。先检查路径（不连接板卡）：

```text
xsct board/program_board.tcl --check-only
```

实际下载并运行：

```text
xsct board/program_board.tcl
```

该命令复位目标系统，加载 board 中的 bitstream、PS 初始化和应用 ELF，运行 Cortex-A9 核 0，不写入 Flash。UART0 使用 115200、8N1、无流控。先观察 DEVICE_ID=0x56494231、VERSION=0x00010000，再看 RESULT_SEQ 持续增长和真实窗口输出。

program_board.tcl 的命令顺序来自此前实板下载脚本，本版将绝对路径改为包内相对位置。本轮路径检查与实板执行的结果分别写在 results/reproduction.md。

## 4. 安装并运行上位机

在 software/pc_monitor 目录执行：

```text
python -m venv .venv
.venv/Scripts/python -m pip install -r requirements.txt
.venv/Scripts/python -m unittest discover -s tests -v
.venv/Scripts/python -m unittest discover -s legacy/tests -v
.venv/Scripts/python dashboard.py
```

选择实际 COM 端口连接开发板。无板卡时可加 --demo 检查界面，Demo 不作为实测结果。真实实验 CSV 在 data/motor_comparison。

## 验证记录

本轮实际执行范围和日志见 results/reproduction.md。Vivado 工程、ARM 编译、PC 测试和实板运行分别列项，不能相互替代。
