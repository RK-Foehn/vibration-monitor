# 项目配置与通信协议

以下配置对应 vibration-monitor。使用前以交付版本的 XSA、`software/include/vibration_regs.h`、`fpga/docs/axi_register_map_v1.md` 和活动 XDC 为准。

| 项目 | 本项目参考值 |
|---|---|
| 板卡/工具 | 正点原子领航者 XC7Z020CLG400-2；Vivado/Vitis 2023.2 |
| PS | standalone，ps7_cortexa9_0；UART0 MIO14/15，115200 8N1 |
| AXI 基址 | 0x40000000；必须与新平台 xparameters.h 核对 |
| UART0 地址 | 0xE0000000；同时核对 BSP stdout |
| 采集 | LIS3DH 四线 SPI；参考配置 CTRL_REG4=0x88、CTRL_REG1=0x57 |
| 特征 | 16 点 X 轴窗口，Peak、平方和、样本数 |

| 偏移 | 寄存器 |
|---|---|
| 0x00 | DEVICE_ID，预期 0x56494231 |
| 0x04 | VERSION，预期 0x00010000 |
| 0x0C | RESULT_SEQ |
| 0x10 | PEAK |
| 0x14 / 0x18 | SUMSQ_LO / SUMSQ_HI |
| 0x1C | SAMPLE_COUNT |
| 0x20 / 0x24 | STATUS / DROP_COUNT，实时诊断 |

先读 seq_a，再读窗口字段，最后读 seq_b；按当前 RTL 有效位规范判断结果有效，并要求 seq_a==seq_b。不一致则有限重试，耗尽后报告未获得一致快照，不能拼凑旧新字段。STATUS 的位定义需查对应版本头文件。

UART 数据行固定八列：

```text
seq,peak_raw,sumsq_hi_hex,sumsq_lo_hex,n,skipped,status_live_hex,drops_live
```

平方和以 `(hi << 32) | lo` 合成；先检查 n>0，再算 `sqrt(sumsq/n)`。单位是原始计数，含重力和直流；未核对量程、分辨率和移位方式前不得换算 mg。未提供 sum 或去直流后的样本，不能仅凭 sumsq 和 n 推导去直流 RMS。

诊断字段的含义如下：

- sensor_overrun 是传感器数据覆盖历史指示；本版本状态位 2 为锁存告警，不代表每一帧当前都异常。
- DROP_COUNT 统计指定接收点的 FIFO/下游拒收，不覆盖整个系统所有损失。
- skipped 是 PS 未输出的窗口；低频轮询可以跳过正常生成的窗口，不能直接等同 FIFO 丢帧。

构建入口参考 `software/ps_uart_app/build.py`；PC 入口在 `software/pc_monitor`。迁移时核对实际目录，不复制作者电脑的盘符或 COM 编号。
