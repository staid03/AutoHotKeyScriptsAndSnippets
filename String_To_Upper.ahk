#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance , force

;Version    Date        Author          Notes
;    0.1    20-DEC-2018 Hew Reid        Initial

;Script Purpose
; To take all text and raise it to Upper Case (using this for SQL)

;Requires the text be put into a text file called "~input.txt" and placed in the same folder
; as the script

;Variables
inputFile = ~input.txt
outputFile = ~output.txt

;Actions
FileDelete , %outputFile%					;Delete previous output file
FileRead , inputText , %inputFile%			;Bring in the text from the input file
StringUpper , UpperString , inputText		;Perform the Upper function over the text
Fileappend , %UpperString% , %outputFile%	;Output the text to the output file
Run , %outputFile%							;Open the output file for copying the text back
Return 


/*
Notes:
	Initially the script was performing a Copy of the text into the Clipboard but
	I was having issues with this functionality and ended up just making a new
	input file which worked fine. I don't use it much anyhow.
*/