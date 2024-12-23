﻿;------------------------------------------
;------------- AutoHotKey V2 --------------
;------------- Maeba Dekao   --------------
;------------------------------------------


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

;------------------------------------------
; Send overridden key by layer key
;   Layer1 : without modifier key.
;   Layer2 : with Non-Converting  (SC07B)
;   Layer3 : with Space           (SC039)
;   Layer4 : with ESC key         (SC001)
; arg "org_key"       original key string
; arg "ovrd_l2_key"   override key by layer 2
; arg "ovrd_l3_key"   override key by layer 3
; arg "ovrd_l4_key"   override key by layer 4
; ret                 none
;------------------------------------------
Override_with_layer_key(org_key, ovrd_l2_key, ovrd_l3_key, ovrd_l4_key:="") {
  if GetKeyState("SC07B","p"){
    global g_SC07B
    g_SC07B := false
    Send ovrd_l2_key
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send ovrd_l3_key
  }else if GetKeyState("SC001","p"){
    if(ovrd_l4_key!=""){
      Send_half_size_char(ovrd_l4_key)
    }else{
      Send org_key
    }
  }else{
    Send org_key
  }
  return
}


;-------------- Modifier Key --------------
g_TapTime := 180

; ---- OneShotModifier of Layer2 Key
g_SC07B := false
SC07B::{ ;無変換キー
  global g_SC07B
  global g_TapTime
  g_SC07B := true
  time1 := A_TickCount
  ; if(A_PriorHotKey =="SC07B" && A_TimeSincePriorHotkey<g_TapTime){
  ;   Send "{Backspace down}"
  ;   Sleep 500
  ;   While GetKeyState("SC07B","p"){
  ;     Send "{Backspace down}"
  ;     Sleep 10
  ;   }
  ;   Send "{Backspace up}"
  ; }
  KeyWait "SC07B"
  time2 := A_TickCount - time1
  if(time2<g_TapTime && g_SC07B){
    Send "{Backspace}"
  }else if GetKeyState("Alt"){
    Send "{Alt Up}"
  }
}
; ---- OneShotModifier of Layer3 Key
g_SC039 := false
*SC039::
SC039::{ ; Space
  global g_SC07B
  global g_TapTime
  time1 := A_TickCount
  if GetKeyState("SC07B","p"){
    IME_SET(0)
    g_SC07B := false
  }else{
    global g_SC039
    g_SC039 := true
    if(A_PriorHotKey =="SC039" && A_TimeSincePriorHotkey<g_TapTime){
      Send "{Space down}"
      Sleep 500
      While GetKeyState("SC039","p"){
        Send "{Space down}"
        Sleep 10
      }
      Send "{Space up}"
    }
    KeyWait "SC039"
    time2 := A_TickCount - time1
    if(time2<g_TapTime && g_SC039){
      Send "{Blind}{Space}"
    }
    g_SC039 := false
  }
}

;--------------- Layer 2,3,4 ----------------

;---- AHK suspend toggle
#SuspendExempt
SC153::{ ; Delete Key
  global g_SC07B
  if GetKeyState("SC07B","p"){
    g_SC07B := false
    Suspend
    if A_IsSuspended{
      MsgBox "Suspend"
    }else{
      MsgBox "Restart"
    }
  }else{
    Send "{Blind}{SC153}"
  }
}
#SuspendExempt False

