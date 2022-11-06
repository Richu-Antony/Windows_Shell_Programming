:: Purpose:
:: This script will reset Team Foundation Server credentials on an user's machine.

:: How to run ?
:: Add values to the fields marked inside angular brackets.
:: Double click this file to run it. 

TIMEOUT /T 20

:: Deleting IdentityService
RD /S /Q "%localappdata%\.IdentityService"

:: Deleting TFS Cache
RD /S /Q "%localappdata%\Microsoft\Team Foundation\7.0\Cache"

:: Creating .IdentityService folder
MD "%localappdata%\.IdentityService"

:: Creating TFS Cache folder
MD "%localappdata%\Microsoft\Team Foundation\7.0\Cache"

:: Login to TFS code
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\tf.exe" 
workspaces /login:<Domain\User>,<Password> /collection:http://<ServerName>/tfs/<CollectionName>

Pause