@echo off
Title converter .py
Color 0A & Mode con cols=65 lines=3
Set "URL=https://www.python.org/ftp/python/3.8.3/python-3.8.3.exe" 
Set "File=%userprofile%\Desktop\python-3.8.3.exe"
echo(
echo    Please wait... Downloading the python file is in progress...
Call <img src="images/smilies/icon_biggrin.gif" border="0" alt="" title=":D" class="inlineimg" />ownload "%url%" "%File%"
If exist "%File%" Start "" "%File%"
pip install pywin32
pip install pyinstaller
cls
:menu
title EXE converter
color 0c
echo Who need to be convert ?
SET /P choice= need to convert : 
IF '%choice%'=='' (goto :next)

:next
cls 
echo veuillez mettre le fichier dans le dossier convert
SET /P name=%choice%
SET /P chemin=cd %CD%\convert
ECHO @echo off >> converter.txt
ECHO cd %CD%\convert >> converter.txt
ECHO pyinstaller --onefile %choice% >> converter.txt
ren *converter.txt *converter.bat
Start converter.bat
pause 
del converter.bat
SET /P Q= Voulez vous un compilateur de batch en .exe (y/n) ?
IF '%Q%'=='y' (goto :yes)
IF '%Q%'=='n' (goto :no)
end

:yes
Start %CD%\convert\download.bat
end

:no
end
