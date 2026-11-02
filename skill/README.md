# Zynq 振动监测工程 Skill

适用平台为领航者 XC7Z020、Vivado/Vitis 2023.2 和 standalone ARM 程序。内容覆盖 LIS3DH 采集、AXI 窗口读取、UART0、Python 显示，以及工程打包中遇到的具体问题。

## 使用方法

将 `skill` 文件夹放到项目根目录，先读 [SKILL.md](SKILL.md)，再按当前问题查阅参考文档。在仓库根目录执行 `python skill/scripts/audit_handoff.py .` 可检查文件依赖和 XSA 的 UART0、bitstream 配置。脚本只读文件，不访问串口和板卡。

用于其它项目时，先核对板卡、地址、协议和目录，并调整审计脚本中的固定路径。

## 内容与来源

手册整理了项目调试记录和工程复盘，包括 SEQ 停滞、ILA 捕获范围、FIFO 推断、BD 包装层、Vitis 启动及交付依赖。来源见 references/source_ledger.md，补充材料的处理记录见 references/merge_notes.md。

历史实板结果、源码检查和待验证假设已分别注明。静态审计的覆盖范围见 references/handoff_checks.md；检查结果见 validation.md。尚未开展 Skill 效率对照实验或跨板验证。

本定稿只整理文档，保留原审计脚本及通信协议。程序、硬件和实验结果以对应版本的工程与原始记录为准。
