:: Replacer 2.57 by Undefined
:: www3.telus.net/_/replacer/
:: Email: undefined@telus.net

Description:

 Replacer is an easy to use system file replacer
 for 2K/XP. It is used to safely replace
 protected or in-use system files.

Requirements:

 - Windows XP or 2000
 - Administrator privileges
 - Windows setup CD not in drive
 - Windows Scripting Host 5.6
    Link: http://tinyurl.com/33yba

Installation:

 Extract Replacer.zip to a folder and run
 Replacer.cmd.

 Its appearance can be changed by right-clicking
 the title bar and choosing Properties.

 To uninstall, delete the folder where Replacer
 is stored, and remove the undo file
 (%windir%\ReplacerUndo.txt).

Components:

 If you are running Windows 2000 or are
 experiencing constant errors, download the
 components package. Link:
  http://www3.telus.net/_/replacer/Components.zip

Explanation:

 Replacer uses a combination of tools to replace
 a protected system file, without disturbing the
 user.

 Three files are extracted from the data file
 into a temporary folder:

  - Clear_WFP_Message.vbs: Clears the Windows
     File Protection message. Some anti-virus
     programs may incorrectly detect this as a
     malicious script. Access to this script is
     not essential, but recommended. After the
     replacement, this script will run for 15
     seconds, to ensure that it doesn't miss any
     late messages.

  - Special.cmd: Contains a list of commands to
     handle special files with different paths,
     unique attributes, or varying names. It also
     contains most message strings, for ease of
     translation in the future.

  - Zap.exe: Forcefully deletes the system file.
     This may leave temporary files on the root
     of the drive (named _@??.tmp), which will be
     deleted after rebooting.

 After the files have been specified, a backup is
 created. It is stored in the same folder as the
 system file, with the extension "backup" (such
 as "notepad.backup"). The replacement file is
 then copied to up to five folders which contain
 backups of the system file.

 As the file is being replaced, a log is written
 to "ReplacerUndo.txt" in the Windows folder. If
 the replacement prevents the system from
 properly booting, the previous operation can be
 reversed from the recovery console.

 Finally, the VBScript is executed to clear any
 messages, and the system file is replaced.

 If Replacer is closed properly (by following the
 on-screen instructions), the temp folder it uses
 will be automatically deleted.
 
 To view the executed code, open Replacer.cmd in
 a text editor. The data file can be extracted as
 a cabinet to view the VB and batch scripts.

Scripting:

 Scripts can be used to replace multiple files
 at once. A script is simply a text file
 containing a list of files to be replaced. They
 use the general format:
  SysFile,Replacement,Ref#,Optional

 Each script must contain the following line:
  ;; ReplacerScript

 Type the name of the system file to be replaced,
 followed by a comma, then the replacement file.
 Do not include the system file path (it will be
 determined automatically). The replacement file
 should be relative to the script, not Replacer:
  notepad.exe,notepad-new.exe

 The word "Restore" can be used to restore a file
 from a backup copy, if it was previously
 replaced with Replacer:
  notepad.exe,Restore

 Comments can be added with a single semicolon.
 Lines containing a semicolon will be skipped:
  ; This is a comment

 If the system file and the replacement file have
 the same filename, only one of them needs to be
 specified:
  notepad.exe

 Files with multiple paths can be identified
 using a reference number. This is placed at the
 end of the line, after a comma. If the file's
 reference number is zero, the number can be
 omitted:
  ; Replace notepad.exe in the windows folder
  notepad.exe,notepad.new
  ; Replace notepad.exe in the system32 folder
  notepad.exe,notepad.new,1
  ; Replace the Metallic shellstyle.dll
  shellstyle.dll,shellstyle.new,2

 List of files with reference numbers:
  Comctl32,0   = %windir%\system32\comctl32.dll
  Comctl32,1   = %windir%\WinSxS\x86...1382d70a\comctl32.dll
  Comctl32,2   = %windir%\WinSxS\x86...f7fb5805\comctl32.dll
  Comctl32,3   = %windir%\WinSxS\x86...7abf6d02\comctl32.dll
  Comctl32,4   = %windir%\WinSxS\x86...7bb98b8a\comctl32.dll
  Comctl32,5   = %windir%\WinSxS\x86...a84f1ff9\comctl32.dll
  Commdlg,0    = %windir%\system\commdlg.dll
  Commdlg,1    = %windir%\system32\commdlg.dll
  Notepad,0    = %windir%\notepad.exe
  Notepad,1    = %windir%\system32\notepad.exe
  Shellstyle,0 = %windir%\system32\shellstyle.dll
  Shellstyle,1 = %windir%\Resources\Themes\Luna\Shell\NormalColor\shellstyle.dll
  Shellstyle,2 = %windir%\Resources\Themes\Luna\Shell\Metallic\shellstyle.dll
  Shellstyle,3 = %windir%\Resources\Themes\Luna\Shell\Homestead\shellstyle.dll

 The word "Optional" can be used to ask the user
 whether or not to replace a file:
  notepad.exe,notepad.new,Optional

 To execute the script, drag and drop it onto the
 Replacer.cmd file. Or, run Replacer from the
 command line with the script as a parameter.

 Sample script:
  ;; ReplacerScript
  ; Replace and restore notepad
  notepad.exe,notepad.new
  notepad.exe,Restore
  ; Optionally replace Commdlg
  commdlg.dll,new.dll,1,Optional

Recovery:

 In some cases, replacing a system file with a
 corrupt or out-of-date file could prevent the
 system from properly booting.

 Replacer has an "undo" feature to reverse the
 previous operation from the recovery console.

 To undo the last replacement:
  1 : Enter the recovery console:
       - Insert the Windows setup CD
       - Reboot
       - Press "R" at the blue setup screen
       - Win2000 users: Type "C" next
       - Follow the on-screen instructions
  2 : At the "C:\WINDOWS>" prompt, type:
       BATCH ReplacerUndo.txt
  3 : When the operation is complete, type:
       EXIT

 Note the following:
  - Only the most recent operation can be undone
  - Scripts count as one operation, meaning an
    entire script can be undone at once
  - The undo log is cleared next time Replacer is
    used
  - Restore operations from Replacer cannot be
    undone from the recovery console

Acknowledgements:

 Thanks to the whole VirtualPlastic group, and:
  - Michel Gallant for portions of the VBS
  - Explicit, schmin, demlak, and spyder for
    testing Replacer in its early stages
  - Simon Sheppard and Frank P. Westlake for
    portions of the dequote function.
  - Michael Harris for the "kill flag" concept
  - Ritchie Lawrence for the wildcard checker
  - Phil Robyn for the comma expansion idea
  - Plastic for the DLL list
  - WinT for his article on Replacer
  - Simon, flyakite, fireball, and Odyssey for
    suggesting files to add to the db
  - Tomcat76, Enkaiyaju, spyder, grindlestone,
    Adam L., Joona B., Rual A.C., dreamz, Bubka,
    Devil in Disguise, and R. Lau for providing
    feedback
  - Julien, Explicit, iridium, imokruok, qoa,
    Ace Troubleshooter, Anibal R., KingManon,
    Tau, chevrolet, enfusion, cfm, Peter C.,
    Babis, Daniel, SOD, and plastic for helping
    find bugs.

Contact:

 Send feedback, problems, or requests to:
  Undefined@telus.net
