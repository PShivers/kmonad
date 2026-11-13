#Requires AutoHotkey v2.0
#SingleInstance Force

; ==========================================================================
; KMonad Hotkey Toggle
;
; Triggers supported:
;   1. Copilot Key (hardware sends Left Windows + Left Shift + F23)
;   2. F12 Key
;   3. Ctrl + Shift + K
; ==========================================================================

; Physical Copilot Key
*#+F23::
*<#<+F23::
{
    ToggleKmonad()
}

; Quick single-key fallback
F12::
{
    ToggleKmonad()
}

; Shortcut fallback
^+k::
{
    ToggleKmonad()
}

ToggleKmonad()
{
    if ProcessExist("kmonad.exe")
    {
        ProcessClose("kmonad.exe")
        TrayTip "KMonad", "KMonad Stopped (Default keyboard active)", "Iconi 1"
    }
    else
    {
        Run '"' . A_ScriptDir . '\kmonad.exe" "' . A_ScriptDir . '\config.kbd"', A_ScriptDir, "Hide"
        TrayTip "KMonad", "KMonad Started (Colemak-DH active)", "Iconi 1"
    }
}
