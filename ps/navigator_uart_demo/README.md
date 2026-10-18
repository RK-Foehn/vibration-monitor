# 领航者 Zynq PS 裸机串口第一阶段

目标平台：正点原子领航者 ZYNQ，XC7Z020CLG400-2；队伍 Vivado 版本为 2023.2，PS 端采用 Vitis Embedded 2023.2、C、standalone、Cortex-A9 core 0。

本目录是源码与搭建说明，尚不是已生成的 Vitis 平台或已验证的 ELF。阶段状态见 `docs/validation.md`。

## 第一阶段范围

启动打印 `Hello Zynq`，随后输出模拟 XYZ CSV。ARM 通过 PS UART 与电脑通信；不访问 PL、LIS3DH、AXI 或 DMA。Arduino 库不参与此程序的编译。将来队长提供真实帧后，再共同确定 PS/PL 接口。

目录：`src/main.c` 是应用源码；`docs/board_and_setup.md` 是板卡证据和开发步骤；`docs/validation.md` 是实际验证记录；`tools/validate_uart_log.py` 校验串口文本；`tests/` 只测试电脑端日志校验工具。

## 开始使用

1. 获取包含正确 PS、UART、DDR 与时钟配置的 Vivado 2023.2 XSA。只有 PL bitstream 无法替代软件平台所需硬件描述。
2. 按 `docs/board_and_setup.md` 创建 Vitis 平台、standalone 域和 Hello World 应用。
3. 保留示例的 `platform.c`、`platform.h`、链接脚本及 BSP，用 `src/main.c` 替换示例中已有的 main 源文件。
4. `DEMO_ENABLE_XYZ=0` 时仅打印 Hello；默认值 1 时继续打印模拟数据。
5. 确认 BSP stdout 为物理 UART1，并将实际波特率与电脑终端统一为 115200、8N1、无流控。
6. 等共同使用开发板时进行 JTAG 下载、串口采集和记录。

数据示例（预期格式，非实测）：

```text
Hello Zynq
# source=SIMULATED; unit=mg; delay_us=100000
seq,x_mg,y_mg,z_mg
0,0,50,1000
1,38,46,991
```

每次打印后延时 100 ms，实际周期包含打印耗时；不能作为精确采样或 FFT 输入性能证明。Z 的 1000 mg 偏置是人工设置，所有 XYZ 都是模拟值。

## 验证命令

在本目录下，用已安装的 Python 3 执行：

```text
python -m unittest discover -s tests -v
python tools/validate_uart_log.py path/to/uart_capture.txt --min-rows 100
```

先开启终端文本日志，再运行 ELF，才能记录从 Hello 和序号 0 开始的完整输出。日志校验检查格式、标记、序号连续性和示例数值范围；PASS 只能证明文本符合约定，不能证明日志来自真实开发板，也不能证明采样精度。真实上板记录应同时保存连接照片、运行配置、ELF/XSA 哈希和终端日志。

## Git 工作方式

本阶段加入团队仓库 `ps/navigator_uart_demo/`，采用独立功能分支。生成的 Vitis 工作区、工具安装包和厂商原始资料不提交。上板验证完成后再由团队评审并合并 main。
