@echo off
@REM This script exports all installed software in your computer.
@REM Useful when you want to change/format your computer and you want to remember your old configuration.

@REM Author: https://github.com/ckaridis

set fileName="installed-software-list.txt"

wmic /output:%fileName% product get name,version