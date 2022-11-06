@echo off
REM	Authored by:
REM	James Krolik

REM 	The purpose of this is to take a file and copy it to the Public user's desktop on a list of remote machines.
REM	This is useful in a lab scenario when you need to push something out to multiple machines, such as an executable or something else.
REM	The bigger picture would be to encapsalate this with pushing an installer and then remotely executing the installer.

REM	I'd recommend looking up the concept of a "For Loop" in programming to get the overall idea, but essentially the first line does the following:
REM	Creates a For loop that tokenizes (reads every line) of the file and assigns it to the variable %%x in the file B219.txt and then performs everything between the ( and ).

For /F "tokens=*" %%x in (B219.txt) do (

REM	For visual purposes only.  This displays the machine name
echo ===================================
echo ===  %%x =====
echo ===================================

REM 	The command xcopy... will prompt to ask whether the item being copied is a file or directory and ask to respond with an F or a D to continue.
REM	Piping ( | ) allows us to automatically respond with 'F' to indicate it is a file and not a directory.
REM	The xcopy requires a location the script can access and also remote admin rights to write to the admin share on the end machine (c$)
REM	So we are initializing an xcopy, with yes to overwrite if it exists, and sending it to the directory on the other end.  
REM	All variables start with a % so since we used %%x as the token variable above, we need the third %.
REM	Finally, the variable %~dp0 means current working directory, so the folder the script was run from.  It includes the trailing \.  
REM	=> I wrapped it in quotes in case there is a space in the path.

echo f | xcopy /y /h "%~dp0FileToSend.txt" "\\%%%x\c$\Users\Public\Desktop\"

)

pause

