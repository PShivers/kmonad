@echo off
setlocal
cd /d "%~dp0"

:: If KMonad is already running, kill it and exit
tasklist /FI "IMAGENAME eq kmonad.exe" 2>NUL | find /I /N "kmonad.exe">NUL
if "%ERRORLEVEL%"=="0" (
    taskkill /F /IM kmonad.exe >nul 2>&1
    echo [KMonad] Stopped. Default keyboard active.
    exit /b 0
)

:: Locate binary
where kmonad.exe >nul 2>nul
if %errorlevel% equ 0 (
    set "KMONAD_BIN=kmonad.exe"
) else if exist "%~dp0kmonad.exe" (
    set "KMONAD_BIN=%~dp0kmonad.exe"
) else (
    echo [ERROR] kmonad.exe not found!
    exit /b 1
)

:: Start KMonad detached in background so this batch script exits immediately
powershell -NoProfile -WindowStyle Hidden -Command "Start-Process '%KMONAD_BIN%' -ArgumentList '%~dp0config.kbd' -WindowStyle Hidden"
echo [KMonad] Started. Colemak-DH active.
