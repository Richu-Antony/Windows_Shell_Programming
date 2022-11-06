@echo off
@REM This script exports all environment variables in two .reg files of the machine it runs at.

@REM Author: https://github.com/ckaridis

regedit /e "%CD%\user_env_variables.reg" "HKEY_CURRENT_USER\Environment"
regedit /e "%CD%\global_env_variables.reg" "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"