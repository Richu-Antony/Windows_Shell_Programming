echo off

set /a rc=%random%%%4
if %rc% equ 0 color 0a
if %rc% equ 1 color 03
if %rc% equ 2 color 04
if %rc% equ 3 color 0b

Title [Animation: Matrix]
mode con: cols=54 lines=21
mode con: rate=10 delay=1

:matrix
set /a a1=%random%%%2
set /a a2=%random%%%2
set /a a3=%random%%%2
set /a a4=%random%%%2
set /a a5=%random%%%2
set /a a11=%random%%%2
set /a a21=%random%%%2
set /a a31=%random%%%2
set /a a41=%random%%%2
set /a a51=%random%%%2
set /a a12=%random%%%2
set /a a22=%random%%%2
set /a a32=%random%%%2
set /a a42=%random%%%2
set /a a52=%random%%%2
set /a b1=%random%%%2
set /a b2=%random%%%2
set /a b3=%random%%%2
set /a b4=%random%%%2
set /a b5=%random%%%2
set /a b11=%random%%%2
set /a b21=%random%%%2
set /a b31=%random%%%2
set /a b41=%random%%%2
set /a b51=%random%%%2
set /a b12=%random%%%2
set /a b22=%random%%%2
set /a b32=%random%%%2
set /a b42=%random%%%2
set /a b52=%random%%%2

echo %a1% %a2% %a3%%a4% %a5% %a11%%a21%%a31% %a41% %a51%  %a12% %a22% %a32%%a42% %a52% %b1%%b2% %b3% %b4% %b5% %b11%  %b21%%b31%%b41% %b51% %b12% %b22% %b32%%b42% %b52%

for /L %%x in (1,1,4) Do (
	ping -n 1 -w 1 127.0.0.1 1>nul
)
goto matrix
endlocal

goto exit
mode 1000, to make it full screen.
source: https://superuser.com/questions/285984/how-do-i-full-screen-my-cmd

:exit