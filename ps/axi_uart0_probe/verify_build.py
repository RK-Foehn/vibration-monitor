"""Verify and package an already completed UART build; no board access."""
from pathlib import Path
import hashlib
import json
import shutil
import struct
import sys
import zipfile

root = Path(__file__).resolve().parent
ws = Path(sys.argv[1]).resolve()
log = Path(sys.argv[2]).read_bytes()
text = log.decode('utf-16' if log[:2] == b'\xff\xfe' else 'utf-8', errors='replace')
assert 'PLATFORM_BUILD_RESULT 0' in text
assert 'APP_BUILD_RESULT 0' in text
assert 'Traceback' not in text and 'error:' not in text.lower()
result = json.loads((ws/'axi_build_result.json').read_text())
assert result['console'] == 'UART0' and result['stdout'] == '0xe0000000'
assert result['axi_base'] == '0x40000000' and result['app_build_result'] == 0
elf = ws/'axi_probe_uart/build/axi_probe_uart.elf'
data = elf.read_bytes()
assert data[:6] == b'\x7fELF\x01\x01'
assert struct.unpack_from('<H', data, 18)[0] == 40  # EM_ARM
assert b'console=UART0' in data
artifacts = root/'artifacts'
artifacts.mkdir(exist_ok=True)
shutil.copy2(elf, artifacts/elf.name)
with zipfile.ZipFile(root/'zynq_vibration_system_uart0.xsa') as archive:
    for name in ['zynq_vibration_system_uart0.bit', 'ps7_init.tcl']:
        (artifacts/name).write_bytes(archive.read(name))
inc = ws/'vibration_platform/export/vibration_platform/sw/standalone_a9/include'
shutil.copy2(inc/'xparameters.h', root/'generated_xparameters.h.txt')
shutil.copy2(ws/'vibration_platform/ps7_cortexa9_0/standalone_a9/bsp/bsp.yaml',
             root/'generated_bsp.yaml.txt')
result.update(platform_build_result=0, elf_entry=hex(struct.unpack_from('<I', data, 24)[0]),
              compile_warning_lines=[l for l in text.splitlines() if 'warning:' in l.lower()],
              xsa_sha256=hashlib.sha256((root/'zynq_vibration_system_uart0.xsa').read_bytes()).hexdigest(),
              actual_device_id=None, ddr_test_executed=False,
              artifacts=[dict(file=p.name, bytes=p.stat().st_size,
                              sha256=hashlib.sha256(p.read_bytes()).hexdigest())
                         for p in sorted(artifacts.iterdir()) if p.is_file()])
(root/'build_evidence.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
print('VERIFIED: ARM ELF, UART0 stdout, AXI base, successful platform/application build')
print('BOARD TEST: NOT RUN')
