@echo off
@REM mode con cols=50 lines=50
title Shortcut Virus Remover v2 V6.11.22

:: Green
color A 

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Shortcut Virus Remover v2 V6.11.22                       
echo  Author      : Richu Antony                                 
echo  Description : Shortcut Virus Remover v2        
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.


echo This program can remove shortcut viruses from any infected drive. Wanna give it a try?
echo Just enter the drive letter of the infected drive:

:START
    set/p "d="
    if EXIST %d%:\ goto DO
    if NOT EXIST %d%:\ goto DONOT

:DO
    echo If you have more files, it may take more time. So, please, be patient...

attrib -s -h -a /s /d %d%:\*.*
del /a /q /s %d%:\*.lnk


echo ___________________________________________________________________________________________
echo Done!!!!
ECHO Shortcut viruses have successfully been removed from drive %d%
ECHO All files have successfully been recovered from drive %d%
echo ___________________________________________________________________________________________
ECHO Modifying the code would NOT make you a programmer. So, Respect the programmers
echo ___________________________________________________________________________________________
ECHO Press Enter key to close the window...
set/p "k="
goto END

:DONOT
    echo Not such drive letter found
    echo Please check your drive letter and try again:
    goto START

:END