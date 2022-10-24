# Simple backup script for Windows Vista or later

## Setup

1. Copy backup_script.bat to wherever you want to store it.
2. Open backup_script.bat in notepad and adjust paths according to your needs (see comments) - location of folder to back up and location where backups will be stored.
3. Open backup_scheduler.bat in notepad and adjust path of backup_script.bat to reflect, where you store the script on your hard drive. You can also adjust how often and at what time backup should be done. By default it will be done daily at 1 PM.
4. Run the script backup_scheduler.bat - it will create a task in Windows Task Scheduler to automatically create backup. After that you can remove backup_scheduler.bat BUT NOT THE OTHER SCRIPT!
5. Done

## Comments, critiques and bug complaints

* If you have a constructive critique about my script feel free to share it somewhere around this repository. It will be welcome as I'm still learning and I'm totally new to cmd (batch) scripting.
* If you find a bug or potentially glitchy user scenario please let me know in "Issues" tab of this repo. I will do my best to fix it.
* If you have ideas for new features of these scripts or would like me to adjust it to your needs, then please don't write to me. I wrote this script as a favour to my friend and wanted to share my work with the internet for free, but scripting in batch is not fun.
