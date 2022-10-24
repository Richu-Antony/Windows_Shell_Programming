REM :: For Windows 11 only, due to taskbar related changes.
REM :: This will make the taskbar show always.
REM :: This is the DEFAULT setting and it will also close file explorer.exe.

powershell -command "&{$p= 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3' ;$v=(Get-ItemProperty -Path $p).Settings;$v[8]=2;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -f -ProcessName explorer}"
