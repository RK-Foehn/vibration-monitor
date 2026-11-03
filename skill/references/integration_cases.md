# 平台集成与启动检查

依据 `zynq_vibration_project_skill.md` 整理，2026-11-02 完成合并。标注“源码核对”的条目已检查对应代码，其余沿用材料中的历史记录。

## 传感器 STATUS=0xFF

源码核对记录：`fpga/rtl/lis3dh_xyz_acquisition.sv` 的 STATUS_WAIT 对返回值 bit7 锁存 sensor_overrun，对 bit3 决定读取新 XYZ；没有将 0xFF 单独作为致命错误。不要把该寄存器的 0xFF 与 WHO_AM_I 读错混为一谈。

排查时交叉检查 WHO、配置读回、SPI 波形及姿态响应；0xFF 可能包含合法状态位组合，也可能来自链路异常，单凭数值不能确定。补充仿真用例可覆盖 0x00、0x08、0x88、0xFF 及复位/锁存行为。材料提出“启用 100 Hz 后等待约 100 ms 导致首次 overrun”，这一解释仍待实测。

## BD Module Reference 与外部端口

若当前 Vivado 的 Add Module 明确报告顶层 SystemVerilog 类型不支持，先核对工具版本、文件类型、完整依赖与真实报错；可新增 Verilog-2001 `.v` wrapper，逐项显式连接原 `.sv` 参数及端口。保持原逻辑，必要时添加正确的 AXI 接口属性，重新 elaboration 和 Validate Design。该处理适用于出现上述报错的环境，使用前核对版本支持情况。

材料曾出现 MISO 未连接；验收时同时检查 CS、SCLK、MOSI、MISO 四路外部端口。wrapper 文件存在不等于连接完整，BD Validate 成功也不等于外部硬件通信成功。

## 时钟、复位与约束版本

补充材料描述新 PS+PL 使用 PS FCLK_CLK0=50 MHz，旧纯 PL 顶层使用外部 sys_clk/sys_rst_n。移交时从当前 BD、wrapper 和活动 XDC 确认来源；不要同时启用不匹配的旧顶层时钟/复位端口约束。

材料给出的历史 SPI 引脚为 CS=T14、SCLK=V12、MOSI=T12、MISO=V15，供电 3.3 V。接线前应确认当前板卡版本、原理图和活动约束与这些引脚一致。USB_UART 桥芯片具体型号与 MIO 收发方向也应核实，不根据旧说明直接改线。

## ILA 探针与常量网络

重新下载时使用同一次构建的 `.bit` 与 `.ltx`。若找不到 result_valid 或完整 sum_squares，先查综合后网络、探针宽度、优化与映射；该历史探针问题仍缺修复记录；后续 AXI 验证单独记录。

材料中 sample_count 固定为 16，低四位被综合成常量；其 undefined Clock Domain 不应直接判为功能 RTL 故障。只有确认常量传播后才移除相应调试位；参数可变或其它非恒定信号不能照搬。ILA 捕获时长检查见 debug_cases.md。

## Vitis 启动界面与真实运行

ARM standalone 开发使用适用的 Vitis 嵌入式 IDE/工具链，不把 HLS 界面当成应用运行器。若 IDE 停在 Initializing the hardware，查看 XSDB 的实际下载结果和 CPU 状态，再核对真实串口的 SEQ 推进。

ELF downloaded、CPU Running 和持续有效 UART 分别证明不同环节；单独 Running 不保证程序正确。已有真实数据时不要因界面未刷新而重复 Reset/Run。遇到 CONFIG.C_BASEADDR 等警告，按完整上下文判断，记录其影响及判断依据。

## DDR 与采样带宽

材料描述 DDR Custom 参数来自核心板资料，但完整稳定性尚未证明。芯片型号、颗粒组织、总线宽度、时序必须以板卡资料及当前配置核对，不将默认 Micron 参数或历史南亚描述直接套用。1 KiB scratch 测试仅覆盖该小范围及所用模式。

按材料的 100 Hz ODR，奈奎斯特频率为 50 Hz；6000 RPM 对应 100 Hz 转频，已超出该采样率可直接无混叠分析的范围。不得因此宣称得到该转频或可靠故障频谱。若扩展频域分析，重新设计采样率、带宽、抗混叠及实测验证；FFT 扩展另行立项。
