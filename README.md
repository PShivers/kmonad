# KMonad Windows Configuration (Colemak-DH)

A Git repository for managing and running your [KMonad](https://github.com/kmonad/kmonad) keyboard configuration on Windows.

---

## Current Configuration Overview

The configuration in [config.kbd](file:///c:/Users/pshivers/code-win/kmonad/config.kbd) provides:

1. **Colemak-DH ANSI Layout**:
   * Letters remapped from QWERTY to Colemak-DH.
2. **Caps Lock & Backspace Swapped**:
   * Physical `CapsLock` $\rightarrow$ `Backspace`
   * Physical `Backspace` $\rightarrow$ `CapsLock`
3. **Space Dual-Role (`@spc-ctl`)**:
   * **Tap**: `Space`
   * **Hold (> 200ms)**: `Left Control`
4. **Right Alt $\rightarrow$ Control**:
   * Physical `Right Alt` acts as `Right Control`.
5. **Left Alt $\rightarrow$ Ergonomic Right-Hand Navigation Layer**:
   * Hold **Left Alt** with your left thumb to unlock navigation across three rows of your right hand:
     * **Upper Row (Colemak `l / u / y`)**:
       * `l` (physical `u`) $\rightarrow$ **PageUp**
       * `u` (physical `i`) $\rightarrow$ **Up Arrow**
       * `y` (physical `o`) $\rightarrow$ **PageDown**
     * **Home Row (Colemak `m / n / e / i / o`)**:
       * `m` (physical `h`) $\rightarrow$ **Word Left** (`Ctrl + Left`)
       * `n` (physical `j`) $\rightarrow$ **Left Arrow**
       * `e` (physical `k`) $\rightarrow$ **Down Arrow**
       * `i` (physical `l`) $\rightarrow$ **Right Arrow**
       * `o` (physical `;`) $\rightarrow$ **Word Right** (`Ctrl + Right`)
     * **Bottom Row (Colemak `h / , / .`)**:
       * `h` (physical `m`) $\rightarrow$ **Home**
       * `,` (comma) $\rightarrow$ **Insert**
       * `.` (period) $\rightarrow$ **End**
     * **Extras**:
       * Physical `CapsLock` $\rightarrow$ Backspace
       * Physical `Backspace` $\rightarrow$ Delete

---

## Toggle On/Off on Keypress

### Option A: Windows Shortcut (No Extra Tools)
1. Right-click [toggle-kmonad.bat](file:///c:/Users/pshivers/code-win/kmonad/toggle-kmonad.bat) $\rightarrow$ **Show more options** $\rightarrow$ **Send to** $\rightarrow$ **Desktop (create shortcut)**.
2. Right-click the desktop shortcut $\rightarrow$ **Properties**:
   * Set **Shortcut key** to a combination **not using Alt** (e.g. `Ctrl + Shift + K`), because Left Alt is your Nav toggle and Right Alt is Control!
   * Set **Run** to **Minimized**.
3. Pressing this hotkey now **toggles KMonad ON and OFF**.

### Option B: AutoHotkey v2 Script
Run [toggle-kmonad.ahk](file:///c:/Users/pshivers/code-win/kmonad/toggle-kmonad.ahk):
* Press **`F12`** (or `Ctrl + Shift + K`) to toggle KMonad on/off with tray notifications.
* Place a shortcut in `shell:startup` to keep the hotkey active across reboots.

---

## Manual Execution / Testing

```powershell
.\kmonad.exe .\config.kbd
```
*(Press `Ctrl+C` in that console to stop.)*
