UseJPEGImageDecoder() 
;__________________________________________________________________________________________________________________
;__________________________________________________________________________________________________________________
;__________________________________________________________________________________________________________________
;Hier musst Du die Strings ändern bevr du diese Datei Compilierst.
; GadgetURL$ = Hier muss die URL eingetragen werden von der Seite die im Fenster angezeigt werden soll.
; NewsButton$ = Die angegebene URL öffnet sich im Standart Browser
; ForumButton$ = Die angegebene URL öffnet sich im Standart Browser
Global GadgetURL$ = "http://launcher.mythfight.de/"
Global NewsButton$ = "http://launcher.mythfight.de/"
Global ForumButton$ = "http://www.ceratic-soft.de/forum.asp"
Global GameEXE$ = "Game.exe" ;"Game.exe"
;__________________________________________________________________________________________________________________
;__________________________________________________________________________________________________________________
;__________________________________________________________________________________________________________________

Enumeration
  #Window_0
EndEnumeration

Enumeration
  #Image_1
  #opt_musik
  #Text_1
  #Text_2
  #Text_4
  #opt_vb_ja
  #opt_vb_nein
  #Text_5
  #Text_9
  #opt_effekt
  #Text_11
  #op_schriftarten
  #Text_12
  #opt_font_width
  #Text_13
  #opt_btn_anwenden
  #opt_btn_abbrechen
EndEnumeration

Global FontID1
FontID1 = LoadFont(1, "Adobe Caslon Pro", 10)
Global FontID2
FontID2 = LoadFont(2, "Adobe Caslon Pro", 12)
Global FontID3
FontID3 = LoadFont(3, "@Arial Unicode MS", 12)
Global FontID4
FontID4 = LoadFont(4, "@Arial Unicode MS", 11)
Global FontID5
FontID5 = LoadFont(5, "@Arial Unicode MS", 10)

Global Update
Global Image1
Global Image2
Global Image3
Global Image4
Global Image5
Global Image6
Global Image7
Global Image8
Global Image9
Global Image10
Global Image11

Image1 = CatchImage(1, ?Image1)
Image2 = CatchImage(2, ?Image2)
Image3 = CatchImage(3, ?Image3)
Image4 = CatchImage(4, ?Image4)
Image5 = CatchImage(5, ?Image5)
Image6 = CatchImage(6, ?Image6)
Image7 = CatchImage(7, ?Image7)
Image8 = CatchImage(8, ?Image8)
Image9 = CatchImage(9, ?Image9)
Image10 = CatchImage(10, ?Image10)
Image11 = CatchImage(11, ?Image11)

DataSection
Image1:
  IncludeBinary "Include\msg-bg.bmp"
Image2:
  IncludeBinary "Include\ok.ico"
Image3:
  IncludeBinary "Include\abbrechen.ico"
Image4:
  IncludeBinary "Include\launcher_bg.bmp"
Image5:
  IncludeBinary "Include\launcher_ende.jpg"
Image6:
  IncludeBinary "Include\launcher_news.jpg"
Image7:
  IncludeBinary "Include\launcher_forum.jpg"
Image8:
  IncludeBinary "Include\launcher_optionen.jpg"
Image9:
  IncludeBinary "Include\start-inaktiv.ico"
Image10:
  IncludeBinary "Include\start-aktiv.ico"
Image11:
  IncludeBinary "Include\optionen_head.jpg"
EndDataSection
 
; Declare Open_Option()
; Declare ReadINI()
; Declare EditINI()
; Declare MSG()
; Declare Launcher()

