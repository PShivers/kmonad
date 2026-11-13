#Requires AutoHotkey v2.0
#SingleInstance Force

; ==========================================================================
; KMonad Hotkey Toggle
;
; NOTE: When KMonad is active, Left Alt is your Nav layer toggle and
; Right Alt is Control, so Windows cannot receive an "Alt" keypress!
; Therefore, we use F12 (or Ctrl+Shift+K) which works regardless of KMonad state.
; ==========================================================================

; Press F12 to toggle KMonad on/off
F12::
{
    ToggleKmonad()
}

; You can also use Ctrl + Shift + K (does not require Alt):
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
