#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative  ;sets coordinates based upon active window

ActivateKI() {
    iw_id := WinExist("Killer Instinct ahk_class ApplicationFrameWindow")
    if !(iw_id) {
        Run, "shell:AppsFolder\Microsoft.KillerInstinct-Win10_8wekyb3d8bbwe!App"
        iw_id := WinExist("Killer Instinct ahk_class ApplicationFrameWindow")
        WinActivate, ahk_id %iw_id%
    } else {
        if WinActive(ahk_id %iw_id%) {
            ;MsgBox, % "KI is active"
        } else {
            ;MsgBox, % "KI is running, but not active"
            WinActivate, ahk_id %iw_id%
        }
    }
    Sleep, 10000
}

Fight() {
    Enter
    Sleep, 10000
}

^k::ActivateKI()
^f::Fight()