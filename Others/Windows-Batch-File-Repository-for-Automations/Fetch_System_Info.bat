@echo off
color 17
Title Fetch System Info
echo Windows Batch File to collect information about system, and files & dirs in current directory
echo useful for debugging issues
echo compare results using diff tool (like kdiff or vimdiff) between machines where issue occurs and does not occur


setlocal

REM Get the current directory name
call :getDirFileName "%CD%"
set SaveFolderName=SaveInfo_%COMPUTERNAME%_%_getDirFileName%
echo INFO: Saving output to files in: "%userprofile%\%SaveFolderName%"
if NOT EXIST "%userprofile%\%SaveFolderName%" mkdir "%userprofile%\%SaveFolderName%"
if NOT EXIST "%userprofile%\%SaveFolderName%" (
  echo ERROR: Could not create directory "%userprofile%\%SaveFolderName%"
  goto :end
)

echo INFO: Getting system info ...
echo System Info for Computer: %COMPUTERNAME%> "%userprofile%\%SaveFolderName%\systeminfo_%COMPUTERNAME%.txt"
echo Current Date and Time: %DATE% %TIME%>> "%userprofile%\%SaveFolderName%\systeminfo_%COMPUTERNAME%.txt"
echo ================================================================================>>"%userprofile%\%SaveFolderName%\systeminfo_%COMPUTERNAME%.txt"
systeminfo >> "%userprofile%\%SaveFolderName%\systeminfo_%COMPUTERNAME%.txt"

echo INFO: Getting current user name and their sid
echo ================================================================================>"%userprofile%\%SaveFolderName%\userinfo_%username%_%COMPUTERNAME%.txt"
echo User: %username%>>"%userprofile%\%SaveFolderName%\userinfo_%username%_%COMPUTERNAME%.txt"
wmic useraccount where name='%username%' get sid >>"%userprofile%\%SaveFolderName%\userinfo_%username%_%COMPUTERNAME%.txt"

echo INFO: Looking up IE Version
echo ================================================================================>"%userprofile%\%SaveFolderName%\IEVersionInfo_%username%_%COMPUTERNAME%.txt"
REM See http://support.microsoft.com/kb/969393
REM Test if svcVersion key is present. If it is present, then it is IE10 or
REM later.  Otherwise rely on Version key
%windir%\system32\reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer" /v svcVersion >NUL 2>NUL
if not ErrorLevel 1 (
  for /f "usebackq tokens=3" %%i in (`%windir%\system32\reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer" /v svcVersion ^| %windir%\system32\findstr /i /l /c:"REG_SZ"`) do set _IEVersion=%%i
) else (
  REM svcVersion KEY NOT Found. Must be IE9 or earlier so use Version Key
  for /f "usebackq tokens=3" %%i in (`%windir%\system32\reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer" /v Version ^| %windir%\system32\findstr /i /l /c:"REG_SZ"`) do set _IEVersion=%%i
)
echo Found IE Version=%_IEVersion%>>"%userprofile%\%SaveFolderName%\IEVersionInfo_%username%_%COMPUTERNAME%.txt"
REM Get IE major version
for /f "tokens=1 Delims=." %%i in ("%_IEVERSION%") do set _IEMajorVersion=%%i
echo IE Major version: %_IEMajorVersion%>>"%userprofile%\%SaveFolderName%\IEVersionInfo_%username%_%COMPUTERNAME%.txt"

echo INFO: Getting current task list ...
echo Task List for User: %USERNAME%> "%userprofile%\%SaveFolderName%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"
echo on Computer: %COMPUTERNAME%>> "%userprofile%\%SaveFolderName%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"
echo Current Date and Time: %DATE% %TIME%>> "%userprofile%\%SaveFolderName%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"
echo ================================================================================>>"%userprofile%\%SaveFolderName%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"
tasklist /v >> "%userprofile%\%SaveFolderName%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"

