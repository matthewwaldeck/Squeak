@echo off
:main
cls
:::       ______                         _    
:::      / / ___|  __ _ _   _  ___  __ _| | __
:::     / /\___ \ / _` | | | |/ _ \/ _` | |/ /
:::  _ / /  ___) | (_| | |_| |  __/ (_| |   < 
::: (_)_/  |____/ \__, |\__,_|\___|\__,_|_|\_\
:::                  |_|                        
:::Version: 1.1.1
:::Developed by: Matt Waldeck
:::Last updated: 2024.06.06

:: Logo display.
:: Artwork: https://patorjk.com/software/taag/#p=display&f=Standard&t=.%2FSqueak
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo %%A

echo.
echo Welcome to Squeak!
echo A friendly little utility for setup and maintenance of a Windows system.
echo.
echo 1:Diagnostics  2:AV Removal  3:Malware Scan  4:Install Software
echo 5:System Maintenance  6:Remove Windows Bloat  0:Close
echo.
set "option="
set /p "option=What would you like to do today? "

:: Close
if %option%==0 (
    echo Closing...
    timeout 1 > NUL
    cls
    exit
)

:: Diagnostics
if %option%==1 (
    mkdir "C:\Temp\Squeak\Diagnostic" > NUL 2>&1
    echo.

    :: Basic hardware rundown.
    wmic cpu get name, deviceid, numberofcores, maxclockspeed, status > C:\Temp\Squeak\Diagnostic\Hardware.txt
    wmic computersystem get totalphysicalmemory >> C:\Temp\Squeak\Diagnostic\Hardware.txt
    wmic bios get serialnumber >> C:\Temp\Squeak\Diagnostic\Hardware.txt

    :: System info.
    systeminfo > C:\Temp\Squeak\Diagnostic\SystemInfo.txt
    wmic path softwareLicensingService get OA3xOriginalProductKey > C:\Temp\Squeak\Diagnostic\Activation.txt

    :: Attached disks.
    wmic diskdrive get name,model,size > C:\Temp\Squeak\Diagnostic\Disks.txt

    :: Installed software.
    echo Gathering software information. This will take some time...
    wmic product get name,version > C:\Temp\Squeak\Diagnostic\Software.txt
    echo.
    echo Diagnostics complete. Please see C:\Temp\Squeak\Diagnostic.
    echo.
    pause
    goto main
)

:: Antivirus Removal
if %option%==2 (
    echo Starting antivirus removal script...
    timeout 1 > NUL
    start .\av_removal\av_removal.bat
    timeout 1 > NUL
    goto main
)

:: Malware Scan
if %option%==3 (
    echo Virus Removal tool is in development!
    :: mkdir "C:\Temp\Squeak\Malware Removal" > NUL 2>&1
    :: https://support.kaspersky.com/kvrt2015/howto/8537
    :: echo Downloading Kaspersky Virus Removal Tool...
    :: Need to track down download link.
    :: curl https://downfromhere.kaspersky.com/
    :: echo Starting malware scan...
    :: call "C:\Temp\Squeak\Malware Removal\KVRT.exe" -accepteula -silent -processlevel 2
    :: echo Scan complete! Press enter to return to the main main.
    pause
    goto main
)

:: Software Install
if %option%==4 (
    echo Install scripts are in development!
    :: powershell.exe -executionpolicy unrestricted ./setup.ps1
    pause
    goto main
)

:: System Maintenance
if %option%==5 (
    echo Starting maintenance script...
    timeout 1 > NUL
    start .\library\maintenance.bat
    timeout 1 > NUL
    goto main
)

:: Remove Bloatware
if %option%==6 (
    echo Bloatware removal script is in development!
    pause
    goto main
)

:: Otherwise...
if %option% GTR 6 (
    echo Please enter a valid selection.
    timeout 3 > NUL
    goto main
)