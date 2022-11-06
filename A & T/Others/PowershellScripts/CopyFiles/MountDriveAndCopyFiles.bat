:: Purpose:
:: To mount remote path as local drive and copy files.

SET REMOTEPATH=\\fileshare\Collection\Files\Project
if exist C:\Project del /F /Q C:\Project
if not exist C:\Project md C:\Project
PUSHD %REMOTEPATH%
xcopy  %REMOTEPATH% C:\Project /E
POPD