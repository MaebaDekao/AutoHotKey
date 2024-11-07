;-------- Each App --------
; Explorer
#HotIf WinActive("ahk_exe explorer.exe")
^PgUp::^+Tab
^PgDn::^Tab
#HotIf

; Line
#HotIf WinActive("ahk_exe LINE.exe")
  ^Enter::!Enter
#HotIf

; Power Point
#HotIf WinActive("ahk_exe POWERPNT.EXE")
  ~Lshift & WheelUp::ComObjActive("PowerPoint.Application").ActiveWindow.SmallScroll(0,0,0,3)
  ~Lshift & WheelDown::ComObjActive("PowerPoint.Application").ActiveWindow.SmallScroll(0,0,3,0)
#HotIf

; Excel
#HotIf WinActive("ahk_exe EXCEL.EXE")
  +WheelDown::WheelRight
  +WheelUp::WheelLeft
#HotIf

; OneNote
; #HotIf WinActive("ahk_exe ONENOTE.EXE")
;   *SC02F::{
;     if GetKeyState("Lshift","p"){
;       Send "{AppsKey}{T}{Enter}"
;     }else{
;       Send "{Blind}{^SC02F}"
;     }
;   }
; #HotIf

; Acrobat
#HotIf WinActive("ahk_exe Acrobat.exe")
  ^LButton::^0
#HotIf
; End of File