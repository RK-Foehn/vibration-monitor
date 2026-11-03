# 独立构建与检查记录

日期：2026-11-03。使用本工程的独立副本和新工作区执行下表所列软件检查。检查完成后，按团队要求暂停进一步构建及上板操作。

| 项目 | 执行结果 | 记录 |
|---|---|---|
| 从 UART0 XSA 创建 standalone 平台、BSP 并编译 Cortex-A9 应用 | PASS，Vitis 2023.2 输出 BUILD_SUCCESS | vitis_rebuild_actual.log、arm_build_result.json |
| 在独立 Python 虚拟环境中安装上位机依赖 | 完成 | pc_install.log、pc_requirements_verified.txt |
| 上位机协议、统计、CSV 与事件测试 | 9 项通过 | pc_tests.log |
| legacy 接收器与串口回环测试 | 11 项通过 | legacy_tests.log |
| Tkinter 上位机离线启动 | 通过，生成 4 条 Demo 数据后退出，无串口连接 | dashboard_smoke.log |
| board/program_board.tcl 路径分支 | BOARD_INPUT_PATHS_PASS，未访问硬件 | board_script_check.log |
| build/rebuild_fpga.tcl 路径分支 | FPGA_INPUT_PATHS_PASS，未执行综合 | fpga_script_check.log |
| Vivado 从源码综合、实现与生成 bitstream | 未执行；本机未安装 Vivado，团队已暂停此项 | 无新增 FPGA 重建日志 |

上表日志记录实际执行过程，因此保留当时的工作目录和工具安装路径。其他电脑应按 ../README.md 的相对路径入口新建工作区。

## 文件与证据

ARM 构建使用的 XSA SHA-256 为 `dd88da46c16bd933818ec9101d35555f32a3ec792b8d51197d0a5c86481640c6`，与交付的 UART0 XSA 一致。构建结果摘要保留于 arm_build_result.json；本次编译生成的 ELF 与平台导出保存于 arm_build/，供检查软件构建结果。日常演示仍按 ../../board/README.md 使用 board 中已有的上板文件。

既有实板串口启动及窗口记录位于 ../../board/results/ 和 ../../data/board/；正常电机与受控扰动原始数据位于 ../../data/motor_comparison/。本轮没有执行新的板卡测试。

restored_files.json 列出完整工程整理时补回的文件。根目录 sha256_manifest.json 用于核对分发文件完整性；散列校验和路径检查本身不代表硬件运行验证。
