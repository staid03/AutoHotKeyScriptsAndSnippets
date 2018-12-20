#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance , force

;Version    Date        Author          Notes
;    0.1    20-DEC-2018 Hew Reid        Initial

;Script Purpose
; To go through c drive and d drive looking for all folders with "Alteryx" in the name

FormatTime , aTime ,, yyyyMMdd_HHmmss
OutFile = Alteryx_Dir_Listing_%aTime%.txt
Dir1 = d
Dir2 = c

Find_Dirs(Dir1)
Find_Dirs(Dir2)
Run , %OutFile%
MsgBox ,,, Completed! , 1
Return

Find_Dirs(Dir)
{
	Global OutFile
	Loop , Files , %Dir%:\*Alteryx* , D R
	{
		FileAppend , %A_LoopFileFullPath%`n , %OutFile%				
	}
}
Return



