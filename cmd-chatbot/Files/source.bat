@echo off
echo %time%
timeout 0 >nul /nobreak
echo %time%
pause
goto exit
echo %time%
for /L %%x in (1,1,25) Do (
	ping -n 1 -w 1 127.0.0.1 1>nul
)
echo %time%
pause

goto exit
________________________________________________________________________
[Choice] https://ss64.com/nt/choice.html
Accept user input to a batch file. Choice allows single key-presses to be captured from the keyboard.

    CHOICE [/c [choiceKeys]] [/N] [/CS] [/t Timeout /d Choice] [/m Text]

/C[:]choiceKeys : One or more keys the user can press. Default is YN.
/n	    : do not display choice keys at end.
/m text	    : Message string to describe the choices available.
/CS             : Make the choiceKeys Case Sensitive.
/d choice       : Default choice made on Timeout.
/T Timeout      : Timeout in Timeout seconds
                     If Timeout is 0 there will be no pause and the
                     default will be selected.

ERRORLEVEL will return the numerical offset of choiceKeys.
Choice.exe is a standard command in Windows 2003 and greater, it was first made available in the Windows XP resource kit.

CHOICE can be used to set a specific %errorlevel%
for example to set the %errorlevel% to 6 :
ECHO 6| CHOICE /C 123456 /N >NUL

Examples:

CHOICE /C CH /M Select [C] CD or [H] Hard drive
IF %ERRORLEVEL% EQU 2 goto sub_hard_drive
IF %ERRORLEVEL% EQU 1 goto sub_cd
________________________________________________________________________

:exit