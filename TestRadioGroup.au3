#include <GUIConstantsEx.au3>

Example()

Func Example()
    GUICreate("My GUI group") ; will create a dialog box that when displayed is centered

    #Region Resolution
$idGroup1 = GUICtrlCreateGroup("Video Resolution", 10, 100, 400)
$left = 20
$width = 50
$top = 125
$idRadio1 = GUICtrlCreateRadio("Best", $left, $top, 50)
;~ GUICtrlSetTip($idRadio1, '#Region GROUP WITH RADIO BUTTONS- RADIO1')
GUICtrlSetState($idRadio1, $GUI_CHECKED)
$idRadio2 = GUICtrlCreateRadio("1080p", $left + ($width*1), $top, 50)
$idRadio3 = GUICtrlCreateRadio("720p" , $left + ($width*2), $top, 50)
$idRadio4 = GUICtrlCreateRadio("540p" , $left + ($width*3), $top, 50)
$idRadio5 = GUICtrlCreateRadio("480p" , $left + ($width*4), $top, 50)
$idRadio6 = GUICtrlCreateRadio("360p" , $left + ($width*5), $top, 50)
$idRadio7 = GUICtrlCreateRadio("Worst", $left + ($width*6), $top, 50)
;~ GUICtrlSetTip($idRadio2, '#Region GROUP WITH RADIO BUTTONS- RADIO2')
GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group
#EndRegion Resolution

    GUISetState(@SW_SHOW) ; will display an empty dialog box

    ; Loop until the user exits.
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
        EndSwitch
    WEnd
EndFunc   ;==>Example
