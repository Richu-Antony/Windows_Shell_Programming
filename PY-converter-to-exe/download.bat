@echo off
cls
title download converter
SET /P choice= Voulez vous telecharger un batch converter (y/n) ?
IF '%choice%'=='y' (goto :download)
IF '%choice%'=='n' (goto :end)
IF '%choice%'=='' (goto :end)

:download
@echo off
Title download batch converter
Color 0A & Mode con cols=65 lines=3
Set "URL=https://sourceforge.net/projects/batch-compiler/files/latest/download"
Set "File=%userprofile%\Desktop\Batch Compiler"
echo(
echo    Please wait... Downloading the python file is in progress...
Call <img src="images/smilies/icon_biggrin.gif" border="0" alt="" title=":D" class="inlineimg" />ownload "%url%" "%File%"
If exist "%File%" Start "" "%File%"
end

:end
ECHO AU revoir
end
