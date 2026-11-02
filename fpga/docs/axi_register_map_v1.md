# 振动窗口结果 AXI4-Lite 寄存器规范 v1

状态（2026-11-02）：v1 已由 `fpga/rtl/vibration_axi_lite_slave.sv` 实现，并通过 46 项 XSim 自检；已接入 PS+PL Block Design 并完成实板寄存器读取。协议仍以寄存器偏移定义，基地址从 Vivado Address Editor/Vitis 平台获得。当前主工程分配 `0x40000000`、4 KiB，通用 C 头文件不固定该地址；PS 应用会检查当前平台地址。

## 现有信号与数据范围

- 数据路径为 LIS3DH XYZ → `vibration_frame_fifo` → `vibration_window_features`，目前仅计算**原始 X 轴加速度计数**。该值包含重力与直流分量；Peak 和平方和均不得称为纯机械振动 RMS。
- 当前集成参数：`SAMPLE_WIDTH=16`、`WINDOW_SIZE=16`、`FIFO_DEPTH=8`。特征输出为 16 位无符号绝对峰值、35 位无符号平方和、5 位样本数。平方和宽度来自 `2*SAMPLE_WIDTH-1+clog2(WINDOW_SIZE)`：`31+4=35`；16 个最小负数的平方和为 `16 × 2^30 = 2^34`，需要 35 位。
- `result_valid && result_ready` 是窗口结果的完成握手。历史独立 `lis3dh_vibration_pipeline` 将 `result_ready` 固定为 1；当前 `lis3dh_vibration_axi_peripheral` 将处理链结果连接至 AXI Slave，由 Slave 在该握手时钟沿锁存。本规范不把仅有 `result_valid`、未完成握手的结果计入序号。
- 采集模块的 `xyz_valid` 是单周期脉冲，不能反压传感器；仅 `xyz_valid && sample_ready` 的样本进入 FIFO。未接收样本由 `sample_drop_count` 饱和计数。`fifo_overflow`、`sensor_overrun` 是复位清除的锁存标志。

## 总线约定

AXI4-Lite，32 位数据总线，字节地址，寄存器按 4 字节对齐。所有字段按无符号 32 位字读取；`SUMSQ_HI:SUMSQ_LO` 组合成无符号 64 位平方和。当前 35 位平方和零扩展到 64 位，因此 `SUMSQ_HI[31:3]` 为 0。若将来参数使结果宽度超过 64 位，必须升级协议/版本并重新评估溢出；不得截断后仍称为 v1。

| 偏移 | 名称 | 访问 | 复位值 | 位定义与行为 |
| --- | --- | --- | --- | --- |
| `0x00` | `DEVICE_ID` | RO | `0x56494231` | 固定值，ASCII `VIB1`。 |
| `0x04` | `VERSION` | RO | `0x00010000` | v1.0：`[31:16]` 主版本 1，`[15:0]` 次版本 0。 |
| `0x08` | `CONTROL` | 保留 | `0x00000000` | 读恒为 0；所有写入忽略，无副作用。不得借此清除标志或结果。 |
| `0x0C` | `RESULT_SEQ` | RO | `0x00000000` | 每完成一组窗口结果握手加 1，按 32 位无符号数回绕。 |
| `0x10` | `PEAK` | RO | `0x00000000` | `[15:0]` 为无符号绝对峰值；当前 `[31:16]` 零扩展。 |
| `0x14` | `SUMSQ_LO` | RO | `0x00000000` | 平方和 `[31:0]`。 |
| `0x18` | `SUMSQ_HI` | RO | `0x00000000` | 平方和 `[63:32]`，当前仅 `[2:0]` 可能非零。 |
| `0x1C` | `SAMPLE_COUNT` | RO | `0x00000000` | 当前快照的实际已握手样本数；默认窗口为 16，`[31:5]` 为 0。 |
| `0x20` | `STATUS` | RO | `0x00000000` | bit0 `init_done`；bit1 `init_error`；bit2 `sensor_overrun`；bit3 `fifo_overflow`；bit4 `result_available`；`[31:5]` 读 0。 |
| `0x24` | `DROP_COUNT` | RO | `0x00000000` | 未被 FIFO 接收的传感器 XYZ 帧累计数；到 `0xFFFFFFFF` 后饱和。 |

