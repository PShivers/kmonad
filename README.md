# KMonad Windows Configuration (Colemak-DH)

A Git repository for managing and running your [KMonad](https://github.com/kmonad/kmonad) keyboard configuration on Windows.

---

## Current Configuration Overview

The configuration in [config.kbd](file:///c:/Users/pshivers/code-win/kmonad/config.kbd) provides:

1. **Colemak-DH ANSI Layout**:
   * Alpha keys remapped to Colemak-DH (`q w f p b j l u y ;` and `a r s t g m n e i o` and `x c d v z k h`).
2. **Caps Lock & Backspace Swapped**:
   * Physical `CapsLock` $\rightarrow$ `Backspace`
   * Physical `Backspace` $\rightarrow$ `CapsLock`
3. **Space Dual-Role (`@spc-ctl`)**:
   * **Tap**: `Space`
   * **Hold (> 200ms)**: `Left Control`
4. **Right Alt $\rightarrow$ Control**:
   * Physical `Right Alt` acts as `Right Control`.
5. **Left Alt $\rightarrow$ Navigation Layer (`IJKL` Arrow Cluster)**:
   * Hold **Left Alt** with your left thumb to navigate with your right hand:
     * `I` $\rightarrow$ `Up`
     * `J` $\rightarrow$ `Left`
     * `K` $\rightarrow$ `Down`
     * `L` $\rightarrow$ `Right`
     * `U / O` $\rightarrow$ `Home / End`
     * `Y / P` $\rightarrow$ `PageUp / PageDown`
     * Physical `CapsLock` $\rightarrow$ `Backspace`
     * Physical `Backspace` $\rightarrow$ `Delete`
     * All modifier combinations (e.g., `Shift` for selecting text) pass through transparently.

---

## Toggle On/Off on Keypress

### Option A: Windows Shortcut (No Extra Tools)
1. Right-click [toggle-kmonad.bat](file:///c:/Users/pshivers/code-win/kmonad/toggle-kmonad.bat) $\rightarrow$ **Show more options** $\rightarrow$ **Send to** $\rightarrow$ **Desktop (create shortcut)**.
2. Right-click the desktop shortcut $\rightarrow$ **Properties**:
   * Set **Shortcut key** (e.g. `Ctrl + Alt + K`).
   * Set **Run** to **Minimized** (prevents a window pop-up).
3. Pressing this hotkey now **toggles KMonad ON and OFF**.

### Option B: AutoHotkey v2 Script
Run [toggle-kmonad.ahk](file:///c:/Users/pshivers/code-win/kmonad/toggle-kmonad.ahk):
* Press **`Ctrl + Alt + K`** to toggle KMonad on/off with tray notifications.
* Place a shortcut in `shell:startup` to keep the hotkey active across reboots.

---

## Manual Execution / Testing

```powershell
.\kmonad.exe .\config.kbd
```
*(Press `Ctrl+C` in that console to stop.)*
