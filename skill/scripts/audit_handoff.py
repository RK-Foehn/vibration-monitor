"""Read-only handoff audit; no board access and no third-party dependencies."""
import argparse, hashlib, json, sys, zipfile
from pathlib import Path
import xml.etree.ElementTree as ET

def audit(root):
    errors, refs = [], 0
    for xpr in (root / "fpga/vivado").rglob("*.xpr"):
        for element in ET.parse(xpr).iter():
            value = element.get("Path", "")
            if value.startswith("$PPRDIR/"):
                refs += 1
                target = xpr.parent / value[len("$PPRDIR/"):]
                if not target.exists(): errors.append("Missing XPR reference: " + str(target))
    xsa = root / "fpga/vivado/zynq_vibration_system/zynq_vibration_system_uart0.xsa"
    details = {}
    if not xsa.exists(): errors.append("XSA missing")
    else:
        with zipfile.ZipFile(xsa) as z:
            hw = ET.fromstring(z.read(next(n for n in z.namelist() if n.endswith(".hwh"))))
            params = {e.get("NAME"): e.get("VALUE") for e in hw.iter("PARAMETER")}
            details["uart0_enabled"] = params.get("PCW_UART0_PERIPHERAL_ENABLE") == "1"
            details["contains_bitstream"] = any(n.endswith(".bit") for n in z.namelist())
            details["xsa_sha256"] = hashlib.sha256(xsa.read_bytes()).hexdigest()
            if not details["uart0_enabled"]: errors.append("UART0 disabled")
            if not details["contains_bitstream"]: errors.append("XSA bitstream missing")
    for rel in ("fpga/rtl/vibration_axi_lite_slave.sv", "fpga/sim/tb_vibration_axi_lite_slave.sv",
                "software/pc_monitor/legacy/receiver.py", "software/ps_uart_app/build.py"):
        if not (root / rel).is_file(): errors.append("Required file missing: " + rel)
    return {"result": "FAIL" if errors else "PASS", "xpr_references_checked": refs,
            "hardware": details, "errors": errors, "scope": "static_only_not_board_validation"}

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("repo", type=Path)
    args = parser.parse_args()
    result = audit(args.repo.resolve())
    print(json.dumps(result, indent=2))
    sys.exit(1 if result["errors"] else 0)
