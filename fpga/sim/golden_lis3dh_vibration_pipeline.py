"""Check XSim's accepted-frame trace against an integer Python golden model.

Usage: python golden_lis3dh_vibration_pipeline.py lis3dh_pipeline_trace.csv
Only A (xyz_valid && sample_ready) records enter windows. D records are lost
sensor pulses; RESET discards an unfinished window and pending FIFO frames.
"""

import sys
from pathlib import Path

WINDOW_SIZE = 16


def sensor_sample(index: int) -> tuple[int, int, int]:
    return (
        (index * 37) % 2048 - 1024,
        (index * 19) % 1024 - 512,
        (index * 23) % 2048 - 1024,
    )


def check_trace(path: Path) -> None:
    accepted: list[int] = []
    consumed = 0
    sensor_index = 0
    epoch = -1
    epoch_results = 0
    total_results = 0
    total_drops = 0
    seen_epochs: list[int] = []

    for line_number, raw_line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        fields = raw_line.split(",")
        kind = fields[0]
        if kind == "RESET":
            if epoch >= 0:
                seen_epochs.append(epoch_results)
            epoch += 1
            accepted.clear()
            consumed = 0
            sensor_index = 0
            epoch_results = 0
            continue
        if epoch < 0:
            raise AssertionError(f"line {line_number}: event before RESET")
        if kind in ("A", "D") and len(fields) == 4:
            xyz = tuple(map(int, fields[1:]))
            expected_xyz = sensor_sample(sensor_index)
            if xyz != expected_xyz:
                raise AssertionError(
                    f"line {line_number}: sensor XYZ {xyz} != {expected_xyz}"
                )
            sensor_index += 1
            if kind == "A":
                accepted.append(xyz[0])
            else:
                total_drops += 1
        elif kind == "R" and len(fields) == 4:
            actual_peak, actual_sum, actual_count = map(int, fields[1:])
            window = accepted[consumed : consumed + WINDOW_SIZE]
            if len(window) != WINDOW_SIZE:
                raise AssertionError(f"line {line_number}: result before 16 accepted samples")
            expected = (max(map(abs, window)), sum(x * x for x in window), WINDOW_SIZE)
            actual = (actual_peak, actual_sum, actual_count)
            if actual != expected:
                raise AssertionError(
                    f"line {line_number}: result {actual} != Python {expected}"
                )
            consumed += WINDOW_SIZE
            epoch_results += 1
            total_results += 1
            print(
                f"PASS epoch={epoch} window={epoch_results}: "
                f"peak={actual_peak} sum_squares={actual_sum} count={actual_count}"
            )
        else:
            raise AssertionError(f"line {line_number}: malformed event {raw_line!r}")

    if epoch >= 0:
        seen_epochs.append(epoch_results)
    if len(seen_epochs) != 2 or any(count < 2 for count in seen_epochs):
        raise AssertionError(f"expected two windows per reset epoch: {seen_epochs}")
    if total_drops < 3:
        raise AssertionError(f"expected forced FIFO drops, got {total_drops}")
    print(
        f"PASS Python golden: {total_results} windows, {total_drops} dropped pulses, "
        f"{len(seen_epochs)} reset epochs; only accepted X samples accumulated"
    )


if __name__ == "__main__":
    trace = Path(sys.argv[1] if len(sys.argv) > 1 else "lis3dh_pipeline_trace.csv")
    try:
        check_trace(trace)
    except (AssertionError, OSError, ValueError) as exc:
        print(f"FAIL Python golden: {exc}", file=sys.stderr)
        raise SystemExit(1) from exc
