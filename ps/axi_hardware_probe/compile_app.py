from pathlib import Path
import json
import re
import sys
import vitis

def build_application(client, ws, root, allow_dcc=False):
    exported = ws/'vibration_platform/export/vibration_platform'
    inc = exported/'sw/standalone_a9/include'
    text = (inc/'xparameters.h').read_text()
    def macro(name):
        match = re.search(r'^#define\s+' + name + r'\s+(0x[0-9a-fA-F]+)', text, re.M)
        if not match:
            raise RuntimeError('Missing generated macro: ' + name)
        return int(match.group(1), 16)
    base = macro('XPAR_LIS3DH_VIBRATION_AXI_0_BASEADDR')
    console = macro('STDOUT_BASEADDRESS')
    if base != 0x40000000:
        raise RuntimeError('Unexpected AXI address')
    if console == 0xe0000000:
        name, label = 'axi_probe_uart', 'UART0'
    elif console == 0xf8800000 and allow_dcc:
        name, label = 'axi_probe_dcc', 'JTAG_DCC_ONLY_NOT_UART'
    else:
        raise RuntimeError('UART0 absent: corrected XSA required. Explicit --allow-dcc permits diagnostic compile only.')
    app = client.create_app_component(name=name,
        platform=str(exported/'vibration_platform.xpfm'), domain='standalone_a9', template='hello_world')
    app.import_files(from_loc=str(root/'src'),
        files=['helloworld.c','vibration_regs.h','hardware_address.h'], dest_dir_in_cmp='src')
    (ws/name/'src/console_config.h').write_text('#define VIB_CONSOLE "' + label + '"\n')
    result = app.build()
    print('APP_BUILD_RESULT', result, flush=True)
    elf = ws/name/'build'/(name+'.elf')
    if result != 0 or not elf.is_file():
        raise RuntimeError('Application build did not produce ELF')
    (ws/'axi_build_result.json').write_text(json.dumps({
        'console':label, 'axi_base':hex(base), 'stdout':hex(console),
        'app_build_result':result,'elf':str(elf),'board_validation':'NOT_RUN',
        'uart_demo_ready':console==0xe0000000},indent=2))

if __name__ == '__main__':
    root=Path(__file__).resolve().parent
    ws=Path(sys.argv[1]).resolve()
    client=vitis.create_client()
    try:
        client.set_workspace(str(ws))
        build_application(client,ws,root,'--allow-dcc' in sys.argv[2:])
    finally:
        vitis.dispose()
