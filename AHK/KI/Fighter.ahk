#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative  ;sets coordinates based upon active window

Idle() {
    Send, {Enter}
    SendInput, {Enter}
    Sleep, 1000
}

Block() {
    SendInput, {Left}
    Sleep, 500
}

^p::Pause

^i::
Loop 
{
    Idle()
    Block()
}

!q::ExitApp