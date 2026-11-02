"""PC receiver for ps/axi_v1_mock; no XSA or hardware needed for --demo."""
import argparse
import csv
from datetime import datetime, timezone
import json
from pathlib import Path
import re
import sys
import time

HEADER = "seq,peak_raw,sumsq_hi_hex,sumsq_lo_hex,n,skipped,status_live_hex,drops_live"
FIELDS = ["received_utc", "session", "source", "seq", "peak_raw", "sum_squares_raw",
          "sample_count", "ps_skipped", "pc_sequence_delta", "status_live",
          "drops_live", "warnings"]
DEMO = ("Hello Zynq\r\n# source=SIMULATED; axis=X; unit=raw_count; no_MMIO\r\n"
        "# selftest=PASS\r\n" + HEADER + "\r\n" +
        "".join(f"{i},32768,00000000,8029b981,16,0,00000011,0\r\n"
                for i in range(1, 6))).encode("ascii")


def parse_row(text):
    parts = text.split(",")
    if len(parts) != 8:
        raise ValueError("expected 8 columns")
    values = []
    for i, part in enumerate(parts):
        pattern = r"[0-9a-fA-F]{1,8}" if i in (2, 3, 6) else r"[0-9]{1,10}"
        if not re.fullmatch(pattern, part):
            raise ValueError(f"invalid column {i + 1}")
        value = int(part, 16 if i in (2, 3, 6) else 10)
        if value > 0xffffffff:
            raise ValueError("value exceeds uint32")
        values.append(value)
    seq, peak, high, low, n, skipped, status, drops = values
    total = (high << 32) | low
    if peak > 32768 or not 1 <= n <= 16 or status & ~31:
        raise ValueError("outside current raw-X v1 field limits")
    if not status & 16:
        raise ValueError("result_available not set")
    if not peak * peak <= total <= n * peak * peak:
        raise ValueError("inconsistent peak/sum_squares/sample_count")
    return seq, peak, total, n, skipped, status, drops


