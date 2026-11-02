# FPGA 采集与窗口特征工程

本目录包含独立模块验证与当前 PS+PL 完整工程。已从 WHO_AM_I 仿真推进至真实 XYZ 采集、FIFO、16 点 X 轴 Peak/平方和及 AXI4-Lite 寄存器通信。下文保留最初 SPI 自检方法作为回归入口，不将历史验证顶层当作当前实现顶层。

## 当前主工程

- Vivado/Vitis 2023.2，Part `xc7z020clg400-2`。
- XPR：`vivado/zynq_vibration_system/zynq_vibration_system.xpr`。
- BD：`vivado/zynq_vibration_system/zynq_vibration_system.srcs/sources_1/bd/design_1/design_1.bd`。
- 实现顶层 `design_1_wrapper`；BD 引用 `rtl/lis3dh_vibration_axi_wrapper.v`，其内部例化 SystemVerilog 外设及依赖。
- 当前 XDC：`vivado/zynq_vibration_system/zynq_vibration_system.srcs/constrs_1/new/lis3dh_spi_pins.xdc`。SPI 为 T14/V12/T12/V15，端口名带 `_0`；不同时启用旧约束。
- 50 MHz 来自 PS FCLK_CLK0；复位经 Processor System Reset。旧独立 PL 工程的 U18/J15 外部时钟复位不适用于此顶层。
- XSA：`vivado/zynq_vibration_system/zynq_vibration_system_uart0.xsa`。仅有 XSA 不能替代 BD/RTL 源码。

当前通路为 `lis3dh_xyz_acquisition → vibration_processing_pipeline → vibration_axi_lite_slave`；处理链复用 `vibration_frame_fifo` 与 `vibration_window_features`。所有模块在同一时钟域。只有 ready/valid 握手的样本计入窗口；采集端无法反压 LIS3DH，拒收计数和历史覆盖分别保存。详见 [寄存器规范](docs/axi_register_map_v1.md)。

## 仿真与黄金模型

在 Vivado 2023.2 命令环境中，从仓库根目录创建独立工作目录，避免把 XSim 产物写进源码目录。以下是 AXI 自检示例；命令仅在手动执行时运行：

```powershell
New-Item -ItemType Directory -Force tmp/xsim_axi | Out-Null
Push-Location tmp/xsim_axi
xvlog --sv ../../fpga/rtl/vibration_axi_lite_slave.sv ../../fpga/sim/tb_vibration_axi_lite_slave.sv
xelab tb_vibration_axi_lite_slave -s axi_registers_sim
xsim axi_registers_sim -runall
Pop-Location
```

预期终止信息为 `PASS tb_vibration_axi_lite_slave checks=46`；不能仅以编译完成判断自检通过。逐步执行时须检查每条命令是否成功。

| Testbench | 范围 |
| --- | --- |
| `tb_lis3dh_who_am_i_top.sv` / `tb_lis3dh_board_top.sv` | 身份读取、复位、上电等待与单次启动 |
| `tb_lis3dh_xyz_acquisition.sv` | 配置、字节/符号、STATUS=00/08/88/FF、复位和错误身份 |
| `tb_vibration_frame_fifo.sv` | 满空、暂停、顺序、溢出和复位 |
| `tb_vibration_window_features.sv` | Peak、平方和、最小负数、窗口、输出阻塞 |
| `tb_vibration_processing_pipeline.sv` | FIFO 到特征的背压、实际接收序列和连续窗口 |
| `tb_lis3dh_vibration_pipeline.sv` | SPI 行为模型到窗口特征的全链路 |
| `tb_vibration_axi_lite_slave.sv` | AXI 读写握手、快照、非法访问与复位 |

`sim/golden_vibration_window_features.py`、`sim/golden_vibration_processing_pipeline.py` 和 `sim/golden_lis3dh_vibration_pipeline.py` 核对对应 TB 输出的 trace。以实际被接收的样本计算整数参考结果；运行参数和 trace 名见各脚本及 TB，仿真参数可能缩短等待时间，不等于板级真实 ODR。

独立处理核心综合实现示例（仓库根目录执行）：

```powershell
vivado -mode batch -source fpga/scripts/evaluate_processing_pipeline.tcl -tclargs tmp/processing_ooc .
```

该脚本为 OOC 评估，不打开现有工程、不创建板级 bitstream。已约束内部时序通过不等于外部 SPI I/O 已完成全部时序预算。历史 PASS 与实板记录须另行归档，本轮文档更新没有重新运行 XSim 或综合。

## 历史 WHO_AM_I 自检

## Protocol used

- Four-wire SPI: `CS`, `SCLK/SPC`, `MOSI/SDI`, and `MISO/SDO`.
- `CS` is active low and `SCLK` is high while idle.
- Data changes on falling `SCLK` edges and is sampled on rising edges.
- A single-register read uses 16 clocks, MSB first.
- `WHO_AM_I` is address `0x0F`; with `RW=1` and `MS=0`, the command is
  `0x8F`. The expected response is `0x33`.
- The default RTL setting produces a 1 MHz SPI clock from the board's 50 MHz
  PL clock. The testbench uses 8.33 MHz, below the 10 MHz device maximum.

Reference: STMicroelectronics, LIS3DH datasheet, DocID17530 Rev 2,
sections 2.4.1, 6.2, 6.2.1, and Table 21.

## Run with Vivado 2023.2 XSim

From the `fpga` directory in a Vivado 2023.2 command prompt:

```powershell
xvlog --sv rtl/lis3dh_spi_controller.sv rtl/lis3dh_who_am_i_top.sv sim/tb_lis3dh_who_am_i_top.sv
xelab tb_lis3dh_who_am_i_top -s lis3dh_who_am_i_sim
xsim lis3dh_who_am_i_sim -runall
```

## PASS criteria

The self-checking testbench requires all of the following:

- one active-low `CS` transaction;
- `SCLK` high at bus idle and at both `CS` boundaries;
- exactly 16 rising and 16 falling `SCLK` edges while `CS` is low;
- transmitted command byte `0x8F` and dummy byte `0x00`;
- sampled result `0x33`;
- `done` asserted for one system-clock cycle and `error` remaining low.

A passing run ends with:

```text
PASS: LIS3DH WHO_AM_I SPI transaction verified.
```

## 工程移交与重新接线

实际板卡已使用 V2.6 底板的 J3 接线并完成实板通信，不能继续沿用早期“J4 待确认”的描述。重新接线仍须在断电条件下核实版本、排针方向、电压与共地。电机先停机，再进行上电和程序切换。

XPR 的 `../../rtl/` 外部引用要求保留整个 `fpga` 相对层级。当前 XPR 也引用 `.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v` 与 `.srcs/utils_1` 中的检查点；不要仅因目录名像缓存就遗漏实际引用。大型 `.runs/.cache/.sim` 可从提交副本排除，但需另行选出已验证 bitstream、资源/时序报告。

历史独立工程中的 ILA 不代表当前完整 PS+PL bitstream 带有相同调试核。主工程与 XSA/ELF 的对应关系及改名后的 Vitis 迁移测试见仓库根目录 `docs/RELEASE_CHECKLIST.md`。
