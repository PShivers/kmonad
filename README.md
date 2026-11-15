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
3. **Space**:
   * Pure, normal **Space** (no tap-hold behavior).
4. **Bottom Row Modifiers (Left to Right)**:
   * Physical **Left Ctrl** $\rightarrow$ **Windows (`lmet`)**
   * Physical **Left Win** $\rightarrow$ **Alt (`lalt`)**
   * Physical **Left Alt** $\rightarrow$ **Control (`lctl`)**
   * Physical **Space** $\rightarrow$ **Space (`spc`)**
   * Physical **Right Alt** $\rightarrow$ **Navigation Layer Toggle (`@nav`)**
5. **Right Alt $\rightarrow$ Ergonomic Right-Hand Navigation Layer**:
   * Hold **Right Alt** to unlock navigation:
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
The script shows an always-visible badge in your Windows system tray:
* **`[DH]` (Vibrant Blue badge)**: Colemak-DH layout is active.
* **`[QW]` (Subtle Charcoal badge)**: Normal QWERTY layout is active.

### 2. Single Hotkey: `Alt + Space`
* **To Turn Colemak ON**: Press **`Alt + Space`**.
* **To Turn Colemak OFF**: Press **`Alt + Space`** (or hold **`Right Alt`** and tap **`Space`**).

### 3. Copilot Key $\rightarrow$ Command Palette Bridge
* Because KMonad remaps Left Win $\rightarrow$ Alt, the Copilot key hardware event (`Win + Shift + F23`) is translated into `Alt + Shift + F23`.
* `toggle-kmonad.ahk` catches this event and immediately triggers the native Windows Command Palette shortcut (`Win + C`), so your Copilot key works seamlessly at all times!

---

## Manual Execution / Testing

```powershell
.\kmonad.exe .\config.kbd
```
*(Press `Ctrl+C` in that console to stop.)*
