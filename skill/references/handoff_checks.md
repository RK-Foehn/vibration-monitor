# 工程交付检查

## 依赖保护

- 从 XPR 的实际路径追踪 RTL、BD、IP、活动 XDC、wrapper；保持相对目录层级。清理 `.gen` 前检查引用：历史工程曾直接使用其中的 wrapper。
- 活动 XDC 可能在 Vivado 工程 `.srcs/constrs_1/new`，不能只打包 `fpga/constraints`。
- `software/pc_monitor/legacy` 是现用解析依赖；先追踪 import，再决定删什么。早期七个探索脚本应与现用 golden 模型、解析器分别处理。
- ARM 源码移交包括 C/H、链接配置、构建步骤、匹配硬件；ELF/bitstream 是快速演示辅助，不替代源码。
- 新建 Vitis 工作区时防止旧盘符路径和旧 app/platform 元数据覆盖新 BSP。保留生成失败日志，修复后补充新的运行结果。
- 压缩包排除 .git、.venv、__pycache__、无关缓存；保留精选的仿真 PASS、对比、资源和时序报告。保留原始包，修改输出另存。

## Golden 与数据语义

早期随机信号/FFT/RPM 探索不是现行 FPGA golden。建立 golden 时固定随机种子、输入及量化规则，按实际握手接收样本比较窗口边界、带符号极值、平方位宽和溢出。无噪声的转速扫描不能证明真实故障检测。最终功能清单按当前主链填写，旧 FFT/转速探索另行归档。

## 本 Skill 的验收场景

| 输入情形 | 应有决策 |
|---|---|
| UART0 禁用但 ELF 编译成功 | 更新硬件配置和 BSP 后再验证串口 |
| seq 前后相同，但连续两分钟为同值 | 快照可能一致但不新鲜；暂停标定，分层定位 |
| STATUS=0x15 且 DROP=0 | 不推断零丢失或实时正常，解释锁存位与计数范围 |
| 2048 点 ILA 只有一次 xyz_valid | 先核对捕获时长，不直接判采样停止 |
| FIFO 深度变大、BRAM 仍为零 | 检查推断/资源并回归；不套用旧 OOC 结论 |
| 清理 legacy / .gen | 先追踪 import/XPR 引用，不按目录名删除 |
| 视频有调速曲线，UI 未标定 | 描述响应展示，不声称阈值或异常检测已验证 |
| 聊天提到历史 push/merge | 只作为历史，不执行当前未授权 Git 操作 |

## 静态脚本使用与限制

```text
python <skill>/scripts/audit_handoff.py <vibration-monitor仓库根目录>
```

脚本只使用标准库，检查本项目特定路径、XPR 的 $PPRDIR 引用、XSA UART0 enable 和 bitstream 是否存在。PASS 不是完整工程证明：没有覆盖任意绝对路径、全部 IP 依赖、MIO/DDR 正确性、综合或实板。输入 XML/ZIP 损坏可能直接报异常，应作为检查未完成处理，不能记为 PASS。

改到别的板卡时先改参考配置和审计脚本的固定路径，再运行正反例；跨板使用尚待验证。
