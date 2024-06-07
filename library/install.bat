@echo off
cls
:::       ______                         _    
:::      / / ___|  __ _ _   _  ___  __ _| | __
:::     / /\___ \ / _` | | | |/ _ \/ _` | |/ /
:::  _ / /  ___) | (_| | |_| |  __/ (_| |   < 
::: (_)_/  |____/ \__, |\__,_|\___|\__,_|_|\_\
:::                  |_|                        
:::Software Install Tool
:::Version: 1.0.0
:::Developed by: Matt Waldeck
:::Last update: 2024.06.07

:: Logo display.
:: Artwork: https://patorjk.com/software/taag/#p=display&f=Standard&t=.%2FSqueak
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo %%A
echo.


curl https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2300320201/AcroRdrDCx642300320201_en_US.exe "C:\Temp\Squeak\Installers\Reader.exe"
C:\Temp\Squeak\Installers\Reader.exe /sAll /rs /msi EULA_ACCEPT=YES