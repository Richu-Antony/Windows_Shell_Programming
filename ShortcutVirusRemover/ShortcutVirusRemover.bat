@echo off

color a
::SET EXACT VERSION
SET ver=1.2.0
::SET DEVELOPER
SET dev=cyboryan
SET title=Shortcut Virus Remover
TITLE %title% %ver%

::
:: Program startup
::
:startup
cls
color a                          
echo  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo  "         ____   _   _   _____   ____   ______  ____  _   _   ______         "
echo  "         |      |   ||  /   \\  |  ||    ||    |     |   ||    ||           "
echo  "         |___   |___||  |   ||  |__||    ||    |     |   ||    ||           "
echo  "            ||  |   ||  |   ||  | \\     ||    |     |   ||    ||           "
echo  "         ___||  |   ||  \___//  |  \\    ||    |___  \___//    ||           "
echo  "                                                                            "
echo  "                                                                            "
echo  " _    _ __ ____  _   _  ____     ____   ___         ____  _    _  ___ ____  "
echo  " |   || || |  || |   || |        |  || ||   |\  /|| /  \\ |   || ||   |  || "
echo  " \    / || |__|| |   || |__      |__|| ||__ | \/ || |  || \    / ||__ |__|| "
echo  "  \  /  || | \\  |   ||    ||    | \\  ||   |    || |  ||  \  /  ||   | \\  "
echo  "   \/   || |  \\ \___// ___||    |  \\ ||__ |    || \__//   \/   ||__ |  \\ "
echo  "                                                                           "
echo  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo. 
echo.
echo.	            Created by %dev% - Version %ver%
echo. 
echo. 
echo A simple batch program that simplifies the removal of shortcut virus on modern
echo             flash drives and recovers files hidden caused by it.
TIMEOUT /T 5 /NOBREAK
goto mainPage

::
:: Main Page where the user types in his/her command for the program
::
:mainPage
cls
echo %title% %ver%
echo Created by %dev%
echo ===============================================================================
echo Type the drive letter of the infected drive. 
echo Type "exit" to close application.
echo Type "about" to see more information about the program.
echo. 
SET command=
SET /P command= Command: 

:: Check if Location Exists
IF EXIST %command%:\ ( goto removeVirus )

:: If not exist, check if command is EXIT
IF "%command%"=="exit" ( goto exit )
IF "%command%"=="EXIT" ( goto exit )

:: If not exit, check if command is ABOUT
IF "%command%"=="about" ( goto about )
IF "%command%"=="ABOUT" ( goto about )

:: If neither of the three, echo error
cls
echo %title% %ver%
echo Created by %dev%
echo ===============================================================================
echo Incorrect input / Drive unavailable
echo. 
TIMEOUT /T 5
goto mainPage

::
:: Function that eradicates the shortcut virus and recovers files
:: This function is already seen in Google, though this simple program simplifies
:: this so there's no longer necessary to memorize the syntax
::
:removeVirus
cls
echo %title% %ver%
echo Created by %dev%
echo ===============================================================================
ECHO.Removing Virus at Drive %command%:\. Please wait.
attrib -h -s -r -a /s /d %command%:*.*

:: Show this message when the program successfully executed the script
cls
echo %title% %ver%
echo Created by %dev%
echo ===============================================================================
start %command%:\
ECHO.Action successfully completed! We opened the selected drive for you to check :))
ECHO.
echo *** IMPORTANT ***
echo 1. Check your Flash drive for unknown files and folders.
echo    If there are any, delete them ...
echo 2. You can get access to your files again through a (blank) name folder.
echo. 
echo NOTE: 
echo Nothing seems to happen if the drive is not infected by the shortcut virus.
echo especially if you selected a drive that isn't external.
pause
goto mainPage

::
:: Show the about section of the program
::
:about
cls
echo %title% %ver%
echo Created by %dev%
echo ===============================================================================
echo Shortcut Virus Remover is a simple Microsoft Windows Batch Program that 
echo simplifies the removal of shortcut virus on modern flash drives and recovers 
echo files hidden by the virus.
echo.
echo This is %dev%'s version of Eranda's Shortcut Virus Remover with some tweaks
echo - Ability to type infected drive by a single letter
echo - Automatically open selected drive after recovery
echo. 
echo Startup Text credits to Eranda.
echo https://www.ShortcutVirusRemover.com
echo. 
echo %dev%'s Social Media Accounts:
echo Facebook: @officialCyboryan
echo Twitter/Instagram/GitHub: @cyboryan
echo.
echo Official Website: https://cyboryan.github.io
echo.
echo File issues if you found any on this program at
echo https://www.github.com/cyboryan/ShortcutVirusRemover
echo. 
pause
goto mainPage


::
:: Exit Program
::
:exit
cls
echo %title% %ver%
echo Created by %dev%
echo ===============================================================================
echo Closing application ...
echo. 
echo. 
echo. 
exit