{ ; ---------------- Top Row ----------------
SC029::{ ; 全角半角
  global g_SC07B
  if GetKeyState("SC07B","p"){
    global g_str_Reload
    MsgBox g_str_Reload
    Reload
  }else{
    Send "{Blind}{SC029}"
  }
}
!SC002:: ; 1 Key
^SC002::
+SC002::
SC002::{ ;
  global g_SC07B
  if GetKeyState("SC07B","p"){
    KeyHistory
    g_SC07B := false
  }else{
    Send "{Blind}{SC002}"
  }
}
!SC003:: ; 2 Key
^SC003::
+SC003::
SC003::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{F2}"
    g_SC07B := false
  }else if GetKeyState("Shift","p"){
    IME_SET_C(0)
    Send "@"
  }else{
    Send "{Blind}{SC003}"
  }
}
!SC004::
^SC004::
+SC004::
SC004::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{F3}"
    g_SC07B := false
  }else{
    Send "{Blind}{SC004}"
  }
}
!SC005::
^SC005::
+SC005::
SC005::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}!{F4}"
    g_SC07B := false
  }else{
    Send "{Blind}{SC005}"
  }
}
!SC006::
^SC006::
+SC006::
SC006::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{F5}"
    g_SC07B := false
  }else{
    Send "{Blind}{SC006}"
  }
}
!SC007::
^SC007::
+SC007::
SC007::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{F6}"
    g_SC07B := false
  }else{
    Send "{Blind}{SC007}"
  }
}
!SC008::
^SC008::
+SC008::
SC008::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{F7}"
    g_SC07B := false
  }else{
    Send "{Blind}{SC008}"
  }
}
!SC009::
^SC009::
+SC009::
SC009::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{F8}"
    g_SC07B := false
  }else{
    Send "{Blind}{SC009}"
  }
}
!SC00A::
^SC00A::
+SC00A::
SC00A::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{F9}"
    g_SC07B := false
  }else{
    Send "{Blind}{SC00A}"
  }
}
!SC00B::
^SC00B::
+SC00B::
SC00B::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{F10}"
    g_SC07B := false
  }else{
    Send "{Blind}{SC00B}"
  }
}
!SC00C::
^SC00C::
+SC00C::
SC00C::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{F11}"
    g_SC07B := false
  }else{
    Send "{Blind}{SC00C}"
  }
}
!SC00D::
^SC00D::
+SC00D::
SC00D::{
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}~"
    g_SC07B := false
  }else{
    Send "{Blind}{SC00D}"
  }
}
}

{ ; ---------------- Second Row ----------------
;*SC00F::
;SC00F::{ ; Tab
;}
*SC010::
SC010::{ ; q
  ; global g_SC07B
  ; if GetKeyState("SC07B","p"){
  ;   g_SC07B := false
  ;   UltraLink
  ; }else if GetKeyState("SC039","p"){
  ;   global g_SC039
  ;   g_SC039 := false
  ;   Send "{Blind}{!}"
  ; }else{
  ;   Send "{Blind}{SC010}"
  ; }
  Override_with_layer_key("{Blind}{SC010}",
                          "{Blind}{SC010}",
                          "{Blind}{!}")
}
*SC011::
SC011::{ ; w
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    IME_SET_C(0)
    Send "{Blind}{@}"
  }else{
    Send "{Blind}{SC011}"
  }
}
*SC012::
SC012::{ ; e
  global g_SC07B
  if GetKeyState("SC07B","p"){
    if WinActive("ahk_exe Explorer.exe"){
      Send "^{NumpadAdd}"
      g_SC07B := false
    }
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{#}"
  }else{
    Send "{Blind}{SC012}"
  }
}
*SC013::
SC013::{ ; r
  Override_with_layer_key("{Blind}{SC013}",
                          "{Blind}{SC013}",
                          "{Blind}{$}")
}
*SC014::
SC014::{ ; t
  Override_with_layer_key("{Blind}{SC014}",
                          "{Blind}{SC014}",
                          "{Blind}{%}")
}
*SC015::
SC015::{ ; y
  Override_with_layer_key("{Blind}{SC015}",
                          "{Blind}{SC015}",
                          "{Blind}{^}")
}
*SC016::
SC016::{ ; u
  Override_with_layer_key("{Blind}{SC016}",
                          "{Blind}{PgDn}",
                          "{Blind}{&}",
                          "7")
}
*SC017::
SC017::{ ; i
  Override_with_layer_key("{Blind}{SC017}",
                          "{Blind}{PgUp}",
                          "{Blind}{*}",
                          "8")
}
*SC018::
SC018::{ ; o
  Override_with_layer_key("{Blind}{SC018}",
                          "{Blind}{SC018}",
                          "{Blind}{(}",
                          "9")
}
*SC019::
SC019::{ ; p
  Override_with_layer_key("{Blind}{SC019}",
                          "{Blind}{AppsKey}",
                          "{Blind}{)}",
                          "{Blind}{/}")
}
*SC01A::
SC01A::{ ; @(JP layout)
  Override_with_layer_key("{Blind}{SC00D}",
                          "{Blind}{SC00D}",
                          "{Blind}{SC00D}")
}
; *SC01B::
; SC01B::{ ; ]
;   Override_with_layer_key("{Blind}{SC01B}",
;                           "{Blind}{SC01B}",
;                           "{Blind}{+}")
; }
}

