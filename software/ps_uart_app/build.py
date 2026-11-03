"""Vitis 2023.2 Unified: vitis.bat -s build.py NEW_WORKSPACE"""
from pathlib import Path
import sys, json, re, shutil, hashlib, zipfile
import xml.etree.ElementTree as ET
import vitis
root = Path(__file__).resolve().parent
repo = root.parents[1]
ws = Path(sys.argv[1]).resolve()
if ws.exists(): raise RuntimeError("Use a NEW workspace directory")
xsa = repo / "fpga/vivado/zynq_vibration_system/zynq_vibration_system_uart0.xsa"
with zipfile.ZipFile(xsa) as z:
    hw = ET.fromstring(z.read(next(n for n in z.namelist() if n.endswith(".hwh"))))
    params = {e.get("NAME"): e.get("VALUE") for e in hw.iter("PARAMETER")}
    if params.get("PCW_UART0_PERIPHERAL_ENABLE") != "1":
        raise RuntimeError("UART0 disabled in XSA")
    if not any(n.endswith(".bit") for n in z.namelist()):
        raise RuntimeError("PL bitstream missing from XSA")
client = vitis.create_client()
try:
    client.set_workspace(str(ws))
    platform = client.create_platform_component(name="vibration_platform", hw=str(xsa),
        cpu="ps7_cortexa9_0", os="standalone", domain_name="standalone_a9", no_boot_bsp=True)
    domain = platform.get_domain(name="standalone_a9")
    for key in ("standalone_stdout", "standalone_stdin"):
        domain.set_config(option="os", param=key, value="ps7_uart_0")
    rc = platform.build()
    if rc != 0: raise RuntimeError("Platform build failed: " + str(rc))
    exported = ws / "vibration_platform/export/vibration_platform"
    header = (exported / "sw/standalone_a9/include/xparameters.h").read_text()
    for macro, expected in (("XPAR_LIS3DH_VIBRATION_AXI_0_BASEADDR", 0x40000000), ("STDOUT_BASEADDRESS", 0xe0000000)):
        match = re.search(r"^#define\s+" + macro + r"\s+(0x[0-9a-fA-F]+)", header, re.M)
        if not match or int(match.group(1),16) != expected: raise RuntimeError("Hardware mismatch: " + macro)
    app = client.create_app_component(name="vibration_uart_app",
        platform=str(exported / "vibration_platform.xpfm"), domain="standalone_a9", template="hello_world")
    src = root / "vibration_uart_app/src"
    for f in src.iterdir():
        if f.is_file() and f.name not in (".clangd", "compile_commands.json", "app.yaml"):
            shutil.copy2(f, ws / "vibration_uart_app/src" / f.name)
    rc = app.build()
    elf = ws / "vibration_uart_app/build/vibration_uart_app.elf"
    if rc != 0 or not elf.is_file(): raise RuntimeError("Application build failed: " + str(rc))
    sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
    report = {"build": "PASS", "xsa_sha256": sha(xsa), "elf_sha256": sha(elf),
        "source_sha256": sha(src / "helloworld.c"), "elf": str(elf), "board_test_this_build": "NOT_RUN"}
    (ws / "build_result.json").write_text(json.dumps(report, indent=2))
    print("BUILD_SUCCESS", json.dumps(report), flush=True)
finally:
    vitis.dispose()
