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
     * **Toggle Trigger**:
       * **Left Alt + Space** $\rightarrow$ Emits **`F22`** to cleanly turn KMonad off!

---

## Unified Toggle Shortcut: Left Alt + Space

Using [toggle-kmonad.ahk](file:///c:/Users/pshivers/code-win/kmonad/toggle-kmonad.ahk):

* **To turn KMonad ON**: Press **`Left Alt + Space`**.
* **To turn KMonad OFF**: Press **`Left Alt + Space`** (KMonad sends `F22`, which AHK intercepts to shut down KMonad).

*(Backups: `F12` or `Ctrl + Shift + K` also toggle).*

---

## Manual Execution / Testing

```powershell
.\kmonad.exe .\config.kbd
```
*(Press `Ctrl+C` in that console to stop.)*
