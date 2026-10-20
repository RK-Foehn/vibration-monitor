"""Compile and execute actual C logic in ARM emulation, not board validation.

python -m pip install unicorn==2.1.4 pyelftools==0.33
python tests/run_arm_tests.py --gcc <arm-none-eabi-gcc.exe> --build <temporary dir>
"""
import argparse
import json
from pathlib import Path
import subprocess

from elftools.elf.elffile import ELFFile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn.arm_const import UC_ARM_REG_LR, UC_ARM_REG_SP, UC_ARM_REG_R0

CASES = [
    "embedded_selftest", "not_available_preserves_output", "null_callback",
    "null_output", "zero_attempts_no_reads", "torn_read_retry_success",
    "retry_limit_preserves_all_fields", "availability_lost",
    "sequence_wrap_zero_is_valid", "skipped_and_duplicate_sequences",
    "35_bit_combine", "live_diagnostics_separate",
]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--gcc", required=True)
    parser.add_argument("--build", required=True, type=Path)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    args.build.mkdir(parents=True, exist_ok=True)
    elf_path = args.build.resolve() / "snapshot_tests.elf"
    cmd = [args.gcc, "-mcpu=cortex-a9", "-marm", "-mfloat-abi=soft",
           "-std=c99", "-O1", "-g", "-ffreestanding", "-fno-builtin",
           "-Wall", "-Wextra", "-Werror", "-nostdlib",
           "-Wl,-Ttext=0x10000", "-Wl,-e,run_case",
           "-I", str(root / "src"), str(root / "src/mock_window.c"),
           str(root / "tests/test_snapshot.c"), "-o", str(elf_path)]
    subprocess.run(cmd, check=True)
    results = []
    with elf_path.open("rb") as stream:
        elf = ELFFile(stream)
        segments = [(s["p_vaddr"], s.data()) for s in elf.iter_segments()
                    if s["p_type"] == "PT_LOAD"]
        entry = elf.get_section_by_name(".symtab").get_symbol_by_name("run_case")[0]["st_value"]
    for index, name in enumerate(CASES):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        uc.mem_map(0, 0x200000)
        for address, data in segments:
            uc.mem_write(address, data)
        uc.reg_write(UC_ARM_REG_SP, 0x1f0000)
        uc.reg_write(UC_ARM_REG_LR, 0x1ff000)
        uc.reg_write(UC_ARM_REG_R0, index)
        uc.emu_start(entry, 0x1ff000, timeout=2_000_000, count=200_000)
        # Instruction/time exhaustion must never look like successful return.
        from unicorn.arm_const import UC_ARM_REG_PC
        returned = uc.reg_read(UC_ARM_REG_PC) == 0x1ff000
        code = uc.reg_read(UC_ARM_REG_R0)
        passed = returned and code == 0
        results.append({"case": name, "passed": passed, "return_code": code})
        print(f"{'PASS' if passed else 'FAIL'} {name} rc={code}")
    report = {"environment": "Unicorn ARM emulation; no board, BSP or AXI",
              "compile_command": cmd, "results": results}
    (args.build / "test_results.json").write_text(
        json.dumps(report, indent=2), encoding="utf-8")
    if not all(r["passed"] for r in results):
        raise SystemExit(1)
    print(f"{len(results)}/{len(results)} PASS")


if __name__ == "__main__":
    main()
