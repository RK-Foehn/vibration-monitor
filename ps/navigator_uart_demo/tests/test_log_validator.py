"""Synthetic test fixtures for the PC validator; not board measurements."""
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from validate_uart_log import validate, META, HEADER

PREFIX = "Hello Zynq\r\n" + META + "\r\n" + HEADER + "\r\n"


class ValidatorTests(unittest.TestCase):
    def test_valid_signed_csv(self):
        result = validate(PREFIX + "0,-38,46,991\r\n1,0,-50,1025\r\n", 2)
        self.assertEqual(result["rows"], 2)

    def test_gap_and_duplicate(self):
        for seq in (0, 2):
            with self.subTest(seq=seq), self.assertRaises(ValueError):
                validate(PREFIX + f"0,0,0,1000\n{seq},0,0,1000\n", 2)

    def test_restart(self):
        with self.assertRaises(ValueError):
            validate(PREFIX + "0,0,0,1000\nHello Zynq\n", 1)

    def test_corrupt_row(self):
        with self.assertRaises(ValueError):
            validate(PREFIX + "0,0,garbled,1000\n", 1)

    def test_short_log(self):
        with self.assertRaises(ValueError):
            validate(PREFIX + "0,0,0,1000\n", 100)

    def test_missing_metadata(self):
        with self.assertRaises(ValueError):
            validate("Hello Zynq\n" + HEADER + "\n0,0,0,1000\n", 1)

    def test_range(self):
        with self.assertRaises(ValueError):
            validate(PREFIX + "0,200,0,1000\n", 1)

    def test_midstream_capture(self):
        with self.assertRaises(ValueError):
            validate(PREFIX + "9,0,0,1000\n", 1)


if __name__ == "__main__":
    unittest.main()
