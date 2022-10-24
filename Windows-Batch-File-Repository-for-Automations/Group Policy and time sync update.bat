@echo off
echo --Updating Group policy--
gpupdate /force
w32tm /resync
echo --Policy update completed--