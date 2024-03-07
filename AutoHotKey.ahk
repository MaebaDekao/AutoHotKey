;------------------------------------------
;------------- AutoHotKey V2 --------------
;------------- Maeba Dekao   --------------
;------------------------------------------

#Include IMEv2.ahk
#Include String.ahk
#Include Layer.ahk
#Include EachApp.ahk
#UseHook
InstallKeybdHook
Persistent

;---------------- debug. ------------------

;---------------- Hotkey ------------------
SC070::IME_SET(1) ;日本語入力モード

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