@echo off & title Aria2 Auto Run & setlocal

choice /c RU /m "[R:Register, U:Unregister]"
set option=%errorlevel%

set command=%userprofile%\.aria2\rpc\script\hide-run.vbs
IF %option% EQU 1 (REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ /v Aria2  /t REG_SZ /d "%command%" /f)
IF %option% EQU 2 (REG DELETE HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ /v Aria2 /f)
pause