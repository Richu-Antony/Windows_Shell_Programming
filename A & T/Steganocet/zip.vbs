' Copyright 2021 Ayush Shah
' https://github.com/AyushShahh/steganocet

Set objArgs = WScript.Arguments
Set FS = CreateObject("Scripting.FileSystemObject")
InputFolder = FS.GetAbsolutePathName(objArgs(0))
ZipFile = FS.GetAbsolutePathName(objArgs(1))

CreateObject("Scripting.FileSystemObject").CreateTextFile(ZipFile, True).Write "PK" & Chr(5) & Chr(6) & String(18, vbNullChar)

Set objShell = CreateObject("Shell.Application")

Set source = objShell.NameSpace(InputFolder).Items

objShell.NameSpace(ZipFile).CopyHere(source)

Do Until objShell.NameSpace( ZipFile ).Items.Count = objShell.NameSpace( InputFolder ).Items.Count
    WScript.Sleep 200
Loop