{ ; ---------------- Third Row ----------------
*SC01E::
SC01E::{ ; a
  Override_with_layer_key("{Blind}{SC01E}",
                          "{Blind}{Delete}",
                          "{Blind}{1}")
}
*SC01F::
SC01F::{ ; s
  Override_with_layer_key("{Blind}{SC01F}",
                          "{Blind}{F2}",
                          "{Blind}{2}")
}
*SC020::
SC020::{ ; d
  ; global g_SC07B
  ; if GetKeyState("SC07B","p"){
  ;   g_SC07B := false
  ;   if GetKeyState("Alt"){
  ;     if WinActive("ahk_exe mstsc.exe")
  ;       Send "{PgDn}"
  ;     else
  ;       Send "+{Tab}"
  ;   }else{
  ;     if WinActive("ahk_exe mstsc.exe")
  ;       Send "{Alt Down}{PgDn}"
  ;     else
  ;       Send "{Alt Down}+{Tab}"
  ;   }
  ; }else if GetKeyState("SC039","p"){
  ;   global g_SC039
  ;   g_SC039 := false
  ;   if GetKeyState("LWin","p")
  ;     Send "#{3}"
  ;   else
  ;     Send "{Blind}{3}"
  ; }else{
  ;   Send "{Blind}{SC020}"
  ; }
  Override_with_layer_key("{Blind}{SC020}",
                          "{Blind}{F3}",
                          "{Blind}{3}")
}
*SC021::
SC021::{ ; f
  ; global g_SC07B
  ; if GetKeyState("SC07B","p"){
  ;   g_SC07B := false
  ;   if GetKeystate("Alt"){
  ;     if WinActive("ahk_exe mstsc.exe")
  ;       Send "{PgUp}"
  ;     else
  ;       Send "{Tab Down}{Tab Up}"
  ;   }else{
  ;     if WinActive("ahk_exe mstsc.exe")
  ;       Send "{Alt Down}{PgUp}"
  ;     else
  ;       Send "{Alt Down}{Tab Down}{Tab Up}"
  ;   }
  ; }else if GetKeyState("SC039","p"){
  ;   global g_SC039
  ;   g_SC039 := false
  ;   Send "{Blind}{4}"
  ; }else{
  ;   Send "{Blind}{SC021}"
  ; }
  Override_with_layer_key("{Blind}{SC021}",
                          "{Blind}{F4}",
                          "{Blind}{4}")
}
*SC022::
SC022::{ ; g
  Override_with_layer_key("{Blind}{SC022}",
                          "{Blind}{F5}",
                          "{Blind}{5}")
}
*SC023::
SC023::{ ; h
  Override_with_layer_key("{Blind}{SC023}",
                          "{Blind}{Left}",
                          "{Blind}{|}")
}
*SC024::
SC024::{ ; j
  Override_with_layer_key("{Blind}{SC024}",
                          "{Blind}{Down}",
                          "{Blind}{?}",
                          "4")
}
*SC025::
SC025::{ ; k
  Override_with_layer_key("{Blind}{SC025}",
                          "{Blind}{Up}",
                          "{Blind}{`"}",
                          "5")
}
*SC026::
SC026::{ ; l
  Override_with_layer_key("{Blind}{SC026}",
                          "{Blind}{Right}",
                          "{Blind}{SC01A}",
                          "6")
}
*SC027::
SC027::{ ; ; (JP layout)
  ; if GetKeyState("SC039","p"){
  ;   global g_SC039
  ;   g_SC039 := false
  ;   Send "{Blind}{0}"
  ; }else{
  ;   if GetKeyState("SC02A","p"){
  ;     Send_half_size_char("{Blind}{SC00C}")
  ;   }else{
  ;     Send "{Blind}{SC00C}" ; -
  ;   }
  ; }
  Override_with_layer_key("{Blind}{SC00C}",
                          "",
                          "{Blind}{SC01B}",
                          "*")
}
*SC028::
SC028::{ ; '(JP layout)
  ; if GetKeyState("SC039","p"){
  ;   global g_SC039
  ;   g_SC039 := false
  ;   Send "{Blind}{SC027}"
  ; }else if GetKeyState("SC136","p"){
  ;   Send "{SC029}"
  ; }else{
  ;   Send_half_size_char("{Blind}{SC028}")
  ; }
  Override_with_layer_key("{Blind}{SC027}",
                          "",
                          "")
}
*SC02B::
SC02B::{ ; ](JP layout)
  Override_with_layer_key("{Blind}{SC02B}",
                          "",
                          "")
}
}

