@echo off
:::       ______                         _    
:::      / / ___|  __ _ _   _  ___  __ _| | __
:::     / /\___ \ / _` | | | |/ _ \/ _` | |/ /
:::  _ / /  ___) | (_| | |_| |  __/ (_| |   < 
::: (_)_/  |____/ \__, |\__,_|\___|\__,_|_|\_\
:::                  |_|                        
:::Version: 1.0.0
:::Developed by: Matt Waldeck
:::Last update: 2024.06.04

:: Logo display.
:: Artwork: https://patorjk.com/software/taag/#p=display&f=Standard&t=.%2FSqueak
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo %%A
echo.
pause

:: Main Menu
:menu
cls
echo Welcome to Squeak!
echo A friendly little utility for setup and maintenance of a Windows system.
echo.
echo 1:AV Removal  2:Malware Scan  3:Remove Windows Bloat
echo 4:System Maintenance  5:Install Software  0:Close
echo.
set "option="
set /p "option=What would you like to do today? "

:: Close
if %option%==0 (
    echo Closing...
    timeout 1 > NUL
    exit
) if %option%==1 (
    :: Antivirus Removal
    echo Starting antivirus removal script...
    timeout 2 > NUL
    start .\av_removal\av_removal.bat
    timeout 2 > NUL
    goto menu
) if %option%==2 (
    :: Malware Scan
    echo Virus Removal tool is in development!
    :: https://support.kaspersky.com/kvrt2015/howto/8537
    ::echo Downloading Kaspersky Virus Removal Tool...
    :: Need to track down download link.
    ::echo Starting malware scan...
    ::call ".\malware_scans\KVRT.exe" -accepteula -silent -processlevel 2
    ::echo Scan complete! Press enter to return to the main menu.
    pause > NUL 
    goto menu
) if %option%==3 (
    :: Remove Bloatware
    echo Bloatware removal script is in development!
    pause
    goto menu
) if %option%=4 (
    :: System Maintenance
    echo System maintenance script is in development!
    pause
    goto menu
) if %option%=5 (
    :: Install Software
    echo Install scripts are in development!
    :: powershell.exe -executionpolicy unrestricted ./setup.ps1
    pause
    goto menu
) else (
    :: Otherwise...
    echo Please enter a valid selection.
    timeout 3 > NUL
    goto menu
)