;------------------------------------------
;------------- AutoHotKey V2 --------------
;------------- Maeba Dekao   --------------
;------------------------------------------

#Include IMEv2.ahk
#Include EachApp.ahk
#Include UltraLink.ahk
#UseHook
InstallKeybdHook
Persistent

;---------------- debug. ------------------

;---------------- Hotkey ------------------
F13::IME_SET(0) ;fn + LSpaceBar by QMK
F14::IME_SET(1) ;fn + RSpaceBar by QMK
F15::UltraLink ;fn + Q by QMK

;---------------- Mouse -------------------
MButton::RWin
XButton2::PgUp ;thumb UP
XButton1::PgDn ;thumb DOWN

;----------- Custom Function --------------


;---------------- Memo --------------------
; ^ Ctrl
; ! Alt
; + Shift
; # Win

; End of File