echo INFO: Getting current environment variable settings ...
echo Environment Variable Listing for User: %USERNAME%> "%userprofile%\%SaveFolderName%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"
echo on Computer: %COMPUTERNAME%>> "%userprofile%\%SaveFolderName%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"
echo Current Date and Time: %DATE% %TIME%>> "%userprofile%\%SaveFolderName%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"
echo ================================================================================>>"%userprofile%\%SaveFolderName%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"
set >> "%userprofile%\%SaveFolderName%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"

echo INFO: Getting Internet Explorer Compat Data
echo Getting Internet Explorer Compatability Data from: "%LOCALAPPDATA%\Microsoft\Internet Explorer\IECompatData\iecompatdata.xml"> "%userprofile%\%SaveFolderName%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"
echo on Computer: %COMPUTERNAME%>> "%userprofile%\%SaveFolderName%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"
echo Current Date and Time: %DATE% %TIME%>> "%userprofile%\%SaveFolderName%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"
echo ================================================================================>>"%userprofile%\%SaveFolderName%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"
copy "%LOCALAPPDATA%\Microsoft\Internet Explorer\IECompatData\iecompatdata.xml" "%userprofile%\%SaveFolderName%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"

choice /C "yn" /M "Do you want to collect info about files in current dir?: "
if ERRORLEVEL 2 goto :getJavaInfo
if ERRORLEVEL 1 goto :filesInCurrentDir
goto :getJavaInfo
:filesInCurrentDir
echo INFO: Getting Recursive Directory Listing for current directory: "%CD%" ...
echo Recurisive Directory Listing for: %CD%>"%userprofile%\%SaveFolderName%\dirlisting_%COMPUTERNAME%.txt"
echo on Computer: %COMPUTERNAME%>>"%userprofile%\%SaveFolderName%\dirlisting_%COMPUTERNAME%.txt"
echo Current Date and Time: %DATE% %TIME%>> "%userprofile%\%SaveFolderName%\dirlisting_%COMPUTERNAME%.txt"
echo ================================================================================>>"%userprofile%\%SaveFolderName%\dirlisting_%COMPUTERNAME%.txt"
echo.>>"%userprofile%\%SaveFolderName%\dirlisting_%COMPUTERNAME%.txt"
dir /q /s /on >> "%userprofile%\%SaveFolderName%\dirlisting_%COMPUTERNAME%.txt"

echo INFO: Getting Permissions Listing for Files and Directories in current directory: "%CD%" ...
echo Permissions Listing for Files and Directories under: %CD%>"%userprofile%\%SaveFolderName%\permissionlisting_%COMPUTERNAME%.txt"
echo on Computer: %COMPUTERNAME%>>"%userprofile%\%SaveFolderName%\permissionlisting_%COMPUTERNAME%.txt"
echo Current Date and Time: %DATE% %TIME%>> "%userprofile%\%SaveFolderName%\permissionlisting_%COMPUTERNAME%.txt"
echo ================================================================================>>"%userprofile%\%SaveFolderName%\permissionlisting_%COMPUTERNAME%.txt"
echo.>>"%userprofile%\%SaveFolderName%\permissionlisting_%COMPUTERNAME%.txt"
icacls . /T /C >> "%userprofile%\%SaveFolderName%\permissionlisting_%COMPUTERNAME%.txt"

call :whereiscommand md5sum
choice /C "yn" /M "Do you want to collect MD5 checksums for files in current dir?: "
if ERRORLEVEL 2 goto :getJavaInfo
if ERRORLEVEL 1 goto :md5sumCurrentDir
goto :getJavaInfo

