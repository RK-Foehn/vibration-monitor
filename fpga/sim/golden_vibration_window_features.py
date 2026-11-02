"""Check XSim window results against independent Python integer arithmetic."""

import argparse
import re
from pathlib import Path

WINDOWS = {
    "zeros": [0, 0, 0, 0],
    "signed": [3, -4, 0, 5],
    "min_negative": [-32768, 32767, -1, 0],
    "max_square": [-32768, -32768, -32768, -32768],
    "continuous_a": [1, 2, 3, 4],
    "continuous_b": [-5, -6, -7, -8],
    "after_reset": [9, -10, 11, -12],
}


def features(samples: list[int]) -> tuple[int, int, int]:
    peak = max(abs(value) for value in samples)
    sum_squares = sum(value * value for value in samples)
    return peak, sum_squares, len(samples)


RESULT_LINE = re.compile(
    r"^RESULT (\w+) peak=(\d+) sum=(\d+) count=(\d+)$", re.MULTILINE
)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("xsim_log", type=Path, help="xsim -runall log file")
    args = parser.parse_args()

    log_text = args.xsim_log.read_text(encoding="utf-8")
    if "PASS: fixed-window vibration features" not in log_text:
        raise AssertionError("XSim did not report PASS")

    observed = {}
    for match in RESULT_LINE.finditer(log_text):
        name = match.group(1)
        if name in observed:
            raise AssertionError(f"Duplicate RTL result: {name}")
        observed[name] = tuple(int(value) for value in match.groups()[1:])

    if observed.keys() != WINDOWS.keys():
        raise AssertionError(
            f"RTL result set differs: expected {list(WINDOWS)}, "
            f"observed {list(observed)}"
        )

    for name, samples in WINDOWS.items():
        expected = features(samples)
        actual = observed[name]
        if actual != expected:
            raise AssertionError(
                f"{name}: Python expected {expected}, RTL produced {actual}"
            )
        peak, sum_squares, count = actual
        print(f"PASS {name}: peak={peak} sum_squares={sum_squares} count={count}")

    print(f"PASS: Python matched all {len(WINDOWS)} RTL windows")


if __name__ == "__main__":
    main()