class Capture:
    """Raw bytes always retained. CSV contains validated records only."""
    def __init__(self, directory):
        self.directory = Path(directory)
        self.directory.mkdir(parents=True, exist_ok=False)
        self.raw = (self.directory / "raw_uart.bin").open("wb")
        self.csv_file = (self.directory / "windows.csv").open(
            "w", newline="", encoding="utf-8-sig")
        self.events = (self.directory / "events.jsonl").open("w", encoding="utf-8")
        self.writer = csv.DictWriter(self.csv_file, fieldnames=FIELDS)
        self.writer.writeheader()
        self.buffer = bytearray()
        self.discard = False
        self.source = "UNKNOWN"
        self.session = 0
        self.previous = None
        self.ready = False
        self.latest = None
        self.count = 0
        self.rejected = 0

    def event(self, kind, message):
        self.events.write(json.dumps({"time_utc": datetime.now(timezone.utc).isoformat(),
                                      "kind": kind, "message": message}) + "\n")
        self.events.flush()

    def feed(self, data):
        self.raw.write(data)
        self.raw.flush()
        for byte in data:
            if byte == 10:
                if not self.discard:
                    self.line(bytes(self.buffer).rstrip(b"\r"))
                self.buffer.clear()
                self.discard = False
            elif not self.discard:
                self.buffer.append(byte)
                if len(self.buffer) > 4096:
                    self.rejected += 1
                    self.event("reject", "line exceeds 4096 bytes")
                    self.buffer.clear()
                    self.discard = True
        self.csv_file.flush()

    def line(self, raw):
        try:
            text = raw.decode("ascii")
            if not text:
                return
            if text == "Hello Zynq":
                self.session += 1
                self.previous = None
                self.source = "UNKNOWN"
                self.ready = False
                self.event("startup", text)
                return
            if text.startswith("#"):
                if text.startswith("# source="):
                    # Changed source starts a fresh comparison interval.
                    source = text[len("# source="):].split(";")[0].strip()
                    if source != self.source:
                        self.previous = None
                    self.source = source
                self.event("metadata", text)
                return
            if text == HEADER:
                self.ready = True
                self.event("header", text)
                return
            if not self.ready:
                raise ValueError("expected exact CSV header; restart firmware if attached mid-stream")
            seq, peak, total, n, skipped, status, drops = parse_row(text)
            delta = "" if self.previous is None else (seq - self.previous) & 0xffffffff
            warnings = []
            if delta == 0:
                warnings.append("duplicate_sequence")
            elif isinstance(delta, int) and delta >= 0x80000000:
                warnings.append("reset_or_reorder_or_large_gap")
            elif isinstance(delta, int) and delta > 1:
                warnings.append("sequence_gap")
            if self.source == "UNKNOWN":
                warnings.append("unknown_source")
            if status & 14:
                warnings.append("hardware_diagnostic_flags")
            if not status & 1:
                warnings.append("init_not_done")
            if drops:
                warnings.append("nonzero_drop_count")
            self.writer.writerow(dict(zip(FIELDS, [
                datetime.now(timezone.utc).isoformat(), self.session, self.source,
                seq, peak, total, n, skipped, delta, status, drops, ";".join(warnings)])))
            self.latest = dict(seq=seq, peak=peak, total=total, n=n, skipped=skipped,
                               status=status, drops=drops, source=self.source)
            self.previous = seq
            self.count += 1
            if warnings:
                self.event("warning", f"seq={seq}: {';'.join(warnings)}")
        except (ValueError, UnicodeError) as error:
            self.rejected += 1
            self.event("reject", f"{error}: {raw[:160]!r}")

    def close(self):
        if self.buffer or self.discard:
            self.event("incomplete", "unterminated final line retained only in raw_uart.bin")
        self.event("summary", f"accepted={self.count}, rejected={self.rejected}")
        self.raw.close()
        self.csv_file.close()
        self.events.close()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--demo", action="store_true")
    mode.add_argument("--input", type=Path, help="replay captured UART bytes")
    mode.add_argument("--port", help="e.g. COM5; serial mode is read-only")
    mode.add_argument("--list-ports", action="store_true")
    parser.add_argument("--baud", type=int, default=115200)
    parser.add_argument("--seconds", type=float, default=0, help="0=until Ctrl+C")
    parser.add_argument("--out", type=Path,
                        default=Path("captures") / datetime.now().strftime("%Y%m%d_%H%M%S_%f"))
    args = parser.parse_args()
    if args.baud <= 0 or args.seconds < 0:
        parser.error("baud must be positive; seconds must be nonnegative")
    serial = None
    if args.port or args.list_ports:
        try:
            import serial
            from serial.tools import list_ports
        except ImportError:
            parser.error("Install dependency first: python -m pip install -r requirements.txt")
        if args.list_ports:
            ports = list(list_ports.comports())
            for port in ports:
                print(f"{port.device}: {port.description}")
            if not ports:
                print("No serial ports found.")
            return 0
    capture = None
    try:
        capture = Capture(args.out)
        if args.demo:
            capture.feed(DEMO)
        elif args.input:
            with args.input.open("rb") as stream:
                while chunk := stream.read(1024):
                    capture.feed(chunk)
        else:
            print(f"Reading {args.port} @ {args.baud}, 8N1. Ctrl+C to save and stop.", flush=True)
            with serial.Serial(args.port, args.baud, timeout=0.25,
                               xonxoff=False, rtscts=False, dsrdtr=False) as stream:
                start = time.monotonic()
                while not args.seconds or time.monotonic() - start < args.seconds:
                    capture.feed(stream.read(min(stream.in_waiting or 1, 4096)))
        return 0
    except KeyboardInterrupt:
        print("Stopped by user.")
        return 0
    except Exception as error:
        if capture:
            capture.event("error", str(error))
        print(f"ERROR: {error}", file=sys.stderr)
        return 1
    finally:
        if capture:
            capture.close()
            print(f"Saved to {capture.directory.resolve()}; "
                  f"accepted={capture.count}, rejected={capture.rejected}")


if __name__ == "__main__":
    raise SystemExit(main())
