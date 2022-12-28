#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative  ;sets coordinates based upon active window
SetTitleMatchMode, 2 ; This lets any window that partially matches the given name get activated
#IfWinActive, Killer ; Only activate when app with "Killer" in the name is in focus

PreciseSleep(milliseconds)
{
    sleep_tick := A_TickCount + milliseconds
    while(A_TickCount < sleep_tick)
        continue
    return
}

Idle() {
    SendInput, {Enter Down}
    ;Sleep, 1000
    PreciseSleep(1000)
    SendInput, {Enter Up}
}

Block() {
    SendInput, {a Down}
    ;Sleep, 100
    ;PreciseSleep(100)
    ;SendInput, {a Up}
}

; U, Light Punch
; I, Medium Punch
; O, Heavy Punch
; J, Light Kick
; K, Medium Kick
; L, Heavy Kick
; P, HP+MP+LP
; ;, HK+MK+LK

Rashakuken() {
    SendInput, {s Down}
    PreciseSleep(20)
    SendInput, {s Up}
    PreciseSleep(20)
    SendInput, {s Down}
    SendInput, {d Down}
    PreciseSleep(20)
    SendInput, {s Up}
    SendInput, {d Up}
    PreciseSleep(20)
    SendInput, {d Down}
    PreciseSleep(20)
    SendInput, {d Up}
    PreciseSleep(20)
    SendInput, {i Down}
    PreciseSleep(20)
    SendInput, {i Up}
    PreciseSleep(100)
}


DemonicDespair() {
    SendInput, {s Down}
    PreciseSleep(20)
    SendInput, {s Up}
    PreciseSleep(20)
    SendInput, {s Down}
    SendInput, {d Down}
    PreciseSleep(20)
    SendInput, {s Up}
    SendInput, {d Up}
    PreciseSleep(20)
    SendInput, {d Down}
    PreciseSleep(20)
    SendInput, {d Up}
    PreciseSleep(20)
    SendInput, {u Down}
    SendInput, {j Down}
    PreciseSleep(20)
    SendInput, {u Up}
    SendInput, {j Up}
    PreciseSleep(20)
}

BlockadeRunner() {
    SendInput, {s Down}
    PreciseSleep(20)
    SendInput, {s Up}
    PreciseSleep(20)
    SendInput, {s Down}
    SendInput, {d Down}
    PreciseSleep(20)
    SendInput, {s Up}
    SendInput, {d Up}
    PreciseSleep(20)
    SendInput, {d Down}
    PreciseSleep(20)
    SendInput, {d Up}
    PreciseSleep(20)
    SendInput, {j Down}
    PreciseSleep(20)
    SendInput, {j Up}
    PreciseSleep(20)
}

!q::ExitApp
^p::Pause

^i::
Loop 
{
    Idle()
    Block()
}

^f::
Loop 
{
    BlockadeRunner()
    ;Rashakuken()
    ;DemonicDespair()
}

