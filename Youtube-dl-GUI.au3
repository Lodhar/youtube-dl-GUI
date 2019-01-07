#Region INCLUDE
#include <AVIConstants.au3>
#include <GuiConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>
#EndRegion INCLUDE



#Region GUI
$whGUI = GUICreate("Youtube-dl GUI", 800, 400)
GUISetIcon(@SystemDir & "\mspaint.exe", 0)
#EndRegion GUI


#Region INPUT URL
;GUICtrlCreateInput("Sample Input Box", 235, 255, 130, 20)
$idLabel1 = GUICtrlCreateLabel("Video Source URL:", 10, 10, 200, 20)
Local $sData = ClipGet()
$idInput1 = GUICtrlCreateInput($sData, 20, 25, 500, 20)
;~ GUICtrlSetTip(-1, '#Region INPUT')
;~ GUICtrlSetTip($idInput1, '#Region INPUT')
#EndRegion INPUT URL


#Region OUTPUT FOLDER
;GUICtrlCreateInput("Sample Input Box", 235, 255, 130, 20)
$idLabel2 = GUICtrlCreateLabel("Output Folder:", 10, 60, 200, 20)
;~ Local $sData = ClipGet()
;~ GUICtrlCreateButton("Select Folder" , 20, 80, 100, 20)
;~ $idInput2 = GUICtrlCreateInput("", 120, 80, 600, 20)
;~ %HOMEPATH%
$idInput2 = GUICtrlCreateInput(@HomeDrive & @HomePath & "\Downloads\", 20, 80, 600, 20)
;~ $GUI_EVENT_PRIMARYDOWN
GUICtrlSetOnEvent(-1, "SelectFolder")
;~ Local $sFileSelectFolder = FileSelectFolder("", "")
GUICtrlSetTip($idInput2, 'Select your destination folder')

#EndRegion OUTPUT FOLDER


#Region Resolution
;~ $idGroup1 = GUICtrlCreateGroup("Video Resolution", 10, 100, 400)
$idLabel3 = GUICtrlCreateLabel("Video Resolution:", 10, 120, 400)
$left = 20
$width = 50
$top = 135
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
;~ GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group
#EndRegion Resolution

#Region CHECKBOX
$idLabel4 = GUICtrlCreateLabel("Options:", 10, 165, 400)
$left = 20
$width = 150
$top = 180
$line = 25
;default options
$idCheck01 = GUICtrlCreateCheckbox("--hls-prefer-native", $left + ($width*0), $top, $width, 20)
GUICtrlSetTip(-1, '--hls-prefer-native Use the native HLS downloader instead of ffmpeg')
$idCheck02 = GUICtrlCreateCheckbox("--embed-thumbnail ", $left + ($width*1), $top, $width, 20)
GUICtrlSetTip(-1, '--embed-thumbnail  Embed thumbnail in the audio as cover art.')
$idCheck06 = GUICtrlCreateCheckbox("--skip-download", $left + ($width*0), $top + $line, $width, 20)
GUICtrlSetTip(-1, '--skip-download')
$idCheck04 = GUICtrlCreateCheckbox("&pause", $left + ($width*3), $top, $width, 20)
GUICtrlSetTip(-1, 'Pause the command line interface after execution')
$idCheck05 = GUICtrlCreateCheckbox("--output '%(title)s.%(ext)s'", $left + ($width*4), $top, $width, 20)
GUICtrlSetTip(-1, '--output Output filename template, see the "OUTPUT TEMPLATE" for all the info')
;video
$idCheck03 = GUICtrlCreateCheckbox("--add-metadata ", $left + ($width*2), $top, $width, 20)
GUICtrlSetTip(-1, '--add-metadata Write metadata to the video file')
$idCheck07 = GUICtrlCreateCheckbox("--sleep-interval 5", $left + ($width*1), $top + $line, $width, 20)
GUICtrlSetTip(-1, '--sleep-interval SECONDS         Number of seconds to sleep before each download when used alone or a lower bound of a range for randomized sleep')
$idCheck08 = GUICtrlCreateCheckbox("MP4/M4A", $left + ($width*2), $top + $line, $width, 20)
GUICtrlSetTip(-1, '-f, --format FORMAT              Video format code, see the "FORMAT SELECTION" for all the info')
$idCheck09 = GUICtrlCreateCheckbox("-r 1.0M", $left + ($width*3), $top + $line, $width, 20)
GUICtrlSetTip(-1, '')
$idCheck10 = GUICtrlCreateCheckbox("--abort-on-unavailable-fragment", $left + ($width*4), $top + $line, $width, 20)
GUICtrlSetTip(-1, '')
;audio
$idCheck11 = GUICtrlCreateCheckbox("--extract-audio ", $left + ($width*0), $top + $line*2, $width, 20)
$idCheck12 = GUICtrlCreateCheckbox("--audio-format mp3", $left + ($width*1), $top + $line*2, $width, 20)
$idCheck13 = GUICtrlCreateCheckbox("--audio-quality 1 ", $left + ($width*2), $top + $line*2, $width, 20)
$idCheck14 = GUICtrlCreateCheckbox("", $left + ($width*3), $top + $line*2, $width, 20)
$idCheck15 = GUICtrlCreateCheckbox("Checkbox", $left + ($width*4), $top + $line*2, $width, 20)
;verbositi
$idCheck16 = GUICtrlCreateCheckbox("", $left + ($width*0), $top + $line*3, $width, 20)
$idCheck17 = GUICtrlCreateCheckbox("", $left + ($width*1), $top + $line*3, $width, 20)
$idCheck18 = GUICtrlCreateCheckbox("--batch-file FILE", $left + ($width*2), $top + $line*3, $width, 20)
$idCheck19 = GUICtrlCreateCheckbox("--download-archive FILE", $left + ($width*3), $top + $line*3, $width, 20)
$idCheck20 = GUICtrlCreateCheckbox("Checkbox", $left + ($width*4), $top + $line*3, $width, 20)
;workaround
$idCheck21 = GUICtrlCreateCheckbox("--geo-bypass", $left + ($width*0), $top + $line*4, $width, 20)
$idCheck22 = GUICtrlCreateCheckbox("", $left + ($width*1), $top + $line*4, $width, 20)
$idCheck23 = GUICtrlCreateCheckbox("--simulate ", $left + ($width*2), $top + $line*4, $width, 20)
$idCheck24 = GUICtrlCreateCheckbox("", $left + ($width*3), $top + $line*4, $width, 20)
$idCheck25 = GUICtrlCreateCheckbox("--all-subs --convert-subs srt", $left + ($width*4), $top + $line*4, $width, 20)

;GUICtrlSetTip(-1, '#Region CHECKBOX')
;GUICtrlSetState(-1, $GUI_CHECKED)
#EndRegion CHECKBOX


#Region BUTTON
$left = 20
$width = 100
$top = 320
$idButton1 = GUICtrlCreateButton("Select Folder" ,    $left + ($width*0), $top, $width, 30)
$idButton2 = GUICtrlCreateButton("Video Config(Mp4)", $left + ($width*1), $top, $width, 30)
$idButton3 = GUICtrlCreateButton("Audio Config(Mp3)", $left + ($width*2), $top, $width, 30)
$idButton4 = GUICtrlCreateButton("Execute"  , $left + ($width*4), $top, $width, 30)
$idButton5 = GUICtrlCreateButton("Update Youtube-dl"  , $left + ($width*6), $top, $width, 30)


;GUICtrlSetTip(-1, '#Region BUTTON')
#EndRegion BUTTON

#Region Command Line
$idInput3 = GUICtrlCreateInput("", 20, 360, 750, 20)
#EndRegion ommand Line

#Region GUI MESSAGE LOOP
GUISetState(@SW_SHOW)
While 1
   Switch GUIGetMsg()
	  Case $GUI_EVENT_CLOSE
		 ExitLoop
	  Case $idButton1
		 $folder = SelectFolder()
;~ 		 _GUICtrlEdit_SetText($idInput2,$folder)
		  GUICtrlSetData($idInput2,$folder)

   EndSwitch
WEnd

GUIDelete()
#EndRegion GUI MESSAGE LOOP



Func SelectFolder()
    ; Crée une constante locale avec le message à afficher dans FileSelectFolder.
    Local Const $sMessage = "Choisissez un dossier"

    ; Ouvre une boîte de dialogue pour sélectionner un dossier.
    Local $sFileSelectFolder = FileSelectFolder($sMessage, "")
    If @error Then
        ; Affiche le message d'erreur.
        MsgBox($MB_SYSTEMMODAL, "", "Aucun dossier n'a été sélectionné.")
		Return @HomeDrive & @HomePath & "\Downloads\"
    Else
        ; Affiche le dossier sélectionné.
        ConsoleWrite("Vous avez choisi le dossier suivant:" & @CRLF & $sFileSelectFolder)
		Return $sFileSelectFolder
	 EndIf
EndFunc