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

;---------------- Layer 3 -----------------
; OneShotModifier
SC00F::SC00F ;Tab key

; TENKEY
SC00F & SC032::Send_half_size_char("1") ;m
SC00F & SC033::Send_half_size_char("2") ;,
SC00F & SC034::Send_half_size_char("3") ;.
SC00F & SC024::Send_half_size_char("4") ;j
SC00F & SC025::Send_half_size_char("5") ;k
SC00F & SC026::Send_half_size_char("6") ;l
SC00F & SC016::Send_half_size_char("7") ;u
SC00F & SC017::Send_half_size_char("8") ;i
SC00F & SC018::Send_half_size_char("9") ;o
SC00F & SC031::Send_half_size_char("0") ;n
SC00F & SC035::Send_half_size_char(".") ;/
SC00F & SC027::Send_half_size_char("-") ;- (physical ;)

;------------------ Mouse -----------------
MButton::RWin
XButton2::PgUp ;thumb UP
XButton1::PgDn ;thumb DOWN

;----------- Custom Function --------------

;------------------------------------------
; Set IME, if inputting kana, then enter.
; arg "flag"      0(IME OFF) / 1(IME ON)
; ret             none
;------------------------------------------
IME_SET_C(flag){
	if IME_GetConverting() != 0 {
		Send "{Enter}"
		IME_SET(flag)
	}else{
		IME_SET(flag)
	}
	return
}

;------------------------------------------
; Send char of half size.
; arg "str_key"   keyname ex."a","!"
; ret             none
;------------------------------------------
Send_half_size_char(str_key){
	IME_SetConvMode(0x13)
	Send str_key
	IME_SetConvMode(0x19)
	return
}

;---------------- Memo --------------------
; ^ Ctrl
; ! Alt
; + Shift
; # Win

; End of File