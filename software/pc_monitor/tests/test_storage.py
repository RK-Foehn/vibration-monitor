import csv
import json
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from protocol import HEADER, SequenceTracker, UartDecoder
from storage import CsvRecorder, compare_captures, summarize_capture


class StorageTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.decoder = UartDecoder()
        self.decoder.feed_line("# source=PL; axis=X; unit=raw_count")
        self.decoder.feed_line(HEADER)

    def _measurement(self, line="1,28,00000000,00001D8A,16,0,00000015,0"):
        return self.decoder.feed_line(line).measurement

    def test_csv_all_fields_and_event_summary(self):
        path = self.root / "condition_a.csv"
        recorder = CsvRecorder(path)
        item = self._measurement()
        recorder.record(item, "正常运行", SequenceTracker().observe(item.sequence))
        recorder.event("parse_error", "bad line", "garbage")
        recorder.event("threshold_event", "raw count threshold", item.raw_line)
        recorder.close()
        with path.open(newline="", encoding="utf-8-sig") as stream:
            rows = list(csv.DictReader(stream))
        self.assertEqual(len(rows), 1)
        self.assertEqual(rows[0]["result_seq"], "1")
        self.assertEqual(rows[0]["sum_squares_raw_counts_squared"], "7562")
        self.assertEqual(rows[0]["status_live_hex"], "00000015")
        self.assertEqual(rows[0]["raw_uart_line"], item.raw_line)
        self.assertEqual(rows[0]["phase"], "正常运行")
        stats = json.loads(path.with_name("condition_a.summary.json").read_text(encoding="utf-8"))
        self.assertEqual((stats["measurements"], stats["parse_errors"], stats["anomaly_events"]),
                         (1, 1, 1))
        self.assertTrue(path.with_name("condition_a.events.csv").exists())
        with self.assertRaises(FileExistsError):
            CsvRecorder(path)

    def test_two_condition_comparison_and_source_warning(self):
        first = self.root / "normal.csv"
        second = self.root / "disturbed.csv"
        a = CsvRecorder(first)
        a.record(self._measurement(), "正常运行", SequenceTracker().observe(1))
        a.close()
        b = CsvRecorder(second)
        b.record(self._measurement("4,51,00000000,00002AB5,16,2,00000015,0"),
                 "受控扰动", SequenceTracker().observe(4))
        b.close()
        self.assertEqual(summarize_capture(first).peak_median, 28)
        text = compare_captures(first, second)
        self.assertIn("28.00 counts", text)
        self.assertIn("51.00 counts", text)
        self.assertIn("不代表机械故障诊断", text)

    def test_mixed_real_and_demo_comparison_is_flagged(self):
        first = self.root / "real.csv"
        second = self.root / "demo.csv"
        a = CsvRecorder(first)
        a.record(self._measurement(), "正常运行", SequenceTracker().observe(1))
        a.close()
        self.decoder.feed_line("# source=SIMULATED; axis=X; unit=raw_count")
        b = CsvRecorder(second)
        b.record(self._measurement(), "正常运行", SequenceTracker().observe(1))
        b.close()
        self.assertIn("来源不同", compare_captures(first, second))

    def test_teammate_receiver_csv_compatibility(self):
        path = self.root / "windows.csv"
        with path.open("w", encoding="utf-8", newline="") as stream:
            writer = csv.DictWriter(stream, fieldnames=(
                "source", "peak_raw", "sum_squares_raw", "sample_count"))
            writer.writeheader()
            writer.writerow({"source": "PL", "peak_raw": 28,
                             "sum_squares_raw": 7562, "sample_count": 16})
        self.assertEqual(summarize_capture(path).rms_median, (7562 / 16) ** 0.5)


if __name__ == "__main__":
    unittest.main()
