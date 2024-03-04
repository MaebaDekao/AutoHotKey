;------------------------------------------
;------------- AutoHotKey V2 --------------
;------------- Maeba Dekao   --------------
;------------------------------------------

;---------------- Modifier Key ----------------
g_TapTime := 180

; ---- OneShotModifier of Layer 2 Key
g_SC07B := false
SC07B::{ ;無変換キー
  global g_SC07B
  global g_TapTime
  g_SC07B := true
  time1 := A_TickCount
  KeyWait "SC07B"
  time2 := A_TickCount - time1
  if(time2<g_TapTime && g_SC07B){
    Send "{Backspace}"
  }else if GetKeyState("Alt"){
    Send "{Alt Up}"
  }
}

; ---- OneShotModifier of Layer 3 Key
;~ g_SC064 := false
;~ *SC064::{ ;F13(物理的に変換キー, KeyWait "SC079"が原因不明で受け付けられない)
  ;~ global g_SC064
  ;~ global g_TapTime
  ;~ g_SC064 := true
  ;~ time1 := A_TickCount
  ;~ KeyWait "SC064"
  ;~ time2 := A_TickCount - time1
  ;~ if(time2<g_TapTime && g_SC064){
    ;~ Send "{Blind}{Enter}"
  ;~ }
;~ }

; ---- OneShotModifier of Layer 4 Key
g_SC039 := false
*SC039::
SC039::{ ; Space
  global g_SC07B
  if GetKeyState("SC07B","p"){
    IME_SET(0)
    g_SC07B := false
  }else{
    global g_SC039
    g_SC039 := true
    KeyWait "SC039"
    if g_SC039 {
      Send "{Blind}{Space}"
      g_SC039 := false
    }
  }
}

;----------------------------------------------

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
    IME_SET(0)
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
    Send "{Blind}{SC027}"
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

