﻿;-------- Each App --------
; Line
#HotIf WinActive("ahk_exe LINE.exe")
  ^Enter::!Enter
#HotIf

; Power Point
#HotIf WinActive("ahk_exe POWERPNT.EXE")
  ~Lshift & WheelUp::ComObjActive("PowerPoint.Application").ActiveWindow.SmallScroll(0,0,0,3)
  ~Lshift & WheelDown::ComObjActive("PowerPoint.Application").ActiveWindow.SmallScroll(0,0,3,0)
#HotIf
; End of File