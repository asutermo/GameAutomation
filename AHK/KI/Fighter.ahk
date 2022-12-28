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
    PreciseSleep(1000)
    SendInput, {Enter Up}
}

Block() {
    SendInput, {a Down}
    PreciseSleep(100)
    SendInput, {a Up}
}

; U, Light Punch
; I, Medium Punch
; O, Heavy Punch
; J, Light Kick
; K, Medium Kick
; L, Heavy Kick
; P, HP+MP+LP
; ;, HK+MK+LK

Instinct() {
    SendInput, {o Down}
    SendInput, {l Down}
    PreciseSleep(20)
    SendInput, {o Up}
    SendInput, {l Up}
    PreciseSleep(100)   
}

ThrowForward() {
    SendInput, {j Down}
    SendInput, {u Down}
    PreciseSleep(20)
    SendInput, {j Up}
    SendInput, {u Up}
    PreciseSleep(100)     
}

ThrowBackward() {
    SendInput, {a Down}
    PreciseSleep(20)
    ThrowForward()
}

; Jago
Opener() {
    SendInput, {d Down}
    PreciseSleep(20)
    SendInput, {d Up}   
    SendInput, {i Down}
    PreciseSleep(20)
    SendInput, {i Up}
    SendInput, {i Down}
    PreciseSleep(20)
    SendInput, {i Up}
    PreciseSleep(100)
}

ShadowLaserSword() {
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
    SendInput, {a Down}
    PreciseSleep(20)
    SendInput, {a Up}
    PreciseSleep(20)
    SendInput, {u Down}
    PreciseSleep(20)
    SendInput, {u Up}
    PreciseSleep(20)
}


; Omen
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

; 
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

^s::
ShadowLaserSword()

^t::
ThrowForward()

