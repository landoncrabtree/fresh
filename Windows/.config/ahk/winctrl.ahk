#SingleInstance force
SetWorkingDir(A_ScriptDir) ; Ensures a consistent starting directory.
;#InstallKeybdHook ; see: https://www.autohotkey.com/docs/v1/lib/_HotkeyModifierTimeout.htm

; doc:
; https://www.ahkgen.com/
; https://autohotkey.com/docs/Hotkeys.htm
; https://autohotkey.com/docs/KeyList.htm
; https://www.autohotkey.com/docs/commands/Send.htm

; ^ = Control
; ! = Alt
; + = Shift
; # = Windows
; * = Wildcard / ignore Modifiers
; $ = no Recursion
; ~ = no Key Masking

; sharpkeys: https://github.com/randyrants/sharpkeys/releases/
; online .reg remap generator: https://n8ta.com/projects/windows_key_remapper.html

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '" /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
    ExitApp
}

;MsgBox "A_IsAdmin: " A_IsAdmin "`nCommand line: " full_command_line

; Create a group for all terminal-related windows
GroupAdd "Terminals", "ahk_exe cmd.exe"
GroupAdd "Terminals", "ahk_exe powershell.exe"
GroupAdd "Terminals", "ahk_exe WindowsTerminal.exe"
GroupAdd "Terminals", "ahk_exe mintty.exe"

GroupAdd "AltTabWindow", "ahk_class MultitaskingViewFrame"  ; Windows 10
GroupAdd "AltTabWindow", "ahk_class TaskSwitcherWnd"  ; Windows Vista, 7, 8.1
GroupAdd "AltTabWindow", "ahk_class #32771"  ; Older, or with classic alt-tab enabled

#HotIf WinActive("ahk_group Terminals")
    ; Retain SIGINT behavior in terminals
    ^c::Send "^C" ; Ctrl+C
    ^z::Send "^Z" ; Ctrl+Z
    ^d::Send "^D" ; Ctrl+d
    LCtrl::LCtrl
    RCtrl::RCtrl
    LWin::LCtrl
    RWin::RCtrl
    ^Space::Send "!{F24}" ; Alt+F24
#HotIf

#HotIf
    LWin::LCtrl
    RWin::LCtrl
    LCtrl::LWin
    RCtrl::LWin
#HotIf

; From here on, Ctrl=Win & Win=Ctrl
; It's a little confusing but it's the best way to get the best of both worlds

; Set Flow Launcher hotkey to Alt+F24 via %appdata%\FlowLauncher\Settings.json
^Space::Send "!{F24}" ; Win+Space => Alt+F24

; Get macOS-like window management
#Up::Send "#{Tab}" ; Ctrl+Up => Ctrl+Tab




