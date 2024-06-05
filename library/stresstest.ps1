@echo off
cls
:::       ______                         _    
:::      / / ___|  __ _ _   _  ___  __ _| | __
:::     / /\___ \ / _` | | | |/ _ \/ _` | |/ /
:::  _ / /  ___) | (_| | |_| |  __/ (_| |   < 
::: (_)_/  |____/ \__, |\__,_|\___|\__,_|_|\_\
:::                  |_|                        
:::Stress Test
:::Version: 1.0.0
:::Developed by: Matt Waldeck
:::Last update: 2024.06.05

:: Logo display.
:: Artwork: https://patorjk.com/software/taag/#p=display&f=Standard&t=.%2FSqueak
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo %%A
echo.

# Warning
Clear-Host
Write-Output "Warning: This may affect system performance."

$coreCount = Get-WmiObject win32_processor | Select-Object -ExpandProperty NumberOfLogicalProcessors
Write-Output "Running jobs on $coreCount threads..."
# For each item in $coureCount, start a job.
foreach ($_ in 1..$coreCount){
    Start-Job -ScriptBlock{
    $result = 1
        foreach ($number in 1..2147483647){
            $result = $result * $number
        }
    }
}

Wait-Job *
Clear-Host
Receive-Job *
Remove-Job *