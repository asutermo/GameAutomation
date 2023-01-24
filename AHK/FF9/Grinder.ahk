#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

PreciseSleep(milliseconds)
{
    sleep_tick := A_TickCount + milliseconds
    while(A_TickCount < sleep_tick)
        continue
    return
}

; WASD to move
; V bring up character
; J auto-battle
; backspace pause
; LB = G
; RB = H
; LT = F 
; RT = J

!q::ExitApp
^q::ExitApp

^f::
Loop
{
    SendInput, {a Down}
    PreciseSleep(40)
    SendInput, {a Up}
    PreciseSleep(40)
    SendInput, {d Down}
    PreciseSleep(40)
    SendInput, {d Up}
    PreciseSleep(40)
    SendInput, {Enter Down}
    PreciseSleep(20)
    SendInput, {Enter Up}
    PreciseSleep(20)
    SendInput, {Enter Down}
    PreciseSleep(20)
    SendInput, {Enter Up}
    PreciseSleep(20)
    SendInput, {Enter Down}
    PreciseSleep(20)
    SendInput, {Enter Up}
    PreciseSleep(20)
    SendInput, {Enter Down}
    PreciseSleep(20)
    SendInput, {Enter Up}
    PreciseSleep(20)

}
