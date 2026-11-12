# KMonad Windows Configuration

A Git repository for managing and running your [KMonad](https://github.com/kmonad/kmonad) keyboard configuration on Windows.

---

## Repository Structure

```text
kmonad/
├── .gitignore         # Ignores binaries, logs, and temp files
├── README.md          # Setup and configuration guide
├── config.kbd         # Main KMonad keyboard configuration (Windows low-level hook)
├── start-kmonad.bat   # Windows Command Prompt batch launcher
└── start-kmonad.ps1   # PowerShell launcher (supports -Background flag)
```

---

## 1. Prerequisites & Installation

### Option A: Download Pre-built Binary
1. Go to the [KMonad GitHub Releases](https://github.com/kmonad/kmonad/releases).
2. Download the latest Windows binary (usually named `kmonad.exe` or `kmonad-*.exe`).
3. Either:
   - Place `kmonad.exe` directly in this repository folder (`.gitignore` excludes it from git commits), OR
   - Move `kmonad.exe` into a folder that is in your system `PATH` (such as `C:\Tools` or `C:\Users\<user>\bin`).

---

## 2. Windows Configuration Details

Windows KMonad uses Windows APIs directly without needing Linux-style device nodes:

```lisp
(defcfg
  input  (low-level-hook)
  output (send-event-sink)
  fallthrough true
  allow-cmd false
)
```

- **`input (low-level-hook)`**: Uses Windows low-level keyboard hooks to capture key events.
- **`output (send-event-sink)`**: Sends injected virtual keystrokes back to Windows.
- **`fallthrough true`**: Any keys not defined in `defsrc` or your layers will pass through normally.

---

## 3. Included Sample Layout

In `config.kbd`, standard US ANSI 60%/TKL keys are defined with useful everyday enhancements:
- **Caps Lock Dual-Role (`@ec`)**:
  - **Tap**: `Escape`
  - **Hold**: `Left Control`
- **Space Dual-Role (`@spcn`)**:
  - **Tap**: `Space`
  - **Hold**: Activates the **`nav`** layer
- **Navigation Layer (`nav`)**:
  - `H / J / K / L` -> Left / Down / Up / Right (Vim arrows)
  - `U / I / O / P` -> Home / PageDown / PageUp / End

You can customize or add more layers (e.g., NumPad, Symbols, Media controls) in `config.kbd`.

---

## 4. Running KMonad

### Interactive Mode (Foreground)
Using Batch script:
```cmd
start-kmonad.bat
```
Using PowerShell:
```powershell
.\start-kmonad.ps1
```
*(Press `Ctrl+C` in the console window to stop KMonad.)*

### Background Mode (No Console Window)
Using PowerShell:
```powershell
.\start-kmonad.ps1 -Background
```
To stop the background process later:
```powershell
Stop-Process -Name kmonad
```

---

## 5. Starting Automatically on Boot (Optional)

### Using Windows Startup Folder:
1. Press `Win + R`, type `shell:startup`, and hit Enter.
2. Create a shortcut to `start-kmonad.bat` (or use a `.vbs` wrapper / Task Scheduler to run without a pop-up window).

### Using Windows Task Scheduler:
1. Open **Task Scheduler** (`taskschd.msc`).
2. Click **Create Task** (not Basic Task).
3. **General**:
   - Name: `KMonad`
   - Select **Run only when user is logged on** (or **Run with highest privileges** if needed).
4. **Triggers**:
   - New Trigger: **At log on** of your user.
5. **Actions**:
   - Action: **Start a program**
   - Program/script: `powershell.exe`
   - Add arguments: `-WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\path\to\kmonad\start-kmonad.ps1" -Background`
