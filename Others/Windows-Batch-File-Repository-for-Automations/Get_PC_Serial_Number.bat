@echo off
rem - Seadrill RSSG
rem - Get PC serial number from BIOS
rem - v.1.0 08.12.2016

wmic bios get serialnumber /format:list
pause >nul