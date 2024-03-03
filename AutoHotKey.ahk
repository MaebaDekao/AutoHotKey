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

;---------------- Hotkey ------------------
;~ SC::Enter ; Convert (Right of Space Key)
SC064::Enter ; F13
SC070::IME_SET(1) ;日本語入力モード

;---------------- Layer 3 -----------------
; OneShotModifier
SC00F::SC00F ;Tab key

; TENKEY
SC00F & SC032::{
	IME_SET(0)
	Send "{Numpad1}"
	} ;m
SC00F & SC033::{
	IME_SET(0)
	Send "{Numpad2}"
	} ;,
SC00F & SC034::{
	IME_SET(0)
	Send "{Numpad3}"
	} ;.
SC00F & SC024::{
	IME_SET(0)
	Send "{Numpad4}"
	} ;j
SC00F & SC025::{
	IME_SET(0)
	Send "{Numpad5}"
	} ;k
SC00F & SC026::{
	IME_SET(0)
	Send "{Numpad6}"
	} ;l
SC00F & SC016::{
	IME_SET(0)
	Send "{Numpad7}"
	} ;u
SC00F & SC017::{
	IME_SET(0)
	Send "{Numpad8}"
	} ;i
SC00F & SC018::{
	IME_SET(0)
	Send "{Numpad9}"
	} ;o
SC00F & SC031::{
	IME_SET(0)
	Send "{Numpad0}"
	} ;n
SC00F & SC035::{
	IME_SET(0)
	Send "{NumpadDot}"
	} ;/

;------------------ Mouse -----------------
MButton::RWin
XButton2::PgUp ;thumb UP
XButton1::PgDn ;thumb DOWN

;---------------- Memo --------------------
; ^ Ctrl
; ! Alt
; + Shift
; # Win

; End of File