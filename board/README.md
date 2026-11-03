# 上板文件与运行

elf 保存应用与 FSBL；bitstream 保存 PL 配置；psinit 保存 PS 初始化脚本。使用 Vivado/Vitis 2023.2、领航者 XC7Z020 板卡与 JTAG/USB_UART 连接。

在 Vitis 的 Zynq Cortex-A9 核 0 standalone 启动配置中选择应用 ELF，启用 FPGA 编程并选择 bitstream，使用 psinit 中的 PS 初始化配置。串口使用 115200、8N1、无流控。

也可使用本目录的 program_board.tcl。先运行 `xsct board/program_board.tcl --check-only` 检查包内路径；连接目标板并启动硬件服务器后，执行 `xsct board/program_board.tcl` 下载并运行。完整条件及步骤见 ../build/README.md。

启动后检查 DEVICE_ID=0x56494231、VERSION=0x00010000，观察 RESULT_SEQ 持续推进，再连接 Python 上位机。串口助手和 Python 同时只能有一个程序占用该端口。

results 保存既有启动、串口和运行记录，../data/board 保存窗口 CSV。保持原始记录内容，不用模拟数据替换实测。
