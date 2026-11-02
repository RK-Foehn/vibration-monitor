"""Check captured demo text. PASS verifies content, never hardware provenance."""
import argparse
import json
import re
from pathlib import Path

META = "# source=SIMULATED; unit=mg; delay_us=100000"
HEADER = "seq,x_mg,y_mg,z_mg"


def validate(text, min_rows=100):
    if min_rows < 1:
        raise ValueError("min_rows must be positive")
    lines = [line.strip() for line in text.splitlines() if line.strip()]
    if len(lines) < 3 or lines[:3] != ["Hello Zynq", META, HEADER]:
        raise ValueError("capture must start with Hello, SIMULATED metadata and CSV header")
    previous = None
    rows = 0
    for line in lines[3:]:
        if not re.fullmatch(r"[0-9]+,-?[0-9]+,-?[0-9]+,-?[0-9]+", line):
            raise ValueError(f"invalid row or unexpected restart at sample {rows}: {line!r}")
        seq, x, y, z = map(int, line.split(","))
        if not 0 <= seq <= 0xFFFFFFFF:
            raise ValueError("sequence outside uint32 range")
        if previous is None and seq != 0:
            raise ValueError("first sample must be zero; start capture before running ELF")
        if previous is not None and seq != ((previous + 1) & 0xFFFFFFFF):
            raise ValueError(f"sequence gap, duplicate or reset: {previous} -> {seq}")
        if not (-100 <= x <= 100 and -50 <= y <= 50 and 975 <= z <= 1025):
            raise ValueError("XYZ outside this demo's declared synthetic ranges")
        previous = seq
        rows += 1
    if rows < min_rows:
        raise ValueError(f"only {rows} rows; require at least {min_rows}")
    return {"status": "PASS", "rows": rows, "data_source": "SIMULATED",
            "scope": "log_content_only; hardware_origin_and_timing_not_verified"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("log", type=Path)
    parser.add_argument("--min-rows", type=int, default=100)
    args = parser.parse_args()
    try:
        result = validate(args.log.read_text(encoding="utf-8-sig"), args.min_rows)
    except (OSError, UnicodeError, ValueError) as exc:
        print(json.dumps({"status": "FAIL", "reason": str(exc)}, ensure_ascii=False))
        return 1
    print(json.dumps(result, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
