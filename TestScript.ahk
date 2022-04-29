;************************************************
; Test script for Gdip_ImageSearch()
; by MasterFocus
; 02/April/2013 00:30h BRT
;************************************************

#NoEnv
;ListLines, Off
SetBatchLines, -1
; Process, Priority,, High

#Include Gdip_All.ahk
#Include Gdip_ImageSearch.ahk

OnExit, EXIT_LABEL

F6::
gdipToken := Gdip_Startup()

bmpHaystack := Gdip_BitmapFromScreen()
; bmpHaystack := Gdip_CreateBitmapFromFile("IMG/T-002-haystack-novo.png")
; pHaystack := Gdip_BitmapFromHwnd(WinExist("(2) YouTube - Chrome"))

bmpNeedle := Gdip_CreateBitmapFromFile("1920x1080/1.png")
RET := Gdip_ImageSearch(bmpHaystack,bmpNeedle,LIST,0,0,0,0,0,0xFFFFFF,1,0)
Gdip_DisposeImage(bmpHaystack)
Gdip_DisposeImage(bmpNeedle)
Gdip_Shutdown(gdipToken)
MsgBox, % "Returned: " RET "`n`n" LIST

;; following loop used for pointing to each instance of
;; the needle when the haystack is the screen
/*
CoordMode, Mouse, Screen
Loop, Parse, LIST, `n
{
    StringSplit, Coord, A_LoopField, `,
    MouseMove, %Coord1%, %Coord2%, 0
    Sleep, 200
}
*/

Return

Esc::
EXIT_LABEL: ; be really sure the script will shutdown GDIP
Gdip_Shutdown(gdipToken)
EXITAPP