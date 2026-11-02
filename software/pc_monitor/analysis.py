"""Transparent, raw-count threshold calibration; not a fault classifier."""

from __future__ import annotations

from dataclasses import dataclass
from statistics import median


@dataclass(frozen=True)
class Thresholds:
    baseline_peak: float
    mad_peak: float
    enhanced: int
    alarm: int
    points: int


class BaselineCalibration:
    def __init__(self) -> None:
        self.pending: list[int] | None = None
        self.target = 0
        self.thresholds: Thresholds | None = None

    def start(self, target: int = 30) -> None:
        if target < 5:
            raise ValueError("至少采集 5 条基线数据")
        self.pending = []
        self.target = target
        self.thresholds = None

    def add(self, peak: int) -> Thresholds | None:
        if self.pending is None:
            return None
        self.pending.append(peak)
        if len(self.pending) < self.target:
            return None
        center = float(median(self.pending))
        mad = float(median(abs(x - center) for x in self.pending))
        # Engineering display thresholds, not a statistical fault guarantee.
        enhanced = int(center + max(10.0, 3.0 * mad, 0.20 * center) + 0.999999)
        alarm = int(center + max(25.0, 6.0 * mad, 0.50 * center) + 0.999999)
        alarm = max(alarm, enhanced + 1)
        self.thresholds = Thresholds(center, mad, enhanced, alarm, len(self.pending))
        self.pending = None
        return self.thresholds

    def adjust(self, enhanced: int, alarm: int) -> None:
        if self.thresholds is None:
            raise ValueError("先完成基线采集，再调整阈值")
        if not 0 <= enhanced < alarm <= 65535:
            raise ValueError("要求 0 ≤ 增强阈值 < 超阈值 ≤ 65535")
        old = self.thresholds
        self.thresholds = Thresholds(old.baseline_peak, old.mad_peak, enhanced, alarm, old.points)

    def classify(self, peak: int) -> str:
        if self.thresholds is None:
            return "未标定"
        if peak >= self.thresholds.alarm:
            return "超阈值：原始 X 轴计数变化（非故障诊断）"
        if peak >= self.thresholds.enhanced:
            return "振动增强：原始 X 轴计数变化（非故障诊断）"
        return "正常基线范围（仅原始计数）"

    def reset(self) -> None:
        self.pending = None
        self.target = 0
        self.thresholds = None
