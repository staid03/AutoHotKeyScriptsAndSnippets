#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance , force

;Version    Date        Author          Notes
;    0.1    29-SEP-2018 Hew Reid        Initial

;Script Purpose
;

;Main
FormatTime , atime ,, yyyyMMdd_HHmmss
IP = 8.8.8.8
outfile = PingTest_%IP%_%atime%.txt

numberEchoRequestsToSend = 100

Loop , 100
{
	FormatTime , btime ,, HH:mm:ss
	FileAppend , `n%btime%, %outfile%
	RunWait , %comspec% /c ping -n %numberEchoRequestsToSend% %IP% >> %outfile% ,, min
}
Return 