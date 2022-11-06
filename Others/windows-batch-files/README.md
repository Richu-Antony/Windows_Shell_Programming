## Windows Batch File Repository
> Batch Files for different uses such as running command prompt in a batch file and bypassing any CMD block restrictions, starting file explorer and updating group policies.

---

* 5 Second Shutdown
#### 5 second shut down script
`shutdown -s -t 5 -c "Shutting Down"`

---

* Command Prompt Bypass
#### Running command prompt in a batch file without opening cmd.exe
#### Can be run even if running cmd.exe or conhost.exe is blocked.
`@echo off`
`break off`
`title Terminal`
`cls`

`:cmd`
`set /p cmd=C:\Enter CMD:`

`%cmd%`
`echo.`
`goto cmd`

---

* Open File Explorer
#### Run explorer.exe
`start explorer.exe`

---

* Group Policy Update
### Run gpupdate /force
`gpupdate /force`

---

> **All other batch files run similar commands that are featured.**
