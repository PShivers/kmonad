#Requires AutoHotkey v2.0
#SingleInstance Force

; ==========================================================================
; KMonad Hotkey Toggle
;
; Unified shortcut: Left Alt + Space (or F22)
; - When KMonad is OFF: Press Left Alt + Space to start KMonad.
; - When KMonad is ON:  Hold Left Alt + press Space (sends F22) to stop KMonad.
; ==========================================================================

; Intercept F22 (sent by KMonad when Left Alt + Space is pressed)
F22::
{
    ToggleKmonad()
}

; Intercept Left Alt + Space when KMonad is not running
<!Space::
{
    ToggleKmonad()
}

; Fallback shortcuts
F12::
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
