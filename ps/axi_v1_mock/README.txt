PS AXI4-Lite v1 模拟程序（2026-10-20）

用途
按队长提供的原始 vibration_regs.h 读取内存中的模拟寄存器。
没有 Xil_In32，没有硬编码 AXI 外设地址，没有真实传感器数据。
传给回调的 base=0 只是内存模型的偏移标记，绝不能作为未来硬件地址。
队长原版协议放在 docs/，头文件保持原样。

运行流程
Hello Zynq → C 自检 → 模拟 X 轴窗口 → 序号一致性读取 → CSV 串口输出。
模拟窗口每次重复同一组16个原始计数，序号递增，打印后延时500ms。
Peak=32768，平方和=2150218113，样本数=16。
平方和分高低32位十六进制输出，电脑端按 (hi<<32)|lo 还原。
不输出 mg 或机械振动 RMS，不作状态分类。
skipped 是跳过的结果窗口数；drops_live 是未进入采集 FIFO 的帧数。
二者不同；STATUS 和 DROP_COUNT 是单独读取的实时诊断字段。
序号差值仅适用于同一复位周期；不能靠它区分硬件复位与回绕。

收到 PS-only XSA 后
1. 用核对过 DDR、时钟、UART 的 XSA 建立 standalone 平台。
2. 建立 Hello World 应用，保留模板 platform.c/platform.h。
3. 用 src/main.c 替换模板 main，添加本目录其余 src 文件。
4. 设置 BSP stdout 为实际连接 USB-UART 的 PS UART，核对波特率。
5. 编译、上板，记录 Hello、自检结果以及 CSV。
PS-only 平台中始终使用 mock_window_read32，不能切换 MMIO。

验证状态
mock_window.c 已使用本机 Vitis 2023.2 ARM GCC 按 Cortex-A9、
C99、-Wall -Wextra -Werror 编译为目标文件。
内置 C 自检包括：无结果、正常结果、读取中更新导致重试耗尽、
失败不覆盖原结果、序号回绕、35位平方和组合。
自检和快照读取 C 代码已通过 ARM 仿真实际运行，12/12 项测试通过。
测试使用 ARM GCC 12.2.0 + Unicorn 2.1.4 + pyelftools 0.33。
覆盖无结果、非法参数、更新后重试成功、重试耗尽且保持输出、
有效标志丢失、序号回绕、重复/跳过窗口、35位组合及独立诊断字段。
2026-10-21：已使用队长的 PS-only XSA 生成真实 standalone BSP，完整编译得到 uart_mock.elf。
尚未上板，串口和候选DDR尚未实际验证。平台构建说明见 ../ps_only_platform/。
目标文件编译通过不代表 Vitis 完整工程、AXI RTL 或硬件验证通过。
代码与测试同步到团队仓库 ps/uart-demo 分支，未推送远程或合并 main。

复现测试
在单独的 Python 环境安装 unicorn==2.1.4、pyelftools==0.33，
在本项目目录运行：
python tests/run_arm_tests.py --gcc "D:\Xilinx\Vitis\2023.2\gnu\aarch32\nt\gcc-arm-none-eabi\bin\arm-none-eabi-gcc.exe" --build build
测试脚本重新编译 C 程序、逐项执行 ARM 指令，并生成 test_results.json。
仿真内存地址仅供测试加载 ELF，和未来 AXI 地址无关。
详见 docs/test_results.json。测试期间未修改队长提供的头文件及协议。

后续真实接口
等待 AXI Slave / Block Design 完成和更新 XSA。
再使用平台给出的实际基地址及 Xil_In32 适配器替换内存回调；
先核对 DEVICE_ID、VERSION，验证快照、CDC、序号、复位和丢帧行为。
本模拟器不验证 AXI SLVERR/OKAY、跨时钟域或并发硬件正确性。
