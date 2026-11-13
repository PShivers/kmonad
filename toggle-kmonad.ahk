#Requires AutoHotkey v2.0
#SingleInstance Force

; ==========================================================================
; KMonad Layout Manager & Toggle
;
; Hotkey: Alt + Space
;
; Visual Indicator:
;   Shows a badge in your taskbar system tray:
;   - [DH] (Blue badge)  when Colemak-DH is active
;   - [QW] (Gray badge)  when default QWERTY is active
; ==========================================================================

IconColemak := A_ScriptDir . "\icons\colemak.ico"
IconQwerty  := A_ScriptDir . "\icons\qwerty.ico"

; Set up custom Tray Menu
A_IconTip := "QWERTY (Default)"
Tray := A_TrayMenu
Tray.Delete()
Tray.Add("Toggle Layout (Alt+Space)", (*) => ToggleKmonad())
Tray.Add("Edit config.kbd", (*) => Run('notepad.exe "' . A_ScriptDir . '\config.kbd"'))
Tray.Add()
Tray.Add("Exit", (*) => ExitApp())

; Check initial state on launch and start monitor timer
UpdateVisualState()
SetTimer(UpdateVisualState, 1000)

; --------------------------------------------------------------------------
; Single Unified Hotkey: Alt + Space
; --------------------------------------------------------------------------
!Space::
{
    ToggleKmonad()
}

ToggleKmonad()
{
    if ProcessExist("kmonad.exe")
    {
        ProcessClose("kmonad.exe")
        UpdateVisualState()
        TrayTip("QWERTY Active", "Default keyboard restored", "Iconi Mute 1")
    }
    else
    {
        Run('"' . A_ScriptDir . '\kmonad.exe" "' . A_ScriptDir . '\config.kbd"', A_ScriptDir, "Hide")
        UpdateVisualState()
        TrayTip("Colemak-DH Active", "KMonad layout active", "Iconi Mute 1")
    }
}

UpdateVisualState()
{
    static lastState := -1
    currentState := ProcessExist("kmonad.exe") ? 1 : 0

    if (currentState != lastState)
    {
        if (currentState == 1)
        {
            if FileExist(IconColemak)
                TraySetIcon(IconColemak, , true)
            A_IconTip := "Colemak-DH Active`n(Alt+Space to toggle)"
        }
        else
        {
            if FileExist(IconQwerty)
                TraySetIcon(IconQwerty, , true)
            A_IconTip := "QWERTY Active`n(Alt+Space to toggle)"
        }
        lastState := currentState
    }
}
