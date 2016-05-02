# Ceratic-Soft Gamelauncher - [[csgl]] - (obsolete) (discontinued)

Ceratic-Soft Gamelauncher oder auch [[csgl]] abgekürzt ist ein Spiel / Programm Launcher & Patcher welcher eine "versions" datei auf im Stammverzeichnis prüft, diese dann mit einer Online Verison vergleicht und bei abwechungen die fehlenden Patches (.zip files) herunter läd und ggf entpackt.

## Version
2.0.7

## Tech
[PureBasic 4] 


## Ordner & Datenstruktur
Name | Funktion
------------ | -------------
Include | Enthält die Bilder und Icon's, die in die .dll eingebungen werden
Fertig | Das fertige projekt. Die laun.dll in diesem ordner ist nur zu test zecke da und muss ersetzt werden
index.pb | Der Quellcode der bearbeitet werden muss und zur "laun.dll" compiliert werden muss
launcher.exe.pb | Das ist der Quelcode von der "launcher.exe" diese überprüft ob die "laun.dll" vorhanden ist und ruft diese auf

## How to Compile
Öffne die "index.pb" mit dem beiliegenden PureBasic4 Editor und Bearbeite die Zeilen 9, 10, 11, 12 mit deinen entgültigen Daten.
```pb
Global GadgetURL$ = "http://patches.myurl.de/"
Global NewsButton$ = "http://news.myurl.de/"
Global ForumButton$ = "http://www.myurl.de/forum.asp"
Global GameEXE$ = "app.exe" ;"app.exe"
```

Danach geht man auf "Compiler -> Executable erstellen" und speichert das ganze unter dem Namen "lan.dll".

Es werden dann 3 Dateien mit den Namen "laun.dll", "laun.exp" und "laun.lib" im angegebenen verzeichniss gespeichert.
Wichtig ist nur die Datei "laun.dll" die anderen beiden Dateien "laun.exp" und "laun.lib" können gelöscht werden.

## Patch.dat Syntax
Die Syntax der "patch.dat" ist relativ Simpel. Man fügt einfach alle Patches dort mit ihrem dazu gehörigen namen ein, und läd diese hoch.

##### Beispiel
Gehen wir nun davon aus man hat zwei Patches und möchte diesem den anderen geben. Dazu schreiben wir in unsere patch.dat einfach  
```
patch1
patch1hotfix
```
oder ähnliches. Sollte nun ein anderer den Launcher / Patcher starten und hat in seiner Lokalen "patch.dat" nichts stehen, so läd der Patcher aus der oben eingestellten 
```Global GadgetURL$ = "http://patches.myurl.de/"``` url die ein träge patch1.zip und patch1hotfix.zip und entpackt diese ins Stammverzeichnis in welcher die Launcher.exe liegt.

License
---

MIT



<<<<<<< HEAD
   [csgl]:  https://github.com/ceratic/csgl
=======
   [csgl]:  https://github.com/ceratic/csgl/
>>>>>>> origin/master
   [PureBasic 4]: http://www.purebasic.com/german/index.php
   
