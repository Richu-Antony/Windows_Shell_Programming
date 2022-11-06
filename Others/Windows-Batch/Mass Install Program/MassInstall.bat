@echo off
REM	Authored by:
REM	James Krolik

REM 	The purpose of this is to mass install against a list of devices.
REM	The steps include copy the file to the device and then use 'PSEXEC' to remotely execute the silent install.
REM	Please review my example of copying a file to all machines for more input.

REM	I'd recommend looking up the concept of a "For Loop" in programming to get the overall idea, but essentially the first line does the following:
REM	Creates a For loop that tokenizes (reads every line) of the file and assigns it to the variable %%x in the file B219.txt and then performs everything between the ( and ).

REM	Note:  You will need to download PSEXEC and place PSEXEC.exe into the same directory this is being run from.
REM	Note:  You will need to download an MSI for deployment and place it in the same directory this is being run from.

REM	PSEXEC can be downloaded from here as of 10/14/2020:	https://docs.microsoft.com/en-us/sysinternals/downloads/psexec

for /F "tokens=*" %%x in (B219.txt) do (
echo ===================================
echo ===  %%x =====
echo ===================================

	REM	Copy the file from the current directory to C:\Windows\Temp on the other device.

		echo f | xcopy /y /h "%~dp0Umbrella.msi" "\\%%%x\c$\windows\temp\"

	REM	Use PSEXEC to initiate the remote install.  For more information, please look up MSI silent install on Google or review the following website:	
	REM	https://docs.microsoft.com/en-us/windows/win32/msi/standard-installer-command-line-options
	REM	You can even pass parameters to the install.

		psexec \\%%x msiexec.exe /i c:\windows\temp\Umbrella.msi /qn /log:"C:\windows\temp\mylogfile.txt"

	REM 	Example with parameters - psexec \\%%x msiexec.exe /i c:\windows\temp\Umbrella.msi /qn ORG_ID=2510000 ORG_FINGERPRINT=9d8e8e505db8ec6d3f3943c0000 USER_ID=10660000


)

pause

