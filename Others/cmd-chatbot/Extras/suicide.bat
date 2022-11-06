@echo off
title [Ascii art: suicide]

set /a rc=%random%%%2
if %rc% equ 0 color 07
if %rc% equ 1 color 08

mode con: cols=90 lines=26
type extras\suicide.txt || cls && type suicide.txt
timeout -1 >nul
exit


sometimes this, type extras/smile.txt
don't work.
but this works in batch extras\smile.txt always.