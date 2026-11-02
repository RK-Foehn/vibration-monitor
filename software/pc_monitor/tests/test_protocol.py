import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from analysis import BaselineCalibration
from protocol import HEADER, SequenceTracker, UartDecoder, status_labels


class ProtocolTests(unittest.TestCase):
    def test_real_uart_excerpt_from_teammate_handoff(self):
        fixture = Path(__file__).parent / "fixtures" / "real_uart_excerpt.txt"
        lines = fixture.read_bytes().decode("ascii").splitlines()
        self.assertEqual(lines[0], HEADER)
        decoder = UartDecoder()
        self.assertEqual(decoder.feed_line(lines[0]).kind, "header")
        first = decoder.feed_line(lines[1]).measurement
        second = decoder.feed_line(lines[2]).measurement
        self.assertEqual((first.sequence, first.peak, first.sum_squares,
                          first.sample_count, first.status, first.drop_count),
                         (1, 28, 0x1D8A, 16, 0x15, 0))
        self.assertEqual((second.sequence, second.peak, second.sum_squares,
                          second.ps_skipped), (4, 51, 0x2AB5, 2))
        self.assertAlmostEqual(first.raw_rms, (0x1D8A / 16) ** 0.5)

    def test_startup_repeated_header_and_parse_recovery(self):
        decoder = UartDecoder()
        row = "1,28,00000000,00001D8A,16,0,00000015,0"
        self.assertEqual(decoder.feed_line("Hello Zynq").kind, "info")
        self.assertEqual(decoder.feed_line("DEVICE_ID=0x56494231 expected=0x56494231").kind, "info")
        self.assertEqual(decoder.feed_line(row).kind, "info")  # No header yet.
        decoder.feed_line("# source=PL; axis=X; unit=raw_count; rms_includes_DC")
        decoder.feed_line(HEADER)
        self.assertEqual(decoder.feed_line("malformed,row").kind, "error")
        self.assertEqual(decoder.parse_failures, 1)
        self.assertEqual(decoder.feed_line(row).measurement.source, "PL")
        self.assertEqual(decoder.feed_line(HEADER).kind, "header")
        self.assertEqual(decoder.feed_line(row).kind, "measurement")

    def test_strict_sender_ranges_and_status_bits(self):
        decoder = UartDecoder()
        decoder.feed_line(HEADER)
        bad = "1,32769,00000000,00001D8A,16,0,00000015,0"
        self.assertEqual(decoder.feed_line(bad).kind, "error")
        self.assertIn("传感器曾发生覆盖（锁存）", status_labels(0x15))
        self.assertNotIn("初始化错误（锁存）", status_labels(0x15))

    def test_sequence_gap_wrap_duplicate_and_reset(self):
        tracker = SequenceTracker()
        self.assertEqual(tracker.observe(0xFFFFFFFF).kind, "first")
        self.assertEqual(tracker.observe(0).kind, "normal")
        self.assertEqual(tracker.observe(0).kind, "duplicate")
        event = tracker.observe(3)
        self.assertEqual((event.kind, event.skipped), ("gap", 2))
        self.assertEqual(tracker.observe(1).kind, "backward_or_reset")


class CalibrationTests(unittest.TestCase):
    def test_requires_real_baseline_and_adjusts_only_after_completion(self):
        calibration = BaselineCalibration()
        self.assertEqual(calibration.classify(1000), "未标定")
        with self.assertRaises(ValueError):
            calibration.adjust(50, 100)
        calibration.start(5)
        for value in (20, 22, 21, 23):
            self.assertIsNone(calibration.add(value))
        threshold = calibration.add(21)
        self.assertGreater(threshold.alarm, threshold.enhanced)
        self.assertIn("正常基线范围", calibration.classify(21))
        self.assertIn("超阈值", calibration.classify(1000))
        calibration.adjust(40, 80)
        self.assertEqual(calibration.thresholds.alarm, 80)
        calibration.reset()
        self.assertEqual(calibration.classify(1000), "未标定")


if __name__ == "__main__":
    unittest.main()
