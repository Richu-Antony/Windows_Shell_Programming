@ECHO OFF

color 02

:welcome
:: Preparing for recording.
TITLE Preparation for ANBU Recording 
ECHO ============================
ECHO Preparation for ANBU Recording
ECHO ============================

ECHO.
ECHO 1. Start Recording
ECHO 2. End Recording
ECHO.
set choice=
set /p choice=Type the number to proceed: %TAB%
if not '%choice%'=='' set choice=%choice:~0,1%

if '%choice%'=='1' goto startRecording
if '%choice%'=='2' goto EndRecording
clear
ECHO ERROR: "%choice%" is not valid, try again...
ECHO.
goto welcome

:startRecording
clear
ECHO ============================
ECHO 1. Recording env is started.
ECHO ============================
:: Open NVIDIA Broadcast inorder to initialize Noise filter in OBS
start  C:\"Program Files"\"NVIDIA Corporation"\"NVIDIA Broadcast"\"NVIDIA Broadcast UI".exe
ECHO "SUCCESS] - NVIDIA Broadcast opened!

@REM :: Open OBS
start  /d "C:\Program Files\obs-studio\bin\64bit" "" obs64.exe
ECHO [SUCCESS] - OBS-Studio opened!

@REM :: Cursor Highlighter. - before that run AutoHotKey
start  /d "C:\Program Files\AutoHotkey" "" AutoHotkey.exe "R:\Course Creations\Tools\Cursor\Cursor Highlighter 2.2.ahk"
ECHO [SUCCESS] - Cursor Highlighter opened!

:: Opening Window display inorder to change Higher Resolution
ECHO "[PROCESS] - Opening Window Display to change Resolution!"
sleep 5
explorer ms-settings:display
ping -n 2 127.0.0.1 > nul

:VBSDynamicBuild
SET TempVBSFile=%tmp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 500                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{TAB 9}{DOWN 2}"                  >>"%TempVBSFile%"
ECHO Wscript.Sleep 500                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "%%{F4}"                           >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

powershell (New-Object -ComObject Wscript.Shell).Popup("""Everything is fine and ready to go.""",0,"""Done! Start your recording now.""",0x40)
goto end

:EndRecording
clear
ECHO ============================
ECHO 2. Recording env is de-activating.
ECHO ============================
echo "Recording is ending"

:: end NVIDIA Broadcast inorder to initialize Noise filter in OBS
cd C:\"Program Files"\"NVIDIA Corporation"\"NVIDIA Broadcast"\
TASKKILL /F /IM "NVIDIA Broadcast UI".exe
ECHO [SUCCESS] - NVIDIA Broadcast closed!

:: end OBS
@REM cd C:\"Program Files"\obs-studio\bin\64bit\
@REM TASKKILL /F /IM obs64.exe
@REM ECHO [SUCCESS] - OBS-Studio closed!

:: Stop Cursor Highlighter.
cd  C:\"Program Files"\AutoHotkey\
TASKKILL /F /IM AutoHotkey.exe >nul


ECHO [SUCCESS] - Cursor Highlighter closed!

:: ending Window display inorder to change Higher Resolution
ECHO [PROCESS] - Opening Window Display to change Resolution!
sleep 5
explorer ms-settings:display
ping -n 2 127.0.0.1 > nul

:VBSDynamicBuild
SET TempVBSFile=%tmp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 500                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{TAB 9}{UP 2}"                      >>"%TempVBSFile%"
ECHO Wscript.Sleep 500                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "%%{F4}"                           >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"


powershell (New-Object -ComObject Wscript.Shell).Popup("""Everything is fine and reverted back to original.""",0,"""Done! Do your work now.""",0x40)
goto end

:end
EXIT






