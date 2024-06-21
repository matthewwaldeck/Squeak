@echo off
cls
:::       ______                         _    
:::      / / ___|  __ _ _   _  ___  __ _| | __
:::     / /\___ \ / _` | | | |/ _ \/ _` | |/ /
:::  _ / /  ___) | (_| | |_| |  __/ (_| |   < 
::: (_)_/  |____/ \__, |\__,_|\___|\__,_|_|\_\
:::                  |_|                      
:::Maintenance Tool
:::Version: 1.1.1
:::Developed by: Matt Waldeck
:::Last update: 2024.06.06

:: Logo display.
:: Artwork: https://patorjk.com/software/taag/#p=display&f=Standard&t=.%2FSqueak
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo %%A
echo.


:: https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file/10052222#10052222
:-------------------------
:: Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:: If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------

set "logpath=C:\Temp\Squeak\Maintenance_%COMPUTERNAME%_%DATE%.txt"

:: Empty recycle bin
echo Emptying recycle bin...
rd /s %systemdrive%\$Recycle.bin
echo "Recycle Bin has been emptied." > %logpath%
echo Done.
echo.

:: Defragment disks
echo Beginning disk defragmentation.
echo This could take some time on older drives...
defrag /C /O >> %logpath%
echo Done.
echo.

:: SMART status check.
echo Checking SMART status...
wmic diskdrive get model,status >> %logpath%
echo Done.
echo.

:: Disk scan.
echo Beginning disk scan...
chkdsk >> %logpath%
echo Done. If errors were found, please run 'chkdsk /F' from
echo an elevated prompt and schedule for next reboot.
timeout 1 > NUL
echo.

:: File system scan
echo Beginning SFC scan, this will take some time...
sfc /scannow >> %logpath%
echo Done.
echo.

echo Maintenance complete. Please check the log
echo file located at C:\Temp\Squeak for results.
echo.
pause