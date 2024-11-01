﻿;------------------------------------------
;------------- AutoHotKey V2 --------------
;------------- Maeba Dekao   --------------
;------------------------------------------

#Include IMEv2.ahk
#Include String.ahk
#Include Layer.ahk
#Include UltraLink.ahk
#UseHook
InstallKeybdHook
Persistent

;---------------- debug. ------------------

;---------------- Hotkey ------------------
SC070::F10

;----------- OneShotModifier --------------
Lshift::{
    Send "{Lshift down}"
    time1 := A_TickCount
    KeyWait "LShift"
    time2 := A_TickCount - time1
    if(time2<130){
        IME_SET(0)
    }
    Send "{Lshift up}"
}
Rshift::{
    Send "{Rshift down}"
    time1 := A_TickCount
    KeyWait "RShift"
    time2 := A_TickCount - time1
    if(time2<130){
        IME_SET(1)
    }
    Send "{Rshift up}"
}

;----------- Custom Function --------------

;---------------- Memo --------------------
; ^ Ctrl
; ! Alt
; + Shift
; # Win

; End of File