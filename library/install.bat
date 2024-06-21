@echo off
:installmenu
cls
:::       ______                         _    
:::      / / ___|  __ _ _   _  ___  __ _| | __
:::     / /\___ \ / _` | | | |/ _ \/ _` | |/ /
:::  _ / /  ___) | (_| | |_| |  __/ (_| |   < 
::: (_)_/  |____/ \__, |\__,_|\___|\__,_|_|\_\
:::                  |_|                        
:::Software Install Tool
:::Version: 1.1.0
:::Developed by: Matt Waldeck
:::Last update: 2024.06.21

:: Logo display.
:: Artwork: https://patorjk.com/software/taag/#p=display&f=Standard&t=.%2FSqueak
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo %%A
echo.

echo Welcome to the Squeak Software Install Module!
echo 0:Cancel  1:Web Browsers  2:Productivity

set /p "option=Please select a category: "

:: Close
if %option%==0 (
    echo Closing...
    timeout 1 > NUL
    cls
    exit
)

:: Web Browsers
if %option%==1 (
    set /p "browser=Please select Chrome or Firefox. "
    if %browser%=="Chrome" (
        curl https://www.google.com/intl/en/chrome/next-steps.html?standalone=1&statcb=0&installdataindex=empty&defaultbrowser=0# "C:\Temp\Squeak\Installers\Chrome.exe"
        C:\Temp\Squeak\Installers\Chrome.exe /silent /install
        goto
    )

    if %browser%=="Firefox" (
        curl https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-CA "C:\Temp\Squeak\Installers\Firefox.exe"
        C:\Temp\Squeak\Installers\Firefox.exe /S
    )

    goto installmenu
)

:: Productivity
if %option%==1 (
    ser /p "app=What would you like to install? "
    if %app%=="Reader" (
        curl https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2300320201/AcroRdrDCx642300320201_en_US.exe "C:\Temp\Squeak\Installers\Reader.exe"
        C:\Temp\Squeak\Installers\Reader.exe /sAll /rs /msi EULA_ACCEPT=YES
    )

    if %app%=="Code" (
        curl https://code.visualstudio.com/sha/download?build=stable&os=win32-x64 "C:\Temp\Squeak\Installers\Code.exe"
        C:\Temp\Squeak\Installers\Code.exe
    )

    goto installmenu
)