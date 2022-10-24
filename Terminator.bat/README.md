# Terminator.bat

A simple interactive Windows batch script which can be used to remotely check system uptime, logoff the current user, or reboot a PC. Useful for remote support staff, such as helpdesk agents. 

## Requirements

Administrative rights on the remote PC will likely be required. It may be necessary to run this script as another user with the appropriate privileges. 

To logoff the current user, PsExec also needs to be present and available in your $PATH before running the script. You can download and install PsExec, and other SystemInternals tools at [www.sysinternals.com](http://www.sysinternals.com).

## Usage

Simply click on Terminator.bat or run it from a Command Prompt window. Then use the interactive prompts to specify a computer, and the actions to take.

*Note: As mentioned in **Requirements**, you may need to right-click and **"Run as a different user..."** with elevated privileges on the remote PCs.*
