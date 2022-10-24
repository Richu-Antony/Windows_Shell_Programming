::created by: Michael Kwiecien-Fisher (michael@wandoo.ca)
@echo off

::created by: Michael Kwiecien-Fisher (michael@wandoo.ca)

:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
CSCRIPT //nologo "%TempVBSFile%"

color C

echo :VBSDynamicBuild
echo SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
echo IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
echo ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
echo ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
echo ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
echo ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
echo CSCRIPT //nologo "%TempVBSFile%"

echo .
color D

echo This is a program that makes the command line go into fullscreen by simulating F11 echo being clicked.
echo You can also mod it to simulate other keys being pushed.
echo Push any key to exit

::created by: Michael Kwiecien-Fisher (michael@wandoo.ca)


pause>>NUL

