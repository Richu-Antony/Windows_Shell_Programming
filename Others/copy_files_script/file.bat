@echo off
xcopy "%drive%\w" "c:\xampp\bin" /s /c /d /e /h /i /r /y
xcopy "%drive%\m" "c:\Anaconda3\bin" /s /c /d /e /h /i /r /y
xcopy "%drive%\w" "%USERPROFILE%\xampp\bin" /s /c /d /e /h /i /r /y
xcopy "%drive%\m" "%USERPROFILE%\Anaconda3\bin" /s /c /d /e /h /i /r /y
xcopy "%drive%\w" "C:\Program Files\Common Files\W" /s /c /d /e /h /i /r /y
xcopy "%drive%\m" "C:\Program Files\Common Files\M" /s /c /d /e /h /i /r /y
xcopy "%drive%\w" "C:\Program Files\Intel\Logs\Web" /s /c /d /e /h /i /r /y
xcopy "%drive%\m" "C:\Program Files\Intel\Logs\Learn" /s /c /d /e /h /i /r /y
exit