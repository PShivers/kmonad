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
   * Hold **Left Alt** with your left thumb to unlock navigation:
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

---

## Visual Layout Indicator & Toggle: `Alt + Space`

Run [toggle-kmonad.ahk](file:///c:/Users/pshivers/code-win/kmonad/toggle-kmonad.ahk) in the background (or drop a shortcut into `shell:startup`).

### 1. Visual Taskbar Badge
The script shows an always-visible badge in your Windows system tray (taskbar notification area):
* **`[DH]` (Vibrant Blue badge)**: Colemak-DH layout is active.
* **`[QW]` (Subtle Charcoal badge)**: Normal QWERTY layout is active.
* **Hovering**: Tooltip shows current layout (`Colemak-DH Active` vs `QWERTY Active`).
* **Right-click**: Context menu to toggle layout, edit `config.kbd`, or exit.

*(Tip: In Windows 11, drag the badge from the `^` overflow menu onto your main taskbar row so it is always visible right next to your clock).*

### 2. Single Hotkey: `Alt + Space`
* **To Turn Colemak ON**: Press **`Alt + Space`**.
* **To Turn Colemak OFF**: Press **`Alt + Space`**.

---

## Manual Execution / Testing

```powershell
.\kmonad.exe .\config.kbd
```
*(Press `Ctrl+C` in that console to stop.)*
