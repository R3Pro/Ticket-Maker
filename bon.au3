#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Downloads\Custom-Icon-Design-Flatastic-4-Tickets.ico
#AutoIt3Wrapper_Outfile=Ticket MakerV2.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include "printMGv2.au3"
#include <StaticConstants.au3>
#include <ComboConstants.au3>
#include <WindowsConstants.au3>
#include <Date.au3>
FileInstall("PrintMG.dll","PrintMG.dll",1)
$RegHex = 'HKEY_CURRENT_USER\Software\bonbon\'
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Ticket Maker By Rabi3", 353, 383)
$Label1 = GUICtrlCreateLabel("TeraByte Store", 96, 8, 146, 27)
GUICtrlSetFont(-1, 14, 800, 0, "Tahoma")
$Label2 = GUICtrlCreateLabel("بيع و تصليح الهواتف و الحاسوب و أكسسيسواراتها", 50, 40, 300, 17)
$Label3 = GUICtrlCreateLabel(": الإسم و اللقب", 272, 96, 67, 17, $SS_RIGHT)
$Label4 = GUICtrlCreateLabel(": رقم الهاتف", 280, 128, 58, 17)
$Label5 = GUICtrlCreateLabel(": إسم الهاتف", 280, 160, 60, 17)
$Label6 = GUICtrlCreateLabel(": مشكلة الهاتف", 272, 192, 71, 17)
$Input1 = GUICtrlCreateInput("", 8, 96, 257, 21)
$Input2 = GUICtrlCreateInput("", 8, 128, 257, 21)
$Input3 = GUICtrlCreateInput("", 192, 160, 73, 21)
$Combo2 = GUICtrlCreateCombo("", 72, 160, 113, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Samsung|Condor|lenovo|LG|DOOGEE|HTC|HUAWEI|iPhone|IRIS-SAT|ALCATEL|Nokia|sony|Stream|Wiko|Xiaomi|ZTE")
$Combo3 = GUICtrlCreateCombo("", 8, 192, 257, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "فلاش|قفل شاشة|ريزو|كونكتار|لافيشار|ديجتال|كميرا|ديبلوكاج|حابس")
$Label8 = GUICtrlCreateLabel("027709019", 144, 72, 58, 17)
$Label9 = GUICtrlCreateLabel("تقدير المدة :", 288, 224, 58, 17)
$Label10 = GUICtrlCreateLabel("تقدير السعر", 288, 256, 56, 17)
$Input6 = GUICtrlCreateInput("", 232, 224, 33, 21)
$Combo1 = GUICtrlCreateCombo("", 152, 224, 73, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "ساعة|ساعات|يوم|أيام|أسبوع")
$Input7 = GUICtrlCreateInput("", 192, 256, 73, 21)
$Button1 = GUICtrlCreateButton("طباعة", 8, 320, 339, 57)
$Label7 = GUICtrlCreateLabel("دج", 168, 256, 17, 17)


Dim $Form1_AccelTable[1][2] = [["{Enter}", $Button1]]
GUISetAccelerators($Form1_AccelTable)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			bonbon()


	EndSwitch
WEnd

Func bonbon()
	;If _GUICtrlListView_GetItemCount($F3_ListView1) = 0 Then Return
Global $hp,$font = 'Sakkal Majalla',$sized = 14
Local $mmssgg,$marginx,$marginy
$hp = _PrintDllStart($mmssgg);this must always be called first
if $hp = 0 then
	Return False
endif
_PrintSelectPrinter($hp,"GP-80160N(Cut) Series")
;$newselect = _PrintSetPrinter($hp)
_PrintPageOrientation($hp,1);landscape
_PrintSetDocTitle($hp,"Bon de Livraision No. 01")
_PrintStartPrint($hp)
$pght = _PrintGetpageheight($hp) - _PrintGetYOffset($hp)/2
$pgwd = _PrintGetpageWidth($hp) - _PrintGetXOffset($hp)/2
$axisx = Round($pgwd * 0.8)
$axisy = Round($pght * 0.8)
_PrintSetFont($hp,$font,$sized,0,'bold')
$Title = "TeraByte Store"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
$line = $th
_PrintText($hp,$title,($pgwd/2)-($tw/2),0)
$Title = "بيع و تصليح الهواتف و الحاسوب و أكسسيسواراتها"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,($pgwd/2)-($tw/2),$line)
$line += $th
$User_name =  ""
_PrintSetFont($hp,$font,8,0,'bold')
$Title = "العنوان : الكريمية - دلاس - طريق ليسي"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,20,$line)
$Title = "027709019 : رقم الهاتف"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,$pgwd-$tw-20,$line)
$line += $th

_PrintLine($hp,50,$line,$pgwd-50,$line)
$line += 30

