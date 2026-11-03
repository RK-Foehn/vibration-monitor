# ARM 裸机应用

应用源码位于 vibration_uart_app/src。build.py 使用 Vitis 2023.2 从当前 UART0 XSA 创建 standalone 平台，选择 Cortex-A9 核 0，并编译应用。

在仓库根执行：

```text
vitis.bat -s software/ps_uart_app/build.py <新的工作区绝对路径>
```

工作区必须是尚不存在的目录。CMake 构建文件保持工具要求的名称。应用输出八列 UART CSV，约 500 ms 读取一次窗口，并检查 DEVICE_ID、VERSION 及快照一致性。

既有 ELF、bitstream 和初始化文件在 ../../board。寄存器规范在 ../../fpga/docs/axi_register_map_v1.md。
