#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance , Force

;Version    Date        Author          Notes
;    0.1    20-DEC-2018 Hew Reid        Initial

;Script Purpose
; Embed a HTTP/HTTPS link into a HTML file to enable simple downloading (Right-Click 
;"Save As" on link)
FormatTime , aTime , , yyyyMMdd_HHmmss
input_file = html_link.txt				;requires you to make an input file with this name
										;allows you to provide multiple inputs for multiple
										;links
output_file = html_link_%aTime%.html

Loop , Read , %input_file%
{
	Link = <a href="%A_LoopReadLine%">%A_LoopReadLine%</a>
	FileAppend , %Link%`n, %output_file%
}
Run , %output_file%
Return 

/*
	Note: I've had to do this way too many times and usually write the simple HTML file
	each time... Finally decided to make it a little easier if I remember to use this...

*/