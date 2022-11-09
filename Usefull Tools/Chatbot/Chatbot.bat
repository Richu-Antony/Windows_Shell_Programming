@echo off

if exist Log\fcolor.txt (
set /p fcolor=<Log\fcolor.txt
) else (
set fcolor=4
)
color 0%fcolor%

if not exist Log\introoff.txt call Files\Intro.bat

:menu
    if exist Log\fcolor.txt (
    set /p fcolor=<Log\fcolor.txt
    ) else (
    set fcolor=4
    )
    color 0%fcolor%

    if not exist Log\introoff.txt (
    	set introstatus=on
    ) else (
    	set introstatus=off
    )

    title Chatbot [:menu]
    cls
    mode con: cols=54 lines=21
    echo __[0000]_____________________________________
    echo ^<127.0.0.1^>................................
    echo 			  [no new messages]
    echo  1) Start new chat
    echo  2) Teach Hex
    echo  3) Refresh
    echo  4) Customize
    echo  5) Extras
    echo  6) Credits
    echo  7) Exit
    echo.
    echo  i) Intro [%introstatus%]
    echo.
    echo.
    echo Status: offline
    echo %time%
    echo %date%
    echo.
    echo .................................^<no-server^>
    echo __[xxxx]_____________________________________
    choice /c 1234567i /n

    If %errorlevel% equ 8 goto toggleintro
    If %errorlevel% equ 7 goto exit
    If %errorlevel% equ 6 goto credits
    If %errorlevel% equ 5 goto extras
    If %errorlevel% equ 4 goto customize
    If %errorlevel% equ 3 goto menu
    If %errorlevel% equ 2 goto teachbot
    If %errorlevel% equ 1 goto chat
    If %errorlevel% equ 0 goto menu
    goto menu

:credits
    cls
    title Chatbot V6.11.22 

    echo.
    echo Copyright(C) 2022 By Rica Inc.
    echo #
    echo  Tool        : Chatbot V6.11.22                                 
    echo  Author      : Richu Antony                                 
    echo  Description : Chatbot                 
    echo #
    echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
    echo.
    echo.
    timeout -1 >nul
    goto menu

:customize
    cls
    title Chatbot [:customize]
    echo __[0004]_____________________________________
    echo ^<options^>..................................
    echo 			   [customization]
    echo    1) Blue
    echo    2) Green
    echo    3) Aqua
    echo    4) Red
    echo    5) Purple
    echo    6) Yellow
    echo    7) White
    echo    8) Gray
    echo    9) Light Blue
    echo    a) Light Green
    echo    b) Light Aqua
    echo    c) Light Red
    echo    d) Light Purple
    echo    e) Light Yellow
    echo    f) Bright White
    echo .................................^<foreground^>
    echo __[xxxx]_____________________________________
    choice /c 123456789abcdef /n

    If %errorlevel% equ 15 set fcolor=f
    If %errorlevel% equ 14 set fcolor=e
    If %errorlevel% equ 13 set fcolor=d
    If %errorlevel% equ 12 set fcolor=c
    If %errorlevel% equ 11 set fcolor=b
    If %errorlevel% equ 10 set fcolor=a
    If %errorlevel% equ 9 set fcolor=9
    If %errorlevel% equ 8 set fcolor=8
    If %errorlevel% equ 7 set fcolor=7
    If %errorlevel% equ 6 set fcolor=6
    If %errorlevel% equ 5 set fcolor=5
    If %errorlevel% equ 4 set fcolor=4
    If %errorlevel% equ 3 set fcolor=3
    If %errorlevel% equ 2 set fcolor=2
    If %errorlevel% equ 1 set fcolor=1
    If %errorlevel% equ 0 goto menu
    @echo>Log/fcolor.txt %fcolor%
    goto menu

:extras
    cls
    title Chatbot [:extras]
    echo __[0005]_____________________________________
    echo ^<select^>...................................
    echo 			       [Extras]
    echo    1) ASCII art
    echo    2) Animations
    echo.
    echo    0) Main menu
    echo .................................^<available^>
    echo __[xxxx]_____________________________________
    choice /c 012 /n
    If %errorlevel% equ 3 goto animations
    If %errorlevel% equ 2 goto ascii
    If %errorlevel% equ 1 goto menu
    If %errorlevel% equ 0 goto menu
    goto extras

:animations
    cls
    echo __[0015]_____________________________________
    echo ^<select^>...................................
    echo 			   [Animations]
    echo    1) Matrix effect
    echo    2) (Empty)
    echo    3) (Empty)
    echo    4) (Empty)
    echo    5) (Empty)
    echo    6) (Empty)
    echo    7) (Empty)
    echo    8) (Empty)
    echo    9) (Empty)
    echo    a) (Empty)
    echo    b) (Empty)
    echo    c) (Empty)
    echo    d) (Empty)
    echo.
    echo    0) Back
    echo .................................^<available^>
    echo __[xxxx]_____________________________________
    choice /c 01 /n
    If %errorlevel% equ 2 start call Extras/Matrix.bat
    If %errorlevel% equ 1 goto Extras
    If %errorlevel% equ 0 goto animations
    goto Animations

:ascii
    cls
    echo __[0025]_____________________________________
    echo ^<select^>...................................
    echo 			   [Ascii art]
    echo    1) Anonymous
    echo    2) Silhouette
    echo    3) (Empty)
    echo    4) (Empty)
    echo    5) (Empty)
    echo    6) (Empty)
    echo    7) (Empty)
    echo    8) (Empty)
    echo    9) (Empty)
    echo    a) (Empty)
    echo    b) (Empty)
    echo    c) (Empty)
    echo    d) (Empty)
    echo.
    echo    0) Back
    echo .................................^<available^>
    echo __[xxxx]_____________________________________
    choice /c 012 /n
    If %errorlevel% equ 3 start call Extras\Silhouette.bat
    If %errorlevel% equ 2 start call Extras\Anonymous.bat
    If %errorlevel% equ 1 goto extras
    If %errorlevel% equ 0 goto ascii
    goto ascii

:construct
    echo    1) (Empty)
    echo    2) (Empty)
    echo    3) (Empty)
    echo    4) (Empty)
    echo    5) (Empty)
    echo    6) (Empty)
    echo    7) (Empty)
    echo    8) (Empty)
    echo    9) (Empty)
    echo    a) (Empty)
    echo    b) (Empty)
    echo    c) (Empty)
    echo    d) (Empty)
    echo    e) (Empty)
    echo    f) (Empty)
    goto menu

:viewchat
    title Chat history
    cls
    @echo Currently no chats are available...
    timeout 2 >nul
    goto menu

:toggleintro
    title Chatbot[:0002]
    cls
    echo __[0002]_____________________________________
    echo ^<127.0.0.1^>................................
    echo.
    if not exist Log\introoff.txt (
    	echo>log\introoff.txt Intro off
    	@echo           Intro will be SKIPPED next time.
    ) else (
    	del Log\introoff.txt
    	@echo           Intro will be PLAYED next time.
    )
    echo -----------------------------------------------------
    echo.
    echo.
    echo                       XXXXXXX
    echo                      X       X
    echo                     X         X
    echo                    X           X
    echo                     X         X
    echo                      X       X
    echo                       XXXXXXX
    echo.
    echo.
    echo -----------------------------------------------------
    echo Press any key to return to menu...
    echo .................................^<no-server^>
    echo __[xxxx]_____________________________________
    timeout 10 >nul
    goto menu

:chat
    start call chat\chat.bat
    goto menu

:teachbot
    start call chat\teachbot.bat
    goto menu

:exit
    exit

::Verified and Tested