Procedure MSG(Typ,Message$) ;Typ 1 = Okay & Abbrechen Typ 2 = Okay \\\\\/////// Return, 1 Bestätigt, 2 Abbuch
  If Typ
    SkinWin(OpenWindow(0,0,0,501,201,"",#PB_Window_ScreenCentered|#PB_Window_BorderLess),Image1)
    CreateGadgetList(WindowID(0))
    If Typ = 1
      ImageGadget(10,317,25,71,68,Image2)
      ;ImageGadget(11,410,25,68,64,Image3)
    ElseIf Typ = 2
      ImageGadget(10,317,25,71,68,Image2)
    EndIf
    TextGadget(12,20,40,242,84,Message$)
    
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

Procedure$ ReadINI(Befehl$)
  If ReadFile(0,"Options.dll")
    While Eof(0) = 0
      Temp$ = ReadString(0)
      If FindString(Temp$,Befehl$+" =",1)
        Temp$ = RemoveString(Temp$,Befehl$+" = ")
        ProcedureReturn Temp$
      EndIf
    Wend
    CloseFile(0)
  Else
    MSG(1,"Die Datei 'Options.dll' wurde nicht gefunden. Die Optionen Wurden abgeborochen.")

  EndIf
EndProcedure

Procedure EditINI(Befehl$,Eintrag$)
  If ReadFile(0,"Options.dll")
    If CreateFile(1,"Options.dll.bak")
      While Eof(0) = 0
        Temp$ = ReadString(0)
        If FindString(Temp$,Befehl$+" =",1)
          WriteStringN(1,Befehl$+" = "+Eintrag$)
        Else
          WriteStringN(1,Temp$)  
        EndIf
      Wend
      CloseFile(0)
      CloseFile(1)
      DeleteFile("Options.dll")
      RenameFile("Options.dll.bak","Options.dll")
    Else
      MessageRequester("Fehler","Es Kann licht gespeichert werden. Die anwendung wird geschlossen.")

    EndIf
  Else
    MessageRequester("Fehler","Die Datei 'Options.dll' wurde nicht gefunden. Die Optionen Wurden abgeborochen.") ; Meldungs ausgabe

  EndIf
EndProcedure

Procedure Open_Option()
  Debug FileSize("Options.dll")
  If FileSize("Options.dll") > 0
    If OpenWindow(#Window_0, 273, 184, 200, 375, "Myth Fight || Options", #PB_Window_SizeGadget | #PB_Window_TitleBar | #PB_Window_WindowCentered, WindowID(1) )
      If CreateGadgetList(WindowID(#Window_0))
        ImageGadget(#Image_1, 0, 0, 210, 53, Image11)
        TrackBarGadget(#opt_musik, 20, 150, 150, 20, 0, 100)
        TextGadget(#Text_1, 10, 120, 150, 20, "Musik-Lautstärke")
        SetGadgetFont(#Text_1, FontID5)
        TextGadget(#Text_2, 10, 150, 200, 20, "0                                       100")
        SetGadgetFont(#Text_2, FontID5)
        TextGadget(#Text_4, 10, 60, 110, 30, "Vollbild")
        SetGadgetFont(#Text_4, FontID5)
        OptionGadget(#opt_vb_ja, 30, 90, 60, 20, "Ja")
        OptionGadget(#opt_vb_nein, 120, 90, 60, 20, "Nein")
        TextGadget(#Text_5, 10, 180, 150, 20, "Effekt-Lautstärke")
        SetGadgetFont(#Text_5, FontID5)
        TextGadget(#Text_9, 10, 210, 200, 20, "0                                       100")
        SetGadgetFont(#Text_9, FontID5)
        TrackBarGadget(#opt_effekt, 20, 210, 150, 20, 0, 100)
        TextGadget(#Text_11, 10, 240, 110, 20, "Schriftart")
        SetGadgetFont(#Text_11, FontID5)
        ComboBoxGadget(#op_schriftarten, 10, 260, 180, 20,#PB_ComboBox_Editable)
        TextGadget(#Text_12, 10, 290, 140, 20, "Schriftgröße")
        SetGadgetFont(#Text_12, FontID5)
        StringGadget(#opt_font_width, 10, 310, 50, 20, "")
        TextGadget(#Text_13, 80, 310, 90, 20, "Pixel")
        SetGadgetFont(#Text_13, FontID5)
        ButtonGadget(#opt_btn_anwenden, 10, 340, 90, 30, "Anwenden")
        ButtonGadget(#opt_btn_abbrechen, 100, 340, 90, 30, "Abbrechen")
        
      EndIf
    EndIf
    AddGadgetItem(#op_schriftarten,-1,"Arial")
    AddGadgetItem(#op_schriftarten,-1,"Verdna")
    AddGadgetItem(#op_schriftarten,-1,"Morpheus")
    AddGadgetItem(#op_schriftarten,-1,"Tahoma")
    SetGadgetText(#op_schriftarten,ReadINI("Font"))
    
    Vollbild$ = ReadINI("Vollbild")
    If Vollbild$ = "nein"
      SetGadgetState(#opt_vb_nein,1)
    Else
      SetGadgetState(#opt_vb_ja,1)
    EndIf
    
    SetGadgetState(#opt_musik,Val(ReadINI("BGM-Lautstärke")))
    SetGadgetState(#opt_effekt,Val(ReadINI("SE-Lautstärke")))
    
    SetGadgetText(#opt_font_width,ReadINI("Fontsize"))
    
    
    Repeat
      O_Event = WaitWindowEvent()
      O_WindowID = EventWindow()
      O_GadgetID = EventGadget()
      O_EventType = EventType()
      
      If O_Event
        If O_GadgetID = #opt_btn_anwenden
;           calldebugger
          If Val(GetGadgetText(#opt_font_width)) < 8 Or Val(GetGadgetText(#opt_font_width)) > 20
            SetGadgetText(#opt_font_width,"10")
            MSG(1,"Die Schriftgröße darf nicht kleiner als '8' und nicht größer als '20' sein.")       
          Else
            EditINI("Font",GetGadgetText(#op_schriftarten))
            If GetGadgetState(#opt_vb_nein) = 1
              EditINI("Vollbild","nein")
            Else
              EditINI("Vollbild","ja")
            EndIf
            EditINI("BGM-Lautstärke",Str(GetGadgetState(#opt_musik)))
            EditINI("SE-Lautstärke",Str(GetGadgetState(#opt_effekt)))
            EditINI("Fontsize",GetGadgetText(#opt_font_width))
            CloseWindow(#Window_0)
            MSG(1,"Die Optionen wurden erfolgreich gespeichert.")
            O_Event = #PB_Event_CloseWindow
          EndIf
        ElseIf O_GadgetID = #opt_btn_abbrechen
          O_Event = #PB_Event_CloseWindow
          CloseWindow(#Window_0)
        EndIf
      EndIf
      
    Until O_Event = #PB_Event_CloseWindow
  Else
    MSG(1,"Die Datei 'Options.dll' wurde nicht gefunden. Die Optionen Wurden abgeborochen.")
  EndIf
EndProcedure

Procedure Updater(dummy)
  xy = FileSize("Options.dll.new")
  Debug xy
  If xy > 0
    RenameFile("Options.dll","Options.dll.old")
    If ReadFile(20,"Options.dll.old") And CreateFile(21,"Options.dll") And ReadFile(22,"Options.dll.new")
      While Eof(20) = 0
        T$ = ReadString(20)
        If FindString(T$,"URL =",1)
          While Eof(22) = 0
            T$ = ReadString(22)
            If FindString(T$,"URL =",1)
              WriteStringN(21,T$)
            EndIf
          Wend
        Else
          WriteStringN(21,T$)
        EndIf
      Wend
      CloseFile(20):CloseFile(21):CloseFile(22)
      DeleteFile("Options.dll.old"):DeleteFile("Options.dll.new")
    EndIf
  EndIf
;_____________________________________________________________________________________________________________________________________________________

    URL$ = ReadINI("URL")
    If URL$
      SetGadgetText(27, "Update überprüfung")
      Delay(500)
      NewList Updates.s()
      ReadFile(20,"patch.dat")
      While Eof(20) = 0
        AddElement(Updates())
        Updates() = ReadString(20)
      Wend
      CloseFile(20)
      URLDownloadToFile_(0, URL$+"patch.dat","patch.dat.new", 0, 0)
      Delay(20)
      ReadFile(20,"patch.dat.new")
      While Eof(20) = 0
        Delay(100)
        T$ = ReadString(20)
        ForEach Updates()
          If Updates() = T$
            ab = 1
            Break
          EndIf
        Next
  ;_______________________________________________________________________________________________________________________________________________________
        If ab <> 1
          SetGadgetText(27, "Updates werden heruntergeladen.")
          Delay(200)
          If URLDownloadToFile_(0, URL$+T$,T$, 0, 0) = 0
            AddElement(Updates())
            Updates() = T$
            SetGadgetText(27, "Installieren der Updates")
            Delay(200)
            If FindString(T$,"install",1)
              SetGadgetText(27, "Dieses Update installiert eine Neue Version.")
              RunProgram(T$,"","")
              ProcedureReturn -1
            Else
              RunProgram(T$,"","",#PB_Program_Wait)
              DeleteFile(T$)
            EndIf
          Else
            MSG(2,"Es ist ein Fehler beim herunterladen des Updates aufgetreten. Der Updater Wird Beendet.");:UpdaterEnde()
          EndIf
          Debug URL$ + T$
        EndIf
      Wend
      SetGadgetText(27, "Updates werden Beendet.")
      CloseFile(20)
      DeleteFile("patch.dat.new")
      DeleteFile("patch.dat")
      CreateFile(20,"patch.dat")
      ForEach Updates()
        WriteStringN(20,Updates())
      Next
      CloseFile(20)
      MSG(2,"Es wurden keine Updates gefunden.");:UpdaterEnde()
      SetGadgetText(27, "das Spiel kann nun gestartet werden.")
      SetGadgetState(24,Image10)
      Update = 1
    EndIf
EndProcedure

ProcedureDLL Launcher()
  If InitNetwork()
    Netzwerk = 1
  Else
    MSG(2,"Der Computer ist nucht mit dem Internet verbunden, es kann nicht auf Updates geprüft werden.")
  EndIf

  If SkinWin(OpenWindow(1,0,0,630,511,"Launcher",#PB_Window_ScreenCentered|#PB_Window_BorderLess),Image4)
    CreateGadgetList(WindowID(1))
    ImageGadget(20,581,0,45,20,Image5)
    ;ImageGadget(21,45,27,29,36,Image6)
    ImageGadget(22,140,27,33,36,Image7)
    ImageGadget(23,536,27,48,36,Image8)
    ImageGadget(24,466,472,126,33,image9)
    WebGadget(25,4,63,622,403,GadgetURL$,#PB_Web_Mozilla)
    ProgressBarGadget(26,118,468,230,16,0,100,#PB_ProgressBar_Smooth)
    TextGadget(27,4,488,462,18,"",#PB_Text_Center)
    SetGadgetColor(27,#PB_Gadget_BackColor,RGB($E2,$E2,$E2))
  EndIf
   CreateThread(@Updater(),24)

      Repeat
        Event = WaitWindowEvent()
        WindowID = EventWindow()
        GadgetID = EventGadget()
        EventType = EventType()
        
        If Event = #PB_Event_Gadget
          If GadgetID = 20 And Update = 1
            Debug "Beenden"
            Quit = 1
            ProcedureReturn -1
          ElseIf GadgetID = 21 And Update = 1
            Debug "News"
            RunProgram(NewsButton$,"","")
          ElseIf GadgetID = 22 And Update = 1
            Debug "Forum"
             RunProgram(ForumButton$,"","")
          ElseIf GadgetID = 23 And Update = 1
            Debug "Optionen"
            Open_Option()
          ElseIf GadgetID = 24 And Update = 1
            Debug "Game Start"
            RunProgram(GameEXE$,"","")
            ProcedureReturn -1
          EndIf
        EndIf
      Until Quit = 1
EndProcedure
; IDE Options = PureBasic 4.41 (Windows - x86)
; ExecutableFormat = Shared Dll
; CursorPosition = 363
; FirstLine = 316
; Folding = 6-
; EnableThread
; EnableXP
; Executable = Neuer Ordner\laun.dll