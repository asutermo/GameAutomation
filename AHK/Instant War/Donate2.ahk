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

; Remove if you don't want IW to start automatically.
ActivateIW()
ResizeWin(1366, 768)
WinMove, 0, 0

Donate()
{
    ; Always bring IW to front
    ActivateIW()
    ResizeWin(1366, 768)
    WinMove, 0, 0
    
    Send {Esc}

    ; Click off any menus
    Click 1297, 32
    Sleep, 1000

    ; Click off annoying p2w menu
    Click 804, 192
    Sleep, 1000

    ; Could inline this, but done for readability
    alliance_x := 1258
    alliance_y := 735 
    Click %alliance_x%, %alliance_y%
    Sleep, 2000

    tech_x := 420
    tech_y := 710
    Click %tech_x%, %tech_y%
    Sleep, 2000

    recommended_tech_x := 238
    recommended_tech_y := 214
    Click %recommended_tech_x%, %recommended_tech_y%
    Sleep, 2000

    contribute_x := 305
    contribute_y := 360
    Click %contribute_x% %contribute_y%
    Sleep, 2000

    ; Click off any menus
    Send, {Esc}
    Sleep, 100
    Send, {Esc}
}

TimeBeforeNextDonate := 1000

!d::Donate()
^p::Pause

^d::
Loop
{
  Donate()
  Sleep, %TimeBeforeNextDonate%
}

!q::Exit