`STATUS.result_available` 在首次结果握手后置 1，此后表示“至少有一组有效快照”，一直保持到复位；它**不是**每窗口脉冲，也不保证 PS 尚未读过。`init_done` 沿用当前采集模块语义：WHO_AM_I 验证、配置写事务及等待流程已完成，并不代表 CTRL_REG1/4 已回读核验。`init_error`、`sensor_overrun`、`fifo_overflow` 沿用现有锁存/复位行为；`DROP_COUNT` 与 `STATUS` 诊断位不属于窗口快照，读取它们不受 `RESULT_SEQ` 一致性保护。

所有未定义位读 0；对 RO 寄存器的写入不改变状态，返回 AXI `SLVERR`。对已映射 `CONTROL` 的写入（任何 `WSTRB`）忽略并返回 `OKAY`。在该 Slave 的地址窗口内，未列出的偏移或非 4 字节对齐访问：读数据为 0、返回 `SLVERR`，写入无副作用并返回 `SLVERR`。地址窗口以外由互连决定，可能返回 `DECERR`；v1 不承诺窗口外响应。上述 Slave 行为已纳入独立自检；不因此声称在实板上执行过所有非法地址测试。

## 快照与 PS 读取

当前寄存器桥在**同一个 PL 时钟沿**检测 `result_valid && result_ready`，把 `result_peak`、零扩展的 `result_sum_squares` 和 `result_sample_count` 一并写入快照寄存器，`RESULT_SEQ` 加 1，并置 `result_available`。AXI 读只返回这些已锁存字段，不能分别直连会变化的算法输出。下一组结果可以覆盖上一组快照；不提供队列或读取锁定。当前采集/处理/AXI 使用同一 50 MHz FCLK0 和同步到该时钟的复位。未来若分离钟域，必须另行实现可靠 CDC，不能把多位总线直接跨域采样。

PS 读取一次结果：

1. 读 `RESULT_SEQ` 得到 `seq_before`；读 `STATUS`，若 bit4 为 0，则尚无结果。
2. 依次读 `PEAK`、`SUMSQ_LO`、`SUMSQ_HI`、`SAMPLE_COUNT`。
3. 再读 `RESULT_SEQ` 得到 `seq_after`，并确认 `STATUS` bit4 仍为 1。只有 `seq_before == seq_after` 才接受；否则重试，且应设重试上限。

该检查以两次序号读取之间少于 `2^32` 次结果更新、同一复位周期及可靠的寄存器/CDC 实现为前提。序号模 `2^32` 回绕；PS 可以用无符号 32 位减法比较相邻已接受序号，差值大于 1 意味着至少跳过了窗口，但跨越完整 `2^32` 圈或发生复位时无法仅凭序号判断。PS 太慢时快照只保留最新窗口，不阻塞传感器、不伪称未丢历史结果。下一版若需要每个窗口都送达 PS，应另设计队列/中断/流式接口。

## 当前集成与后续边界

- 当前 XSA 为 `fpga/vivado/zynq_vibration_system/zynq_vibration_system_uart0.xsa`，不是历史 PS-only XSA。修改 BD 后须重新导出并更新平台，不能混用不同地址/复位配置。
- v1 量纲是原始 X 轴计数。后续去直流和物理单位换算应另立字段/版本；PC 的原始 RMS 不是去重力振动 RMS。
- 当前 PS 约500 ms读取最新快照；名义16点/100 Hz窗口约6.25组每秒，因此会跳过历史窗口。这是快照策略，不是 FIFO 拒收。
- `STATUS.sensor_overrun` 在读到传感器 STATUS_REG[7]=1 时锁存，系统复位清除；`STATUS=0x15` 可包含历史覆盖，不表示当前持续覆盖。`DROP_COUNT=0` 也不证明传感器内部没有覆盖。
- 实板异常恢复、数据新鲜度告警、配置寄存器回读与完整 DDR 验证仍不属于本接口已完成的能力。具体提交前检查见根目录 `docs/RELEASE_CHECKLIST.md`。
