#NoEnv
#SingleInstance, Force
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
}

ImageSearchIW(bitmap) {
    ImageSearch, alliance_x, alliance_y, 0, 0, A_ScreenWidth, A_ScreenHeight,*50 %bitmap%
    if (ErrorLevel = 2)
        MsgBox Could not conduct the search.
    else if (ErrorLevel = 1)
        MsgBox Icon could not be found on the screen.
    Click %alliance_x%, %alliance_y%
}

ActivateIW()
Sleep, 1000
SysGet, Monitor, MonitorPrimary

WinMove, 0, 0
Winset, Alwaysontop, , A ; active window will be set as AlwaysOnTop

^z::
;bitmap := "alliance.bmp"
;ImageSearchIW(bitmap)

; Search 'Alliance Icon'
ImageSearch, alliance_x, alliance_y, 0, 0, A_ScreenWidth, A_ScreenHeight,*50 alliance.bmp 
if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
else if (ErrorLevel = 1)
    MsgBox Icon could not be found on the screen.

Click %alliance_x%, %alliance_y%

; Search 'Technology'
Sleep, 1000
ImageSearch, technology_x, technology_y, 0, 0, A_ScreenWidth, A_ScreenHeight,*50 technology.bmp 
if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
else if (ErrorLevel = 1)
    MsgBox Icon could not be found on the screen.
Click %technology_x%, %technology_y%

; Search 'Priority Technology'
Sleep, 1000
ImageSearch, research_x, research_y, 0, 0, A_ScreenWidth, A_ScreenHeight,*50 research.bmp 
if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
else if (ErrorLevel = 1)
    MsgBox Icon could not be found on the screen.
Click %research_x%, %research_y%

; Contribute, but make sure we don't contribute Gold
Sleep, 1000
ImageSearch, contribute_x, contribute_y, 0, 0, A_ScreenWidth, A_ScreenHeight,*25 contribute.bmp 
if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
else if (ErrorLevel = 1)
    MsgBox Icon could not be found on the screen.
Click %contribute_x%, %contribute_y%

