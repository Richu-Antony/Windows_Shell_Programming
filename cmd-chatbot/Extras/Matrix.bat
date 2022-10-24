echo off

set /a rc=%random%%%4
if %rc% equ 0 color 0a
if %rc% equ 1 color 03
if %rc% equ 2 color 04
if %rc% equ 3 color 0b

Title [Animation: Matrix]
mode con: cols=54 lines=21

setlocal enabledelayedexpansion
:matrix
set /a a1=%random%
set /a a1=a1%%2

set /a a2=%random%
set /a a2=a2%%2

set /a a3=%random%
set /a a3=a3%%2

set /a a4=%random%
set /a a4=a4%%2

set /a a5=%random%
set /a a5=a5%%2

set /a a11=%random%
set /a a11=a11%%2

set /a a21=%random%
set /a a21=a21%%2

set /a a31=%random%
set /a a31=a31%%2

set /a a41=%random%
set /a a41=a41%%2

set /a a51=%random%
set /a a51=a51%%2

set /a a12=%random%
set /a a12=a12%%2

set /a a22=%random%
set /a a22=a22%%2

set /a a32=%random%
set /a a32=a32%%2

set /a a42=%random%
set /a a42=a42%%2

set /a a52=%random%
set /a a52=a52%%2

set /a b1=%random%
set /a b1=b1%%2

set /a b2=%random%
set /a b2=b2%%2

set /a b3=%random%
set /a b3=b3%%2

set /a b4=%random%
set /a b4=b4%%2

set /a b5=%random%
set /a b5=b5%%2

set /a b11=%random%
set /a b11=b11%%2

set /a b21=%random%
set /a b21=b21%%2

set /a b31=%random%
set /a b31=b31%%2

set /a b41=%random%
set /a b41=b41%%2

set /a b51=%random%
set /a b51=b51%%2

set /a b12=%random%
set /a b12=b12%%2

set /a b22=%random%
set /a b22=b22%%2

set /a b32=%random%
set /a b32=b32%%2

set /a b42=%random%
set /a b42=b42%%2

set /a b52=%random%
set /a b52=b52%%2

echo !a1! !a2! !a3!!a4! !a5! !a11!!a21!!a31! !a41! !a51!  !a12! !a22! !a32!!a42! !a52! !b1!!b2! !b3! !b4! !b5! !b11!  !b21!!b31!!b41! !b51! !b12! !b22! !b32!!b42! !b52!

for /L %%x in (1,1,4) Do (
	ping -n 1 -w 1 127.0.0.1 1>nul
)
goto matrix
endlocal

goto exit
mode 1000, to make it full screen.
source: https://superuser.com/questions/285984/how-do-i-full-screen-my-cmd

I know that the i used one extra 'set /a ' line for each line which
is redundant but this one looks easy to understand for beginners.

:exit