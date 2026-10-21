"""Vitis 2023.2 Unified: vitis.bat -s build.py <new workspace> [mock src]."""
from pathlib import Path
import sys
import shutil
import vitis

root = Path(__file__).resolve().parent
ws = Path(sys.argv[1]).resolve()
if ws.exists():
    raise RuntimeError("Select a new workspace; existing files will not be overwritten")
client = vitis.create_client()
try:
    client.set_workspace(str(ws))
    platform = client.create_platform_component(
        name="navigator_ps_candidate", hw=str(root / "system_wrapper.xsa"),
        cpu="ps7_cortexa9_0", os="standalone", domain_name="standalone_a9",
        no_boot_bsp=True)
    domain = platform.get_domain(name="standalone_a9")
    domain.set_config(option="os", param="standalone_stdout", value="ps7_uart_0")
    domain.set_config(option="os", param="standalone_stdin", value="ps7_uart_0")
    print("PLATFORM_BUILD_RESULT", platform.build(), flush=True)
    xpfm = ws / "navigator_ps_candidate/export/navigator_ps_candidate/navigator_ps_candidate.xpfm"
    app = client.create_app_component(name="uart_hello", platform=str(xpfm),
                                     domain="standalone_a9", template="hello_world")
    app.import_files(from_loc=str(root), files=["helloworld.c"], dest_dir_in_cmp="src")
    print("HELLO_BUILD_RESULT", app.build(), flush=True)
    if len(sys.argv) > 2:
        mock = Path(sys.argv[2]).resolve()
        app = client.create_app_component(name="uart_mock", platform=str(xpfm),
                                         domain="standalone_a9", template="hello_world")
        shutil.copyfile(str(mock / "main.c"), str(ws / "uart_mock/src/helloworld.c"))
        app.import_files(from_loc=str(mock), files=["mock_window.c", "mock_window.h", "vibration_regs.h"], dest_dir_in_cmp="src")
        print("MOCK_BUILD_RESULT", app.build(), flush=True)
    print("BUILD_SCRIPT_FINISHED; verify build status and ELF artifacts", flush=True)
finally:
    vitis.dispose()
