"""Compare integrated XSim results with independent Python integer math."""

import argparse
import re
from pathlib import Path


WINDOWS = {
    "integrated_a": [3, -4, 0, 5],
    "integrated_b": [-32768, 7, -8, 9],
    "integrated_c": [10, -11, 12, -13],
    "integrated_after_reset": [9, -10, 11, -12],
    "default_8_16": list(range(-8, 8)),
}

RESULT_PATTERN = re.compile(
    r"^RESULT (\w+) peak=(\d+) sum=(\d+) count=(\d+)$", re.MULTILINE
)


def features(samples: list[int]) -> tuple[int, int, int]:
    return max(abs(value) for value in samples), sum(
        value * value for value in samples
    ), len(samples)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("xsim_log", type=Path)
    args = parser.parse_args()

    log_text = args.xsim_log.read_text(encoding="utf-8")
    if "PASS: FIFO-to-window-feature integration" not in log_text:
        raise AssertionError("XSim integration test did not report PASS")

    observed: dict[str, tuple[int, int, int]] = {}
    for match in RESULT_PATTERN.finditer(log_text):
        name = match.group(1)
        if name in observed:
            raise AssertionError(f"Duplicate result {name}")
        observed[name] = tuple(int(value) for value in match.groups()[1:])

    if observed.keys() != WINDOWS.keys():
        raise AssertionError(
            f"Result set differs: expected {list(WINDOWS)}, observed {list(observed)}"
        )

    for name, samples in WINDOWS.items():
        expected = features(samples)
        actual = observed[name]
        if actual != expected:
            raise AssertionError(f"{name}: Python {expected}, RTL {actual}")
        print(
            f"PASS {name}: peak={actual[0]} "
            f"sum_squares={actual[1]} count={actual[2]}"
        )

    print(f"PASS: Python matched all {len(WINDOWS)} integrated RTL windows")


if __name__ == "__main__":
    main()
