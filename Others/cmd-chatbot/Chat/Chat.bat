@echo off

title Chatlog
cls
cd Chat 2>nul

if exist ..\Log\fcolor.txt (
set /p fcolor=<..\Log\fcolor.txt
) else (
	set fcolor=4
)
color 0%fcolor%

mode con: cols=70 lines=40

if exist ..\Log\iteration.txt ( set /p iteration=<..\Log\iteration.txt
) else (
	set /a iteration=0
)
set /a iteration=%iteration%+1
title Chatlog [Iteration: %iteration%]
echo>..\Log\iteration.txt %iteration%

rem <initialization> =============================================================
color 0f
echo                                                    ^<[93m%date%[0m^>
set youcolor=31m
set hexcolor=94

@prompt $g$s
set flag=0
REM echo on
setlocal EnableDelayedExpansion
rem echo [31m[Hint: Enter '*'][0m
rem <repeat> =====================================================================
:chat

if not exist Replylog md Replylog && copy noreplylog\* replylog >nul
if exist Replylog\temp erase >nul /s /q Replylog\temp && rd >nul Replylog\temp
set yousaid=code911
set /p yousaid="You: "
if !yousaid!==code911 (
	set hexsaid=hi
	goto code911chk
)
if !flag! neq 0 (
	set hexsaid=!hexsaid:?=!
	set hexsaid=!hexsaid:'=!
	set hexsaid=!hexsaid:,=!
	set hexsaid=!hexsaid:.=!
	set hexsaid=!hexsaid:"=!
	set hexsaid=!hexsaid:`=!
	set hexsaid=!hexsaid:/=!
	set hexsaid=!hexsaid:\=!
	set hexsaid=!hexsaid::=!
rem	set hexsaid=!hexsaid:(=!
rem	set hexsaid=!hexsaid:)=!
	if !yousaid! neq !hexsaid! (echo >nul !yousaid!>Replylog\"!hexsaid! %random%")
)
set flag=1
md Replylog\temp
set count=0

	set usaid=!yousaid!
	set usaid=!usaid:?=!
	set usaid=!usaid:'=!
	set usaid=!usaid:,=!
	set usaid=!usaid:.=!
	set usaid=!usaid:"=!
	set usaid=!usaid:`=!
	set usaid=!usaid:/=!
	set usaid=!usaid:\=!
	set usaid=!usaid::=!
rem	set usaid=!usaid:(=!
rem	set usaid=!usaid:)=!

if exist Replylog\"*!usaid!*" (
	copy >nul Replylog\"*!usaid!*" Replylog\temp
	FOR /R %%x in (Replylog\temp\*) do (
		set /A count+=1
	)
	del >nul Replylog\temp\* /q
	type Replylog\"*!usaid!*">replylog\temp\hex-r-temp 2>nul

	set /a linenum=!random!%%!count!
	:: echo count=!count!, linenum=!linenum!
		set skipflag=0
		REM setlocal EnableDelayedExpansion
		for /f "tokens=*" %%i in (Replylog\temp\hex-r-temp) do (
			if !skipflag!==!linenum! (
				set hexsaid=%%i
				set hexsaid=!hexsaid:63=?!
			)
			set /a skipflag+=1
    	)
) else (
	set hexsaid=!yousaid!
	echo [[31mHelp:[0m What is the reply to '[94m!yousaid![0m'?]
	goto chat
	)
:code911chk
echo [%hexcolor%mHex: !hexsaid![0m
goto chat
endlocal







goto exit

To do:

delete two similar files if the the content is same in them.
Learnt: https://stackoverflow.com/questions/2044882/how-to-hide-batch-output
TO hide the file name output in type command: https://stackoverflow.com/questions/36141000/how-to-suppress-messages-from-type-in-batch-script
these characters are not allowed in FAT32 filesystem

--------------------------------------------------------------------------------------------------------------------------------
	REM md Replylog\temp\temprec >nul
	REM type Replylog\temp\*>Replylog\temp\temprec\hex-r-temp >nul
	REM del Replylog\temp\* /q >nul
	REM move Replylog\temp\temprec\hex-r-temp Replylog\temp >nul
	REM rd Replylog\temp\temprec >nul

rem type "%%~nx">>Replylog\temp\hex-rc-temp
rem del Replylog\temp\hex-r-temp /q
rem dir Replylog\"*!yousaid!*" /b >Replylog\temp\hex-r-temp
rem FOR /F "eol=;" %%x in (Replylog\temp\hex-r-temp) DO (set /A count+=1)	
rem set /p hexsaid=<Replylog\"!yousaid!" && set hexsaid=!hexsaid:63=?!
rem if exist Replylog\temp\hex-r-temp (
rem for /f "eol=c tokens=* " %%i in (Replylog\temp\hex-r-temp) do @echo>Replylog\temp\%%i %%i

some special characters are resulting in unnecessary output. check that.
for example if entered '>' or '<' asks you to enter again.

rem set text=%text:<=%

 || set text="Some special characters are not allowed!"

--------------------------------------------------------------------------------------------------------------------------------
:exit