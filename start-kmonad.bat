@echo off
setlocal

cd /d "%~dp0"

where kmonad.exe >nul 2>nul
if %errorlevel% equ 0 (
    set "KMONAD_BIN=kmonad.exe"
) else if exist "%~dp0kmonad.exe" (
    set "KMONAD_BIN=%~dp0kmonad.exe"
) else (
    echo [ERROR] kmonad.exe not found in PATH or in the repository directory!
    echo.
    echo Please download kmonad.exe from:
    echo   https://github.com/kmonad/kmonad/releases
    echo and place it in this folder or add it to your Windows PATH.
    echo.
    pause
    exit /b 1
)

echo Starting KMonad with config.kbd...
echo Press Ctrl+C in this console to stop.
"%KMONAD_BIN%" "%~dp0config.kbd"

pause
