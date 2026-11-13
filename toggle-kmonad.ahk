#Requires AutoHotkey v2.0
#SingleInstance Force

; ==========================================================================
; KMonad Hotkey Toggle
; Press Ctrl + Alt + K to start or stop KMonad.
; You can change the hotkey below (e.g., F12, ^!k, ^+k, ScrollLock, etc.)
; ==========================================================================

^!k::
{
    if ProcessExist("kmonad.exe")
    {
        ProcessClose("kmonad.exe")
        TrayTip "KMonad", "KMonad Stopped (Default layout)", "Iconi 1"
    }
    else
    {
        Run '"' . A_ScriptDir . '\kmonad.exe" "' . A_ScriptDir . '\config.kbd"', A_ScriptDir, "Hide"
        TrayTip "KMonad", "KMonad Started (Colemak-DH active)", "Iconi 1"
    }
}
