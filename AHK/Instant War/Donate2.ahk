#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative  ;sets coordinates based upon active window

SysGet, Mon1, Monitor

ActivateIW() {
    iw_id := WinExist("Instant War ahk_class ApplicationFrameWindow")
    if !(iw_id) {
        Run, "shell:AppsFolder\Playwing.InstantWar_nm0cbtd355jm6!App"
        iw_id := WinExist("Instant War ahk_class ApplicationFrameWindow")
        WinActivate, ahk_id %iw_id%
    } else {
        if WinActive(ahk_id %iw_id%) {
            ;MsgBox, % "IW is active"
        } else {
            ;MsgBox, % "IW is running, but not active"
            WinActivate, ahk_id %iw_id%
        }
    }
    Sleep, 10000
}

ResizeWin(Width = 0,Height = 0)
{
  WinGetPos,X,Y,W,H,A
  If %Width% = 0
    Width := W

  If %Height% = 0
    Height := H

  WinMove,A,,%X%,%Y%,%Width%,%Height%
  Sleep, 10000
}

Donate()
{
    ; Always bring IW to front
    ActivateIW()
    ResizeWin(1366, 768)
    WinMove, 0, 0

    ; Could inline this, but done for readability
    alliance_x := 1258
    alliance_y := 735 
    Click %alliance_x%, %alliance_y%
    Sleep, 1000

    tech_x := 420
    tech_y := 710
    Click %tech_x%, %tech_y%
    Sleep, 1000
}

^d::
Donate()

; toggle := !toggle
; if (toggle) {
;     SetTimer, Donate, 3600000
; } else {
;     SetTimer, Donate, Off
; }