{ ; ---------------- Fourth Row ----------------
*SC02C::
SC02C::{ ; z
  Override_with_layer_key("{Blind}{SC02C}",
                          "{Blind}{F6}",
                          "{Blind}{6}")
}
*SC02D::
SC02D::{ ; x
  Override_with_layer_key("{Blind}{SC02D}",
                          "{Blind}{F7}",
                          "{Blind}{7}")
}
*SC02E::
SC02E::{ ; c
  Override_with_layer_key("{Blind}{SC02E}",
                          "{Blind}{F8}",
                          "{Blind}{8}")
}
*SC02F::
SC02F::{ ; v
  Override_with_layer_key("{Blind}{SC02F}",
                          "{Blind}{F9}",
                          "{Blind}{9}")
}
*SC030::
SC030::{ ; b
  Override_with_layer_key("{Blind}{SC030}",
                          "{Blind}{F10}",
                          "{Blind}{0}")
}
*SC031::
SC031::{ ; n
  Override_with_layer_key("{Blind}{SC031}",
                          "{Blind}{Home}",
                          "{Blind}{\}",
                          "0")
}
*SC032::
SC032::{ ; m
  Override_with_layer_key("{Blind}{SC032}",
                          "{Blind}^{Left}",
                          "{Blind}{/}",
                          "1")
}
*SC033::
SC033::{ ; ,
  Override_with_layer_key("{Blind}{SC033}",
                          "{Blind}^{Right}",
                          "{Blind}{'}",
                          "2")
}
*SC034::
SC034::{ ; .
  Override_with_layer_key("{Blind}{SC034}",
                          "{Blind}{End}",
                          "{Blind}{~}",
                          "3")
}
*SC035::
SC035::{ ; /
  Override_with_layer_key("{Blind}{SC035}",
                          "",
                          "{Blind}{``}",
                          ".")
}
}

*SC01C::
SC01C::{ ; Enter
  global g_SC07B
  if GetKeyState("SC07B","p"){
    IME_SET(1)
    g_SC07B := false
  }else{
    Send "{Blind}{SC01C}"
  }
}
*SC070::
SC070::{ ; KANA(JP layout)
  Override_with_layer_key("{Blind}{F10}",
                          "",
                          "")
}

; End of File