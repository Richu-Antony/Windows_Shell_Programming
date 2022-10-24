:: Boots to Test Mode.
:: The test mode is just like regular mode, but it has driver signature enforcement disabled.
:: That way, unsigned hardware drivers can be installed in this mode.
:: Must be ran as administrator or will restart to normal mode instead.

bcdedit /set {current} testsigning on
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "*UndoSB" /t REG_SZ /d "bcdedit /deletevalue {current} testsigning"
SHUTDOWN -r -f -t 07