:md5sumCurrentDir
if EXIST "%_whereiscommand%" (
  echo INFO: Getting MD5 checksums for files under current directory: "%CD%" ...
  echo MD5 checksums for: %CD%>"%userprofile%\%SaveFolderName%\MD5sumslisting_%COMPUTERNAME%.txt"
  echo on Computer: %COMPUTERNAME%>>"%userprofile%\%SaveFolderName%\MD5sumslisting_%COMPUTERNAME%.txt"
  echo Current Date and Time: %DATE% %TIME%>> "%userprofile%\%SaveFolderName%\MD5sumslisting_%COMPUTERNAME%.txt"
  echo ================================================================================>>"%userprofile%\%SaveFolderName%\MD5sumslisting_%COMPUTERNAME%.txt"
  echo.>>"%userprofile%\%SaveFolderName%\MD5sumslisting_%COMPUTERNAME%.txt"
  for /F "usebackq delims=" %%z in (`dir /b /s /a-d /on`) do md5sum "%%z" >> "%userprofile%\%SaveFolderName%\MD5sumslisting_%COMPUTERNAME%.txt"
) else (
  echo WARNING: Skipping MD5 checksums because md5sum command is not in current directory or %%PATH%% environment variable
)

:getJavaInfo
echo INFO: Getting information about Java ...
echo Java Information on Computer: %COMPUTERNAME%> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo Current Date and Time: %DATE% %TIME%>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo ================================================================================>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo Java JDKs installed:>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Development Kit" /s >>  "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo Java JREs installed:>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment" /s >>  "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo Where is java.exe?>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
where java >> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo.>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo Java.exe version information:>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
java -version 2>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo.>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo Java related environment variables (may not be set):>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo   %%JAVA_HOME%%=%JAVA_HOME%>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo   %%CLASSPATH%%=%CLASSPATH%>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo.>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo Folders under "%%PROGRAMFILES%%\Java":>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
dir /b "%PROGRAMFILES%\Java" >> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo.>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
echo Folders under "%%ProgramFiles(x86)%%\Java":>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
dir /b "%ProgramFiles(x86)%\Java" >> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
REM %_whereiscommand% is set to the location of md5sum.exe from before
REM This section is commented out because it takes a long time to run if md5sum.exe exists and I don't always
REM need it.
choice /C "yn" /M "Do you want to collect MD5 checksums for `%%PROGRAMFILES%%\Java`?: "
if ERRORLEVEL 2 goto :end
if ERRORLEVEL 1 goto :md5sumJavaDir
goto :end
:md5sumJavaDir
if EXIST "%_whereiscommand%" (
  echo INFO: Getting MD5 checksums for files under "%%PROGRAMFILES%%\Java" ...
  echo.>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
  echo MD5 checksums for files under "%%PROGRAMFILES%%\Java":>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
  for /F "usebackq delims=" %%z in (`dir /b /s /a-d /on "%PROGRAMFILES%\Java"`) do md5sum "%%z" >> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
  echo INFO: Getting MD5 checksums for files under "%%ProgramFiles(x86)%%\Java" ...
  echo.>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
  echo MD5 checksums for files under "%%ProgramFiles(x86)%%\Java":>> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
  for /F "usebackq delims=" %%z in (`dir /b /s /a-d /on "%PROGRAMFILES(x86)%\Java"`) do md5sum "%%z" >> "%userprofile%\%SaveFolderName%\javainfo_%COMPUTERNAME%.txt"
) else (
  echo WARNING: Skipping MD5 checksums because md5sum command is not in current directory or %%PATH%% environment variable
)

REM SCRIPT FINISHED
goto :end

REM ============================================================================
REM Methods called by script
REM ============================================================================

  REM Method to get the Dir or File Name from first parameter passed to it
  REM Remember to wrap parameter with spaces in double quotes.
  :getDirFileName
    set _getDirFileName=%~n1
    goto :eof

  REM whereiscommand Finds a command in path environment variable
  REM First param is command name to search for
  :whereiscommand
    set _whereiscommand=
    for /F "usebackq delims==" %%z IN (`where %1`) DO call :__whereiscommand %%z
    goto :eof
    REM __whereiscommand is meant to be an Internal command that only sets %_whereiscommand% if it is not set already
    REM This way the first found in `where %1` takes precedence
    :__whereiscommand
      if /I "x%_whereiscommand%" EQU "x" (
        set _whereiscommand=%1
      )
      goto :eof

:end
endlocal