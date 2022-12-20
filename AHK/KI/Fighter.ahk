#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative  ;sets coordinates based upon active window

Idle() {
    SendInput, {Enter Down}
    SendInput, {Enter Up}
    Sleep, 10
}

Block() {
    SendInput, {Left Down}
}

^p::Pause

^i::
Loop 
{
    Idle()
    Block()
}

!q::ExitApp