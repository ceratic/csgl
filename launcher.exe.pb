Global Image1
Global Image2
Global Image3

Image1 = CatchImage(1, ?Image1)
Image2 = CatchImage(2, ?Image2)
Image3 = CatchImage(3, ?Image3)

DataSection
Image1:
  IncludeBinary "Include\msg-bg.bmp"
Image2:
  IncludeBinary "Include\ok.ico"
Image3:
  IncludeBinary "Include\abbrechen.ico"
EndDataSection


Procedure MSG(Typ,Message$) ;Typ 1 = Okay & Abbrechen Typ 2 = Okay \\\\\/////// Return, 1 Bestätigt, 2 Abbuch
  If Typ
    SkinWin(OpenWindow(0,0,0,501,201,"",#PB_Window_ScreenCentered|#PB_Window_BorderLess),Image1)
    CreateGadgetList(WindowID(0))
    If Typ = 1
      ImageGadget(10,317,25,71,68,Image2)
      ImageGadget(11,410,25,68,64,Image3)
    ElseIf Typ = 2
      ImageGadget(10,350,25,71,68,Image2)
    EndIf
    TextGadget(12,23,30,248,150,Message$)
    SetGadgetColor(12,#PB_Gadget_BackColor,RGB($74,$B2,$F3))
    
    Repeat
      Event = WaitWindowEvent()
      WindowID = EventWindow()
      GadgetID = EventGadget()
      EventType = EventType()
      
      If Event = #PB_Event_Gadget
        If GadgetID = 10
          CloseWindow(0)
          ProcedureReturn 1
        ElseIf GadgetID = 11
          CloseWindow(0)
          ProcedureReturn 2
        EndIf
      EndIf
    ForEver
  EndIf
EndProcedure

Repeat
  If OpenLibrary(0, "laun.dll")
    dll = CallFunction(0,"Launcher")
  Else
    MSG(1,"Die Datei, 'laun.dll' wurde nicht gefunden. Bitte installieren Sie die Anwendung erneut damit diese Richtig funktionieren kann.")
    End
  EndIf
Until dll = -1
; IDE Options = PureBasic 4.41 (Windows - x86)
; CursorPosition = 52
; Folding = +
; EnableThread
; EnableXP
; UseIcon = I:\Ceratic-Soft\Icons\mf_icon.ico
; Executable = Neuer Ordner\launcher.exe
; IncludeVersionInfo
; VersionField0 = 2,0,0,0
; VersionField1 = 2,0,0,0
; VersionField2 = Ceratic
; VersionField3 = Launcher
; VersionField4 = 2
; VersionField5 = 2
; VersionField7 = launcher
; VersionField8 = launcher.exe
; VersionField9 = Ceratic
; VersionField18 = Programmierung
; VersionField21 = Magix-Soft.de