*SC00F::
SC00F::{ ; Tab
  global g_SC07B
  if GetKeyState("SC07B","p"){
    g_SC07B := false
    userInput := InputBox("hogePrompt", "hogeTitle", "w100 h100")
    if userInput.Result = "Cancel"
      Goto EndUltraLink
    else {
      str_url_base := "https://jira.kmt.kmtg.net:8443/jira/browse/B55-"
      str_url_add := userInput.Value
      str_url_combined := str_url_base . str_url_add
      Run str_url_combined
    }
  EndUltraLink:
  }else if GetKeyState("SC039","p"){
    global g_SC039
    Send "{Blind}~"
    g_SC039 := false
  }else{
    Send "{Blind}{SC00F}"
  }
}
*SC010::
SC010::{ ; q
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{!}"
  }else{
    Send "{Blind}{SC010}"
  }
}
*SC011::
SC011::{ ; w
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    IME_SET(0)
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
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{$}"
  }else{
    Send "{Blind}{SC013}"
  }
}
*SC014::
SC014::{ ; t
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{%}"
  }else{
    Send "{Blind}{SC014}"
  }
}
*SC015::
SC015::{ ; y
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{^}"
  }else{
    Send "{Blind}{SC015}"
  }
}
*SC016::
SC016::{ ; u
  global g_SC07B
  if GetKeyState("SC07B","p"){
    if GetKeyState("Ctrl", "p"){ ; 3 key at same time
      Send "^{PgUp}" ; invert for tab manipulate
    }else{
      Send "{Blind}{PgDn}"
    }
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{&}"
  }else{
    Send "{Blind}{SC016}"
  }
}
*SC017::
SC017::{ ; i
  global g_SC07B
  if GetKeyState("SC07B","p"){
    if GetKeyState("Ctrl", "p"){ ; 3 key at same time
      Send "^{PgDn}" ; invert for tab manipulate
    }else{
      Send "{Blind}{PgUp}"
    }
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{*}"
  }else{
    Send "{Blind}{SC017}"
  }
}
*SC018::
SC018::{ ; o
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{(}"
  }else{
    Send "{Blind}{SC018}"
  }
}
*SC019::
SC019::{ ; p
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{AppsKey}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{)}"
  }else{
    Send "{Blind}{SC019}"
  }
}
*SC01A::
SC01A::{ ; [
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{;}"
  }else{
    Send "{Blind}{SC01A}"
  }
}
*SC01B::
SC01B::{ ; ]
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{+}"
  }else{
    Send "{Blind}{SC01B}"
  }
}
*SC01E::
SC01E::{ ; a
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{Backspace}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{1}"
  }else{
    Send "{Blind}{SC01E}"
  }
}
*SC01F::
SC01F::{ ; s
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{Delete}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{2}"
  }else{
    Send "{Blind}{SC01F}"
  }
}
!SC020::
SC020::{ ; d
  global g_SC07B
  if GetKeyState("SC07B","p"){
    g_SC07B := false
    if GetKeyState("Alt"){
      if WinActive("ahk_exe mstsc.exe")
        Send "{PgDn}"
      else
        Send "+{Tab}"
    }else{
      if WinActive("ahk_exe mstsc.exe")
        Send "{Alt Down}{PgDn}"
      else
        Send "{Alt Down}+{Tab}"
    }
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{3}"
  }else{
    Send "{Blind}{SC020}"
  }
}
!SC021::
SC021::{ ; f
  global g_SC07B
  if GetKeyState("SC07B","p"){
    g_SC07B := false
    if GetKeystate("Alt"){
      if WinActive("ahk_exe mstsc.exe")
        Send "{PgUp}"
      else
        Send "{Tab Down}{Tab Up}"
    }else{
      if WinActive("ahk_exe mstsc.exe")
        Send "{Alt Down}{PgUp}"
      else
        Send "{Alt Down}{Tab Down}{Tab Up}"
    }
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{4}"
  }else{
    Send "{Blind}{SC021}"
  }
}
*SC022::
SC022::{ ; g
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{5}"
  }else{
    Send "{Blind}{SC022}"
  }
}
*SC023::
SC023::{ ; h
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{Left}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{6}"
  }else{
    Send "{Blind}{SC023}"
  }
}
*SC024::
SC024::{ ; j
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{Down}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{7}"
  }else{
    Send "{Blind}{SC024}"
  }
}
*SC025::
SC025::{ ; k
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{Up}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{8}"
  }else{
    Send "{Blind}{SC025}"
  }
}
*SC026::
SC026::{ ; l
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{Right}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{9}"
  }else{
    Send "{Blind}{SC026}"
  }
}
*SC027::
SC027::{ ; - (physical ;)
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{0}"
  }else{
    if IME_GET() and GetKeyState("SC02A","p"){
      IME_SET(0)
      Send "{Blind}{SC00C}"
      IME_SET(1)
    }else{
      Send "{Blind}{SC00C}" ; -
    }
  }
}
+SC028::
*SC028::
SC028::{ ; '
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{:}"
  }else if GetKeyState("SC136","p"){
    Send "{SC029}"
  }else{
    if IME_GET(){ ;IME ONでも半角"を打つ
        IME_SET(0)
        Send "{Blind}{SC028}"
        IME_SET(1)
    }else{
        Send "{Blind}{SC028}"
    }
  }
}
*SC02B::
SC02B::{ ; \
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{=}"
  }else{
    Send "{Blind}{SC02B}"
  }
}
*SC02C::
SC02C::{ ; z
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F1}"
  }else{
    Send "{Blind}{SC02C}"
  }
}
*SC02D::
SC02D::{ ; x
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}^+{Tab}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F2}"
  }else{
    Send "{Blind}{SC02D}"
  }
}
*SC02E::
SC02E::{ ; c
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}^{Tab}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F3}"
  }else{
    Send "{Blind}{SC02E}"
  }
}
*SC02F::
SC02F::{ ; v
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F4}"
  }else{
    Send "{Blind}{SC02F}"
  }
}
*SC030::
SC030::{ ; b
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F5}"
  }else{
    Send "{Blind}{SC030}"
  }
}
*SC031::
SC031::{ ; n
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{Home}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F6}"
  }else{
    Send "{Blind}{SC031}"
  }
}
*SC032::
SC032::{ ; m
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}^{Left}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F7}"
  }else{
    Send "{Blind}{SC032}"
  }
}
*SC033::
SC033::{ ; ,
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}^{Right}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F8}"
  }else{
    Send "{Blind}{SC033}"
  }
}
*SC034::
SC034::{ ; .
  global g_SC07B
  if GetKeyState("SC07B","p"){
    Send "{Blind}{End}"
    g_SC07B := false
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F9}"
  }else{
    Send "{Blind}{SC034}"
  }
}
*SC035::
SC035::{ ; /
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{F10}"
  }else{
    Send "{Blind}{SC035}"
  }
}

; End of File