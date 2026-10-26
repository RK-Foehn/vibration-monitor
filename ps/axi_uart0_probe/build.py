"""Run with Vitis 2023.2 Unified: vitis.bat -s build.py NEW_WORKSPACE."""
from pathlib import Path
import sys
import vitis
import zipfile
import xml.etree.ElementTree as ET
from compile_app import build_application

root = Path(__file__).resolve().parent
ws = Path(sys.argv[1]).resolve()
if ws.exists():
    raise RuntimeError('Use a new workspace')
with zipfile.ZipFile(root/'zynq_vibration_system_uart0.xsa') as archive:
    hardware=ET.fromstring(archive.read(next(n for n in archive.namelist() if n.endswith('.hwh'))))
    params={e.get('NAME'):e.get('VALUE') for e in hardware.iter('PARAMETER')}
uart0=params.get('PCW_UART0_PERIPHERAL_ENABLE')=='1'
allow_dcc='--allow-dcc' in sys.argv[2:]
if not uart0 and not allow_dcc:
    raise RuntimeError('XSA UART0 disabled; request corrected XSA or explicitly use --allow-dcc for compile-only diagnostic')
client = vitis.create_client()
try:
    client.set_workspace(str(ws))
    platform = client.create_platform_component(name='vibration_platform',
        hw=str(root/'zynq_vibration_system_uart0.xsa'), cpu='ps7_cortexa9_0',
        os='standalone', domain_name='standalone_a9', no_boot_bsp=True)
    if uart0:
        domain=platform.get_domain(name='standalone_a9')
        domain.set_config(option='os',param='standalone_stdout',value='ps7_uart_0')
        domain.set_config(option='os',param='standalone_stdin',value='ps7_uart_0')
    result = platform.build()
    print('PLATFORM_BUILD_RESULT', result, flush=True)
    if result != 0:
        raise RuntimeError('Platform build failed')
    build_application(client,ws,root,allow_dcc)
finally:
    vitis.dispose()
