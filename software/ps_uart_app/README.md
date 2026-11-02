# PS 裸机 UART0 应用与平台

本目录原名 `vitis_uart_demo`，包含 Vitis 2023.2 的 Zynq standalone 平台和 ARM Cortex-A9 核0应用。它不是 PC 串口工具，也不是 PS-only 硬件工程；真实读取需要含振动 AXI 外设的 PS+PL XSA。

## 文件与实际功能

| 路径 | 用途 |
| --- | --- |
| `vibration_uart_app/src/helloworld.c` | 1 KiB DDR基础检查、ID/版本验证、MMIO快照读取及UART输出 |
| `vibration_uart_app/src/hardware_address.h` | 检查生成平台中的AXI基地址，当前要求0x40000000 |
| `vibration_uart_app/src/console_config.h` | 当前控制台UART0 |
| `vibration_uart_app/src/vibration_regs.h` | 应用内寄存器协议与快照辅助函数 |
| `vibration_uart_app/src/lscript.ld`、CMake/YAML | 链接及构建配置，须与源码一起保留 |
| `vibration_uart_app/vitis-comp.json` | 应用组件/平台引用，目前仍有改名前的绝对路径 |
| `vibration_platform/vitis-comp.json` | 平台组件、XSA和域配置，目前仍需迁移核对 |
| `vibration_platform/hw/` | 平台配套XSA |
| `vibration_uart_app/_ide/psinit/` | 配套PS初始化文件 |
| `vibration_uart_app/_ide/bitstream/` | 配套PL运行文件，不替代RTL |
| `vibration_uart_app/_ide/.theia/launch.json` | 历史启动配置；迁移后须核对路径、初始化和下载对象 |

应用每约500 ms读取最新快照；只在前后RESULT_SEQ相同且已有结果时接受窗口。UART0为115200、8N1、无流控，报文定义见根README与 `fpga/docs/axi_register_map_v1.md`。1 KiB DDR检查不是完整DDR容量/时序资格验证。源码中保留的早期“DDR candidate”等启动文本不代表本轮重新测试结论。

## 改名后的已知路径问题

截至2026-11-02，静态检查发现：

- 应用 `vitis-comp.json` 的 `platform` 仍指向 `E:\vibration-monitor\software\vitis_uart_demo\...`。
- 平台组件中的QEMU资源路径仍含旧目录；历史build、launch配置也应在迁移时检查。
- 平台 `xsa` 指向 `deliverables` 中的2026-10-27交付副本，不应未经比对就认为与当前主工程XSA完全对应。

本轮没有修改这些生成/工程配置，没有重新编译或下载。可交付源码存在不等于改名后的工作区已经可以一键复现。

## 建议的低风险迁移方法

1. 保留原目录和运行文件；在Vitis 2023.2建立新的工作区。
2. 使用当前主工程的 `fpga/vivado/zynq_vibration_system/zynq_vibration_system_uart0.xsa` 创建/更新Platform Component，选择 `standalone`、`ps7_cortexa9_0`。核对UART0及厂家PS7/DDR配置，不自行猜测DDR参数。
3. 创建Application Component并选择新平台/域，导入本目录 `vibration_uart_app/src` 的源码及所需构建设置。原链接脚本和用户构建选项需逐项核对，不用不匹配的新模板静默替换。
4. 重新构建平台和应用；检查生成的 `xparameters.h` 中外设名称/地址与 `hardware_address.h` 一致。
5. 重新选择正确bitstream、PS初始化文件和ELF；在人工批准下载后先验证ID/版本、DDR基础检查和SEQ持续更新。
6. 记录新XSA/ELF/bitstream SHA-256、构建日志与实际运行结果，再确认是否将迁移后的配置纳入发布。

不建议对整个Vitis目录做无差别文本替换来修路径。旧build目录可重建；如需快速演示的ELF，应单独挑选归档并标记来源，而非只提交编译缓存。

## 提交要求

保留应用源码、头文件、链接脚本、组件和域配置、BSP/平台依赖及匹配XSA。保留厂商/AMD文件中的许可证与版权说明。排除日志、锁文件和可重建中间对象，但不要把 `_ide` 整体当作无用缓存：其中存在配套bitstream、PS初始化与启动配置。

当前提交前阻塞项见仓库根目录 `docs/RELEASE_CHECKLIST.md`。本说明没有改变PS程序的MMIO、UART或DDR逻辑。
