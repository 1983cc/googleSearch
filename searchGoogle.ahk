;#NoTrayIcon
#SingleInstance,force
DetectHiddenWindows, on

Gui,searchGoogle:New,,searchGoogleWindow
Gui, Add, Edit, x2 y9 w470 h50 +Center -Wrap vGoogleSearchEdit gEditbox
;-wrap 不起作用,?
GuiControl,-Wrap,GoogleSearchEdit
; Generated using SmartGUI Creator for SciTE
Gui, Show, w479 h45
; 设置字体
Gui, Font, s18, Verdana
GuiControl,Font,GoogleSearchEdit
Gui, -Caption

Editbox:
	GuiControlGet,searchString,,GoogleSearchEdit
	GetKeyState,state,Enter,P
	if state = D	
	{		
		;MsgBox,%a%
		StringLen,Length,searchString
		;MsgBox,%Length%
		;每次有回车符所以不为空
		if (Length > 1)
		{
			Run,"www.google.com/search?q=%searchString%"
			Guicontrol,,GoogleSearchEdit, ;下次查询前清空Edit
		}
		;清空以便下次使用
		Guicontrol,,GoogleSearchEdit, ;下次查询前清空Edit
		WinHide,searchGoogle
		return
	}
	
#s::	
	WinRestore,searchGoogleWindow

return

;#IfWinActive,searchGoogle
;{
;	Enter::	
	;GuiControlGet,searchString,,Edit1
	;在这里这么写不会取得变量的值	
;	Run,"www.google.com/search?q=%searchString%"
;	Gui,Hide
;	return
;}

;#IfWinNotActive,searchGoogle
;{
;	#IfWinNotExist,searchGoogle
;	{
		;CapsLock::
		;WinWait,searchGoogle
		;WinShow,searchGoogle
		;WinShow
		;b = WinActive("searchGoogle")
		;MsgBox,hello
		;Gui,Restore
		;WinMaximize,searchGoogle
;		return
;	}
;}

