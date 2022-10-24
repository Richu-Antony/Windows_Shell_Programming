@echo off
title [Ascii art: King]

set /a rc=%random%%%3
if %rc% equ 0 color 03
if %rc% equ 1 color 07
if %rc% equ 2 color 0e

mode con: cols=45 lines=46
type extras\King.txt || cls && type King.txt
timeout -1 >nul
exit