# 本机串口助手静态盘点（2026-10-29）

检查方式：只读取文件头、Windows 版本资源、Authenticode 状态和 SHA-256；**没有运行以下 EXE**，也没有安装驱动或关闭杀毒软件。三者均为 Windows PE32/x86 GUI 程序（Machine `0x014C`、Subsystem `2`），签名状态均为 `NotSigned`。未签名不等于恶意，但无法通过数字签名确认发布者。

| 软件 | 本机文件 | 版本资源 | SHA-256 |
| --- | --- | --- | --- |
| 正点原子资料包 ATK-XCOM | `F:\2026\6_常用软件\串口调试助手\XCOM（ALIENTEK官方推荐）\XCOM V2.6.exe` | 2.6.0.0，Company=正点原子 | `B3BDB42602B799BCF586EAFAD8DF723C0F38FAA1EF3F88E207F3D2383BCE2BF8` |
| 丁丁 SSCOM | `F:\2026\6_常用软件\串口调试助手\串口调试助手（丁丁）\sscom33.exe` | FileVersion 1.0.0.17 | `8491BEE3D7F489A6B78EEDC1C691364CEECFDCE710B10FA78642678E52D615DC` |
| 独立“串口调试工具” | `F:\2026\串口调试助手\串口调试工具.exe` | ProductVersion 1.0.0.1，Company=ONY | `A9CA277B04CAB00122E31526909431BFDA78FA03F4A2ED7CAAC68BB33D1D717B` |

厂家资料夹 `readme.txt` 推荐 XCOM，并提示需要 .NET Framework 4.0；同目录附安装包，但本次**未运行安装包**。`sscom.ini` 中可见 COM3、115200、8 数据位、1 停止位；这只是历史配置，不能证明当前实物端口。厂家[当前 XCOM v3.0 文档](https://www.openedv.com/docs/tool/ruanjian/ATK-XCOM.html)说明可选 COM、波特率、数据位/校验/停止位、文本/HEX 显示及接收窗口保存；**本机找到的是 v2.6，不能把 v3 文档当作 v2.6 的逐项功能验证**。本次未启动上述 EXE，日志保存按钮和真实 COM 连通性仍待现场确认。

当前电脑 `pyserial` 枚举到 COM3/COM4，说明为 `com0com - serial port emulator`。已用这对**虚拟串口**测试 CRLF 传输与两条真实报文摘录进入新 GUI，不能称为板卡实机验证。现场应在 Windows 设备管理器中重新确认实际 USB-UART 端口号。

## 最短现场操作

1. 连接开发板 UART0 对应的 USB 转串口线，在设备管理器 → 端口 (COM 和 LPT) 记下实际 COM 编号；不要沿用别人的 COM3。
2. 从已知厂家资料目录启动熟悉的 XCOM，选择该 COM，设 `115200 / 8 数据位 / 无校验 / 1 停止位 / 无流控`，关闭 HEX 显示以看 ASCII 文本，打开串口。等待 `# source=PL` 和八列表头；如需留存，先在现场确认并使用其接收窗口保存功能。
3. 录屏后在 XCOM **关闭串口**，等待端口释放。启动 `python dashboard.py`，刷新并选择同一 COM，点“连接实机”。反向切换时先点上位机“断开”，再打开 XCOM。
4. 若 XCOM 或 Python 提示“端口占用”，不要改驱动；先关闭占用同一 COM 的其他程序。
