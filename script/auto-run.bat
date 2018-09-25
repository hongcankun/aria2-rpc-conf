@echo off & title Aria2 Auto Run

@echo | call check
if errorlevel 1 pause && exit /b %errorlevel%

choice /c RU /m "[R:Register, U:Unregister]"
set option=%errorlevel%

IF %option% EQU 1 (REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ /v Aria2  /t REG_SZ /d "%userprofile%\.aria2\rpc\script\start.bat /nopause" /f)
IF %option% EQU 2 (REG DELETE HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ /v Aria2 /f)
pause