$Title = ": الوقت و التاريخ"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,$pgwd-$tw-20,$line)
RegWrite($RegHex, "OK", "REG_SZ",RegRead($RegHex,"OK")+1)

$Title = " "&_Now()&" "
$date = $Title
$tw2 = _PrintGetTextWidth($hp,$Title)
_PrintText($hp,$Title,$pgwd-$tw-$tw2-20,$line)
$line += $th+30
_PrintSetFont($hp,$font,50,0,'bold')
_PrintText($hp,RegRead($RegHex,"OK"),50,$line-50)
_PrintSetFont($hp,$font,8,0,'bold')
$start = $line
$Title = " : الاسم و اللقب"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,$pgwd-$tw-20,$line)
_PrintText($hp,GUICtrlRead($Input1),$pgwd-20-_PrintGetTextWidth($hp,GUICtrlRead($Input1))-200,$line)
$line += $th

$Title = " :      رقم الهاتف"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,$pgwd-$tw-20,$line)
_PrintText($hp,GUICtrlRead($Input2),$pgwd-20-_PrintGetTextWidth($hp,GUICtrlRead($Input2))-200,$line)
$line += $th

$Title = " :     إسم الهاتف"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,$pgwd-$tw-20,$line)
_PrintText($hp,GUICtrlRead($Input3)&" ",$pgwd-20-_PrintGetTextWidth($hp,GUICtrlRead($Input3))-200,$line)
_PrintText($hp," "&GUICtrlRead($Combo2),$pgwd-20-_PrintGetTextWidth($hp,GUICtrlRead($Input3)&"  "&GUICtrlRead($Combo2))-200,$line)
$line += $th
$Title = " : مشكلة الهاتف"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,$pgwd-$tw-20,$line)
_PrintText($hp,GUICtrlRead($Combo3),$pgwd-20-_PrintGetTextWidth($hp,GUICtrlRead($Combo3))-200,$line)
$line += $th
$Title = " : تقدير مدة التصليح"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,$pgwd-$tw-20,$line)
_PrintText($hp,GUICtrlRead($Input6)&" ",$pgwd-20-_PrintGetTextWidth($hp,GUICtrlRead($Input6))-200,$line)
_PrintText($hp," "&GUICtrlRead($Combo1)&" ",$pgwd-20-_PrintGetTextWidth($hp,GUICtrlRead($Input6)&"   "&GUICtrlRead($Combo1))-200,$line)
$line += $th
$Title = " : تقدير سعر التصليح"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,$pgwd-$tw-20,$line)
_PrintText($hp,GUICtrlRead($Input7)&" ",$pgwd-20-_PrintGetTextWidth($hp,GUICtrlRead($Input7))-200,$line)
_PrintText($hp," دج ",$pgwd-20-_PrintGetTextWidth($hp,GUICtrlRead($Input7)&" دج ")-200,$line)
$line += $th
$Title = "ملاحظة : نحن غير مسؤولين عن الأعطال التي لم يصرح بها -"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$Title,($pgwd/2)-($tw/2),$line+20)
$line += $th
$Title = "نحن غير مسؤولين عن الأجهزة التي تجاوزت مدة 3 اشهر في المحل -"
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,($pgwd/2)-($tw/2),$line+20)
_PrintSetLineWid($hp,2)
_PrintSetLineCol($hp,0)


_PrintEndPrint($hp)
_PrintNewPage($hp);
_PrintPageOrientation($hp,1);landscape
_PrintSetDocTitle($hp,"Bon de Livraision No. 01")
_PrintStartPrint($hp)
$pght = _PrintGetpageheight($hp) - _PrintGetYOffset($hp)/2
$pgwd = _PrintGetpageWidth($hp) - _PrintGetXOffset($hp)/2
$axisx = Round($pgwd * 0.8)
$axisy = Round($pght * 0.8)
_PrintSetLineWid($hp,2)
_PrintSetFont($hp,$font,10,0,'bold')
$Title = @MDAY&"/"&@MON&"/"&@YEAR&" "&@HOUR&":"&@MIN&" | "&GUICtrlRead($Input2)&" | "&GUICtrlRead($Input1)
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
$line = $th
_PrintText($hp,$title,($pgwd/2)-($tw/2),0)
_PrintSetFont($hp,$font,30,0,'bold')
_PrintText($hp,RegRead($RegHex,"OK"),30,20)
_PrintSetFont($hp,$font,12,0,'bold')
$Title = GUICtrlRead($Combo3)
$tw = _PrintGetTextWidth($hp,$Title)
$th = _PrintGetTextHeight($hp,$title)
_PrintText($hp,$title,$pgwd-$tw-20,$line)
_PrintEndPrint($hp)
_printDllClose($hp)
EndFunc