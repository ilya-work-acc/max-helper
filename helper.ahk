#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#InstallMouseHook ; for memory optimisation if using mouse for hotkeys
 
; #Include Ilyas'FuncLibrary.ahk
SendMode Event
#SingleInstance Force
SetStoreCapsLockMode Off ; Prevent additional capslock sending.
SetDefaultMouseSpeed, 0 ; If several scripts run and sendmode drops down to event, set defaoult speed to move mouse instantaneously, like in sendinput mode.
CoordMode, Mouse, Window
CoordMode, Pixel, Window
SetTitleMatchMode, 2 ;A window's title can contain WinTitle anywhere inside it to be a match.
#MaxHotkeysPerInterval 400
; #InstallKeybdHook
; #InstallMouseHook ; Force hooks for A_PriorKey to recognise all keys and mouse clicks.
 
SetMouseDelay, -1 ; Here I provide some performance enchancement, but be careful if modify me code consider changinx that lines too.
SetControlDelay, -1
SetWinDelay, -1
 
; Menu, Tray, Icon, % A_ScriptDir . "\icons\stripes90deg.png", , 1 ; Tray status default picture load.
Menu, Tray, Tip, % RegExReplace(A_ScriptName, ".ahk")
 
#Include Gdip_All.ahk
#Include Gdip_ImageSearch.ahk

OnExit, EXIT_LABEL
 
~q::
Keywait, q, U
;SetTimer, checkMessage, 500
While 1
{
    Random, sleepRandom, 220, 600
 
    ; Max starting line.
   
    sendControlAndSleep("q")
    sendControlAndSleep("w")
    sendControlAndSleep("w")
    sendControlAndSleep("q")
    sendControlAndSleep("e")
    sendControlAndSleep("r")
    sendControlAndSleep("s")
    sendControlAndSleep("q")
    sendControlAndSleep("d")
    sendControlAndSleep("f")
    sendControlAndSleep("5")
    sendControlAndSleep("v")
    ; Max ending line.
    ;checkMessage()

    Sleep, % sleepRandom
    Random, , sleepRandom
}
Return

F6::
repairEquipment()
Return

repairEquipment()
{
    sendControlAndSleep("w")
    sendControlAndSleep("w")

    Sleep, 2500

    sendControlAndSleep("{F8}", 200)
    
    

    gdipToken := Gdip_Startup()
    bmpHaystack := Gdip_BitmapFromScreen()

    bmpNeedle := Gdip_CreateBitmapFromFile("1.png")
    RET := Gdip_ImageSearch(bmpHaystack,bmpNeedle,LIST,0,0,0,0,0,0xFFFFFF,1,0)
    Gdip_DisposeImage(bmpHaystack)
    Gdip_DisposeImage(bmpNeedle)
    Gdip_Shutdown(gdipToken)
    MsgBox, % "Returned: " RET "`n`n" LIST



}

sendControlAndSleep(key, sleepTime := 0)
{
    WinGet, processNameOfWindow, ProcessName, LOST ARK
    If (processNameOfWindow = "LOSTARK.exe")
    {
        ControlClick, , LOST ARK, , R, 1, % "NA y" . (A_ScreenHeight / 2) . " x" . (A_ScreenWidth / 2 + 150)
        ControlSend, , %key%, LOST ARK
        If (!sleepTime)
        {
            Random, sleepRandom, 220, 500
            Sleep, % sleepRandom
            Random, , sleepRandom
        }
        Else
            Sleep, % sleepTime
    }
}
 
sendAndSleep(key)
{
    SendInput %key%
    Random, sleepRandom, 200, 400
    Sleep, % sleepRandom
    Random, , sleepRandom
}

sendAll(key)
{
    SendPlay {%key%} down
    Random, sleepRandom, 50, 120
    Sleep, % sleepRandom
    Random, , sleepRandom
    SendPlay {%key%} up
    Random, sleepRandom, 50, 120
    Sleep, % sleepRandom
    Random, , sleepRandom
    SendInput {%key%} down
    Random, sleepRandom, 50, 120
    Sleep, % sleepRandom
    Random, , sleepRandom
    SendInput {%key%} up
    Random, sleepRandom, 50, 120
    Sleep, % sleepRandom
    Random, , sleepRandom
    SendEvent {%key%} down
    Random, sleepRandom, 50, 120
    Sleep, % sleepRandom
    Random, , sleepRandom
    SendEvent {%key%} up
    Random, sleepRandom, 50, 120
    Sleep, % sleepRandom
    Random, , sleepRandom
}
 
activateDummy:
    WinActivate, Visual Studio
    MsgBox, OK
Return

F9::
Gdip_Shutdown(gdipToken)
Reload

EXIT_LABEL: ; be really sure the script will shutdown GDIP
Gdip_Shutdown(gdipToken)
ExitApp
Return