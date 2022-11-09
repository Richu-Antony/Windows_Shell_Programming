@echo off
rem what happens when the user enters no character but presses enter.

title Teachbot
cls
cd Chat 2>nul

if exist ..\Log\fcolor.txt (
set /p fcolor=<..\Log\fcolor.txt
) else (
	set fcolor=4
)
color 0%fcolor%

mode con: cols=70 lines=40

rem <initialization> =============================================================
color 0f
echo                                                    ^<[93m%date%[0m^>[31m
set youcolor=31m
set hexcolor=94

@prompt $g$s
set flag=0
REM echo on
setlocal EnableDelayedExpansion

rem <repeat> =====================================================================
if not exist noreplylog md noreplylog

:chat

rem noreplylog->replylog
set text=code119
set /p text="Text  : [0m"
set reply=code911
set /p reply="[95mReply : [0m"

set text=!text:?=!
set text=!text:'=!
set text=!text:,=!
set text=!text:.=!
set text=!text:"=!
set text=!text:`=!
set text=!text:/=!
set text=!text:\=!
set text=!text::=!
if !text! neq !reply! (
	if not !text!==code119 (
		if not !reply!==code911 (
			echo >nul !reply!>noreplylog\"!text! !random!"
			echo 				  [[94mReport:[0m Reply saved][31m
			) else (
				echo 		[[31mError:[0m Either the text or the reply was empty][31m
				)
	) else (
		echo 		[[31mError:[0m Either the text or the reply was empty][31m
	)
) else (
	echo 		[[31mReport:[0m Not saved since reply was not different][31m
)

goto chat
endlocal







goto exit
--------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------
:exit