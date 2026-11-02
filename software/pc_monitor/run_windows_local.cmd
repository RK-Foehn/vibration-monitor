@echo off
setlocal
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
    echo Project Python environment is missing: .venv
    echo See requirements.txt to prepare this environment.
    pause
    exit /b 1
)
".venv\Scripts\python.exe" -E -s -c "import serial, serial.tools.list_ports, tkinter, matplotlib; print('Serial dependency check OK: pyserial', serial.__version__)"
if errorlevel 1 (
    echo Dependency check failed. Dashboard was not started.
    echo Install dependencies with: .venv\Scripts\python.exe -m pip install -r requirements.txt
    pause
    exit /b 1
)
".venv\Scripts\python.exe" -E -s dashboard.py %*
if errorlevel 1 pause
endlocal
