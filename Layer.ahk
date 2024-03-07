;------------------------------------------
;------------- AutoHotKey V2 --------------
;------------- Maeba Dekao   --------------
;------------------------------------------


;----------- Custom Function --------------

;------------------------------------------
; Send overridden key by layer key
; arg "org_key"       original key string
; arg "ovrd_l2_key"   override key by layer 2
; arg "ovrd_l4_key"   override key by layer 4
; ret                 none
;------------------------------------------
Override_with_layer_key(org_key, ovrd_l2_key, ovrd_l4_key) {
  if GetKeyState("SC07B","p"){
    global g_SC07B
    g_SC07B := false
    Send ovrd_l2_key
  }else if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send ovrd_l4_key
  }else{
    Send org_key
  }
  return
}


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
  Override_with_layer_key("{Blind}{SC00F}",
                          "{Blind}{SC00F}",
                          "{Blind}~")
}
*SC010::
SC010::{ ; q
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
    g_SC039 := false
    Send "{Blind}{!}"
  }else{
    Send "{Blind}{SC010}"
  }
}
*SC011::
SC011::{ ; w
  Override_with_layer_key("{Blind}{SC011}",
                          "{Blind}{SC011}",
                          "{Blind}{@}")
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
  Override_with_layer_key("{Blind}{SC018}",
                          "{Blind}{SC018}",
                          "{Blind}{(}")
}
*SC019::
SC019::{ ; p
  Override_with_layer_key("{Blind}{SC019}",
                          "{Blind}{AppsKey}",
                          "{Blind}{)}")
}
*SC01A::
SC01A::{ ; [
  Override_with_layer_key("{Blind}{SC01A}",
                          "{Blind}{SC01A}",
                          "{Blind}{;}")
}
*SC01B::
SC01B::{ ; ]
  Override_with_layer_key("{Blind}{SC01B}",
                          "{Blind}{SC01B}",
                          "{Blind}{+}")
}
*SC01E::
SC01E::{ ; a
  Override_with_layer_key("{Blind}{SC01E}",
                          "{Blind}{Backspace}",
                          "{Blind}{1}")
}
*SC01F::
SC01F::{ ; s
  Override_with_layer_key("{Blind}{SC01F}",
                          "{Blind}{Delete}",
                          "{Blind}{2}")
}
*SC020::
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
    if GetKeyState("LWin","p")
      Send "#{3}"
    else
      Send "{3}"
  }else{
    Send "{Blind}{SC020}"
  }
}
*SC021::
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
  Override_with_layer_key("{Blind}{SC022}",
                          "{Blind}{SC022}",
                          "{Blind}{5}")
}
*SC023::
SC023::{ ; h
  Override_with_layer_key("{Blind}{SC023}",
                          "{Blind}{Left}",
                          "{Blind}{6}")
}
*SC024::
SC024::{ ; j
  Override_with_layer_key("{Blind}{SC024}",
                          "{Blind}{Down}",
                          "{Blind}{7}")
}
*SC025::
SC025::{ ; k
  Override_with_layer_key("{Blind}{SC025}",
                          "{Blind}{Up}",
                          "{Blind}{8}")
}
*SC026::
SC026::{ ; l
  Override_with_layer_key("{Blind}{SC026}",
                          "{Blind}{Right}",
                          "{Blind}{9}")
}
*SC027::
SC027::{ ; - (physical ;)
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{0}"
  }else{
    if GetKeyState("SC02A","p"){
      Send_half_size_char("{Blind}{SC00C}")
    }else{
      Send "{Blind}{SC00C}" ; -
    }
  }
}
*SC028::
SC028::{ ; '
  if GetKeyState("SC039","p"){
    global g_SC039
    g_SC039 := false
    Send "{Blind}{:}"
  }else if GetKeyState("SC136","p"){
    Send "{SC029}"
  }else{
    Send_half_size_char("{Blind}{SC028}")
  }
}
*SC02B::
SC02B::{ ; \
  Override_with_layer_key("{Blind}{SC02B}",
                          "{Blind}{SC02B}",
                          "{Blind}{=}")
}
*SC02C::
SC02C::{ ; z
  Override_with_layer_key("{Blind}{SC02C}",
                          "{Blind}{SC02C}",
                          "{Blind}{F1}")
}
*SC02D::
SC02D::{ ; x
  Override_with_layer_key("{Blind}{SC02D}",
                          "{Blind}^+{Tab}",
                          "{Blind}{F2}")
}
*SC02E::
SC02E::{ ; c
  Override_with_layer_key("{Blind}{SC02E}",
                          "{Blind}^{Tab}",
                          "{Blind}{F3}")
}
*SC02F::
SC02F::{ ; v
  Override_with_layer_key("{Blind}{SC02F}",
                          "{Blind}{SC02F}",
                          "{Blind}{F4}")
}
*SC030::
SC030::{ ; b
  Override_with_layer_key("{Blind}{SC030}",
                          "{Blind}{SC030}",
                          "{Blind}{F5}")
}
*SC031::
SC031::{ ; n
  Override_with_layer_key("{Blind}{SC031}",
                          "{Blind}{Home}",
                          "{Blind}{F6}")
}
*SC032::
SC032::{ ; m
  Override_with_layer_key("{Blind}{SC032}",
                          "{Blind}^{Left}",
                          "{Blind}{F7}")
}
*SC033::
SC033::{ ; ,
  Override_with_layer_key("{Blind}{SC033}",
                          "{Blind}^{Right}",
                          "{Blind}{F8}")
}
*SC034::
SC034::{ ; .
  Override_with_layer_key("{Blind}{SC034}",
                          "{Blind}{End}",
                          "{Blind}{F9}")
}
*SC035::
SC035::{ ; /
  Override_with_layer_key("{Blind}{SC035}",
                          "{Blind}{SC035}",
                          "{Blind}{F10}")
}

; End of File