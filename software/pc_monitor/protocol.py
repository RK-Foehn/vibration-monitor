"""Decode the *actual* fixed UART0 CSV protocol from the teammate's C firmware.

The strict numeric/range validation is reused from legacy.receiver.parse_row.
The decoder also handles repeated headers and startup/diagnostic lines.
"""

from __future__ import annotations

import math
from dataclasses import dataclass
from datetime import datetime

from legacy.receiver import HEADER, parse_row


@dataclass(frozen=True)
class Measurement:
    received_at: datetime
    source: str
    sequence: int
    peak: int
    sum_squares: int
    sample_count: int
    ps_skipped: int
    status: int
    drop_count: int
    raw_line: str

    @property
    def raw_rms(self) -> float:
        # Raw X counts include DC/gravity. This is not AC vibration RMS.
        return math.sqrt(self.sum_squares / self.sample_count)


@dataclass(frozen=True)
class DecodeEvent:
    kind: str  # info, header, measurement, error
    raw_line: str
    message: str = ""
    measurement: Measurement | None = None


@dataclass(frozen=True)
class SequenceEvent:
    kind: str  # first, normal, duplicate, gap, backward_or_reset
    skipped: int = 0


class SequenceTracker:
    def __init__(self) -> None:
        self.previous: int | None = None

    def observe(self, sequence: int) -> SequenceEvent:
        if self.previous is None:
            self.previous = sequence
            return SequenceEvent("first")
        delta = (sequence - self.previous) & 0xFFFFFFFF
        self.previous = sequence
        if delta == 0:
            return SequenceEvent("duplicate")
        if delta == 1:
            return SequenceEvent("normal")
        if delta < 0x80000000:
            return SequenceEvent("gap", delta - 1)
        return SequenceEvent("backward_or_reset")

    def reset(self) -> None:
        self.previous = None


def status_labels(status: int) -> list[str]:
    names = (
        "初始化完成", "初始化错误（锁存）", "传感器曾发生覆盖（锁存）",
        "FIFO 曾溢出（锁存）", "已有结果快照（锁存）",
    )
    return [name for bit, name in enumerate(names) if status & (1 << bit)] or ["无状态位"]


class UartDecoder:
    """Stateful line decoder; a new attachment waits for the exact CSV header."""

    def __init__(self) -> None:
        self.ready = False
        self.source = "UNKNOWN"
        self.parse_failures = 0
        self.accepted = 0

    def feed_line(self, raw_line: str, *, received_at: datetime | None = None) -> DecodeEvent:
        line = raw_line.rstrip("\r\n")
        if not line:
            return DecodeEvent("info", line)
        if line == "Hello Zynq":
            self.ready = False
            self.source = "UNKNOWN"
            return DecodeEvent("info", line, "设备启动，等待下一次协议表头")
        if line.startswith("#"):
            if line.startswith("# source="):
                self.source = line[len("# source="):].split(";", 1)[0].strip()
            return DecodeEvent("info", line)
        if line == HEADER:
            self.ready = True
            return DecodeEvent("header", line)
        if line.startswith(("DEVICE_ID=", "VERSION=", "snapshot_rc=")):
            return DecodeEvent("info", line)
        if not self.ready:
            # Firmware reprints source and header every 20 rows (~10 s).
            return DecodeEvent("info", line, "等待精确 CSV 表头，不接受半途接入的数据")
        try:
            seq, peak, total, count, skipped, status, drops = parse_row(line)
        except ValueError as exc:
            self.parse_failures += 1
            return DecodeEvent("error", line, str(exc))
        self.accepted += 1
        measurement = Measurement(
            received_at or datetime.now().astimezone(), self.source,
            seq, peak, total, count, skipped, status, drops, line,
        )
        return DecodeEvent("measurement", line, measurement=measurement)
