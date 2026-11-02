# 2026 全国大学生嵌入式芯片与系统设计竞赛 FPGA 项目 AMD 赛道

基于 Zynq 的旋转机械振动状态监测系统

一、项目简介

本项目面向小型旋转机械的运行状态监测，基于正点原子领航者 ZYNQ-7020 开发板，构建了从真实加速度采集、FPGA 硬件特征计算，到 ARM 数据读取、串口通信和 Python 实时可视化的完整链路。

系统采用 LIS3DH 三轴加速度计采集运动信号，在 PL 中完成 SPI 通信、数据缓冲及定长窗口特征提取，通过 AXI4-Lite 寄存器接口将结果提供给 PS。ARM 裸机程序读取结果后，经 UART0 发送至电脑，由 Python 上位机完成趋势显示、工况比较和 CSV 数据记录。

二、硬件平台

主控开发板：正点原子领航者 ZYNQ-7020
核心器件：AMD Zynq-7000 XC7Z020CLG400-2
参考板卡版本：7020 核心板 V1.5、底板 V2.6
传感器：LIS3DH 三轴数字加速度计
传感器接口：四线 SPI
实验装置：370 直流电机与独立手动 PWM 调速器

PWM 调速器用于改变电机运行工况，不由 FPGA 直接驱动。当前系统没有接入独立转速测量接口。

三、系统架构

数据处理链路：

LIS3DH 三轴采集 → SPI → PL 同步 FIFO → 16 点 X 轴窗口特征 → AXI4-Lite → PS ARM → UART0 → Python 上位机

PL 端负责确定时序的采集与整数特征计算。

PS 端运行于 ARM Cortex-A9 核 0，负责读取寄存器快照、检查状态并组织串口输出。

电脑端负责数据显示、原始窗口 RMS 计算、基线阈值提示和文件记录。

当前采集、处理及 AXI 外设使用同一 50 MHz 时钟域。

四、主要功能

1. LIS3DH 身份识别与初始化，读取 WHO_AM_I 并验证预期值 0x33。

2. 周期性读取 XYZ 三轴数据，当前配置为 100 Hz、±2 g、高分辨率模式，并启用 BDU。

3. 使用 8 帧同步 FIFO 缓冲采集数据，通过 ready/valid 握手连接处理模块。

4. 对每 16 个实际接收的 X 轴样本计算绝对峰值 Peak、平方和 Sum of Squares 及窗口样本数。

5. 通过 AXI4-Lite 提供设备标识、版本、窗口序号、特征结果和诊断状态。PS 使用前后两次 RESULT_SEQ 读取进行一致性检查。

6. UART0 使用 115200 波特率、8N1、无流控，以文本 CSV 格式发送窗口结果。

7. Python 上位机提供串口连接、实时指标、趋势曲线、基线采集、阈值提示、CSV 记录和工况数据比较。

五、工程目录

fpga/rtl：SPI、传感器采集、FIFO、窗口特征、AXI Slave 及集成包装模块。

fpga/sim：SystemVerilog 自检 Testbench 和 Python 黄金参考模型。

fpga/constraints：独立板级工程的约束及历史参考版本。

fpga/scripts：处理核心独立综合与实现评估脚本。

fpga/docs：寄存器规范及板级调试说明。

fpga/vivado/zynq_vibration_system：当前 PS+PL 主工程及配套 XSA。

software/ps_uart_app：Vitis 平台、ARM 裸机程序及相关配置。

software/pc_monitor：Python 实时监测上位机、协议解析、自动测试和启动脚本。

software/include：通用寄存器头文件。

src：早期模拟信号、FFT、特征提取和谐波分析参考脚本，不属于当前实板实时处理链。

六、开发环境与运行说明

FPGA 开发使用 Vivado 2023.2，PS 软件使用 Vitis 2023.2 standalone 平台。

当前主工程为 fpga/vivado/zynq_vibration_system/zynq_vibration_system.xpr，实现顶层为 design_1_wrapper。工程引用了 fpga/rtl 中的外部源码，移交时必须保留原有目录层级，不能只复制 XPR 所在文件夹。

PS 软件必须使用包含当前 AXI 外设的 PS+PL XSA，不能使用早期 PS-only 平台替代。目录改名后，应在 Vitis 中重新核对平台、XSA、构建和启动配置中的路径。

Python 上位机依赖 pyserial、Matplotlib 和 Tkinter。请按 software/pc_monitor 中的 README 和 requirements.txt 准备环境，不要直接复制其他电脑的虚拟环境。

连接实机前，应先关闭 XCOM 或其他程序占用的串口。同一 COM 口不能被串口助手和 Python 上位机同时打开。

七、验证情况

项目已完成真实 LIS3DH 身份识别、连续 XYZ 读取及姿态响应验证，并完成 PS+PL 实板联调，ARM 能读取窗口结果并通过 UART0 输出。

FIFO、窗口特征和集成处理链已完成 XSim 自检与 Python 整数黄金模型核对。AXI4-Lite Slave 已通过 46 项自检。

处理核心已完成 OOC 综合实现和 50 MHz 内部时序评估，完整 PS+PL 工程已生成并下载 bitstream。Python 协议、记录等自动测试共 20 项通过。

上述验证分别对应仿真、软件测试和实板观察，行为模型与软件回环不替代真实硬件测试。

八、数据解释与使用边界

当前 Peak 和平方和基于原始 X 轴加速度计数，包含重力和直流分量，单位为 counts。

上位机显示的原始窗口 RMS 为 sqrt(SUMSQ/N)，不是去直流 AC RMS，不能直接称为纯机械振动强度。

STATUS 中的 sensor_overrun 是复位清除的历史覆盖锁存位，不代表传感器当前持续覆盖。DROP_COUNT 统计采集数据未被 FIFO 接收的次数，与传感器内部覆盖、PS 跳过历史窗口含义不同。

实时数据是否更新，应结合 RESULT_SEQ 是否持续推进判断，不能仅依据接收时间或连接状态。

当前系统用于运行状态变化监测与实验分析。阈值需要在固定安装和真实工况下标定，不将电机转速升高直接判断为机械故障，不宣称已实现故障分类、实时 FFT 或实测转速分析。
