@echo off
title [Ascii art: Silhouette]

set /a rc=%random%%%5
if %rc% equ 0 color 04
if %rc% equ 1 color 07
if %rc% equ 2 color 0a
if %rc% equ 3 color 03
if %rc% equ 4 color 01

mode con: cols=90 lines=28
type extras\silhouette.txt || cls && type silhouette.txt
timeout -1 >nul
exit