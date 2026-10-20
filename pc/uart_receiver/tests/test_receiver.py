import csv
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from receiver import Capture, DEMO, HEADER, parse_row

ROW = b"1,32768,00000000,8029b981,16,0,00000011,0\r\n"


class ReceiverTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.directory = Path(self.temp.name) / "capture"
        self.capture = Capture(self.directory)

    def tearDown(self):
        if not self.capture.raw.closed:
            self.capture.close()
        self.temp.cleanup()

    def rows(self):
        self.capture.csv_file.flush()
        with (self.directory / "windows.csv").open(encoding="utf-8-sig", newline="") as f:
            return list(csv.DictReader(f))

    def header(self):
        self.capture.feed((HEADER + "\n").encode())

    def test_demo(self):
        self.capture.feed(DEMO)
        rows = self.rows()
        self.assertEqual(len(rows), 5)
        self.assertEqual(rows[0]["sum_squares_raw"], "2150218113")
        self.assertEqual(rows[0]["source"], "SIMULATED")
        self.assertEqual(rows[0]["warnings"], "")

    def test_arbitrary_fragments_and_empty_timeouts(self):
        for byte in DEMO:
            self.capture.feed(bytes([byte]))
            self.capture.feed(b"")
        self.assertEqual(self.capture.count, 5)
        self.assertEqual((self.directory / "raw_uart.bin").read_bytes(), DEMO)

    def test_reject_malformed_and_recover(self):
        self.header()
        for raw in [b"\xff\n", b"1,2,3\n", ROW.replace(b"32768", b"32769"),
                    ROW.replace(b",16,", b",0,"),
                    ROW.replace(b"8029b981", b"00000001"),
                    ROW.replace(b"00000011", b"00000001")]:
            self.capture.feed(raw)
        self.capture.feed(ROW)
        self.assertEqual(self.capture.rejected, 6)
        self.assertEqual(self.capture.count, 1)

    def test_missing_header(self):
        self.capture.feed(ROW)
        self.assertEqual(self.capture.rejected, 1)
        self.assertEqual(self.capture.count, 0)

    def test_incomplete_line_not_accepted(self):
        self.header()
        self.capture.feed(ROW[:-2])
        self.capture.close()
        self.assertEqual(self.capture.count, 0)
        events = (self.directory / "events.jsonl").read_text()
        self.assertIn("incomplete", events)

    def test_overlong_line_recovery(self):
        self.header()
        self.capture.feed(b"x" * 5000 + b"\n" + ROW)
        self.assertEqual(self.capture.rejected, 1)
        self.assertEqual(self.capture.count, 1)

    def test_wrap_duplicate_gap(self):
        self.header()
        for seq in [4294967295, 0, 0, 3, 1]:
            self.capture.feed(str(seq).encode() + ROW[1:])
        rows = self.rows()
        self.assertEqual(rows[1]["pc_sequence_delta"], "1")
        self.assertIn("duplicate_sequence", rows[2]["warnings"])
        self.assertIn("sequence_gap", rows[3]["warnings"])
        self.assertIn("reset_or_reorder_or_large_gap", rows[4]["warnings"])

    def test_restart_resets_metadata_and_delta(self):
        self.capture.feed(DEMO)
        self.capture.feed(b"Hello Zynq\n")
        self.header()
        self.capture.feed(ROW)
        row = self.rows()[-1]
        self.assertEqual(row["session"], "2")
        self.assertEqual(row["source"], "UNKNOWN")
        self.assertEqual(row["pc_sequence_delta"], "")

    def test_35_bit_and_live_flags(self):
        row = parse_row("0,32768,00000004,00000000,16,0,0000001d,4294967295")
        self.assertEqual(row[2], 1 << 34)
        self.header()
        self.capture.feed(b"0,32768,00000004,00000000,16,0,0000001d,4294967295\n")
        self.assertIn("hardware_diagnostic_flags", self.rows()[0]["warnings"])

    def test_existing_directory_not_overwritten(self):
        with self.assertRaises(FileExistsError):
            Capture(self.directory)

    def test_pyserial_loopback(self):
        import serial
        with serial.serial_for_url("loop://", timeout=1) as port:
            port.write(DEMO)
            received = port.read(len(DEMO))
        self.assertEqual(received, DEMO)
        self.capture.feed(received)
        self.assertEqual(self.capture.count, 5)


if __name__ == "__main__":
    unittest.main(verbosity=2)
