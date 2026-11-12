# KMonad Windows Configuration (Colemak-DH)

A Git repository for managing and running your [KMonad](https://github.com/kmonad/kmonad) keyboard configuration on Windows.

---

## Current Configuration Overview

The configuration in [config.kbd](file:///c:/Users/pshivers/code-win/kmonad/config.kbd) replicates your AutoHotkey setup (`qwerty2colemakdh_with_spacectrl.ahk`) with the following enhancements:

1. **Colemak-DH ANSI Layout**:
   * Letters remapped from QWERTY to Colemak-DH.
2. **Caps Lock & Backspace Swapped**:
   * Physical `CapsLock` $\rightarrow$ `Backspace`
   * Physical `Backspace` $\rightarrow$ `CapsLock`
3. **Space Dual-Role (`@spc-ctl`)**:
   * **Tap**: `Space`
   * **Hold (> 200ms)**: `Left Control`
4. **Right Alt Navigation Layer (`@nav`)**:
   * Hold **Right Alt** to activate navigation without leaving the home row:
     * `H / J / K / L` (physical) $\rightarrow$ `Left / Down / Up / Right`
     * `U / I / O / P` (physical) $\rightarrow$ `Home / PageDown / PageUp / End`
     * Physical `CapsLock` $\rightarrow$ `Backspace`
     * Physical `Backspace` $\rightarrow$ `Delete`
     * All modifier combinations (like `Shift` for selection or `Ctrl` for word jump) pass through transparently.

---

## Running KMonad

### Option A: Direct Command / PowerShell
```powershell
.\kmonad.exe .\config.kbd
```
*(Press `Ctrl+C` in the console to stop.)*

### Option B: Batch Script (No ExecutionPolicy restrictions)
```cmd
.\start-kmonad.bat
```

### Option C: Background Mode
```powershell
powershell -ExecutionPolicy Bypass -File .\start-kmonad.ps1 -Background
```
To stop the background process:
```powershell
Stop-Process -Name kmonad
```

---

## Starting Automatically on Boot (Task Scheduler)

1. Press `Win + R`, type `taskschd.msc`, and press Enter.
2. Click **Create Task**:
   * **General**: Name: `KMonad`, select **Run only when user is logged on**.
   * **Triggers**: Click **New...** $\rightarrow$ Begin the task **At log on**.
   * **Actions**: Click **New...** $\rightarrow$ Program: `powershell.exe`, Arguments:
     ```text
     -WindowStyle Hidden -ExecutionPolicy Bypass -File "c:\Users\pshivers\code-win\kmonad\start-kmonad.ps1" -Background
     ```
3. Save the task.
