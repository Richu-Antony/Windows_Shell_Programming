@echo off 
@REM mode con cols=50 lines=50
title Light effect V6.11.22

:VBDynamicBuild
    set TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
    if exist "%tempVBsFile%" DEL /F /Q "%TempVBSFile%"
    echo Set WshShell = Wscript.CreateObject("WScript.shell") >> "%TempVBSFile%"
    ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
    echo WshShell.SendKeys "{F11}" >> "%TempVBSFile%"
    ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
    CSCRIPT //nologo "%TempVBSFile%"

cls

:flash
    ping localhost -n 1 >nul
    cls
    if "%color%" == "0A" (set color=A0) else (set color=0A)
    color %color%
    goto flash

pause > nul

::Verified and Tested