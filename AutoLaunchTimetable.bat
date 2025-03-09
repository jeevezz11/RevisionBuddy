@echo off
setlocal

:: Get today's date in dd_mm_yy format
for /f "tokens=2 delims==" %%i in ('"wmic os get localdatetime /value"') do set datetime=%%i
set today=%datetime:~6,2%_%datetime:~4,2%_%datetime:~2,2%

:: Set the path to the RevisionAppData folder
set "folder=%USERPROFILE%\Documents\RevisionAppData"
set "filepath=%folder%\%today%.txt"

:: Check if today's file exists and open it
if exist "%filepath%" (
    echo Opening: "%filepath%"
    start "" "%filepath%"
) else (
    echo No timetable found for today: %today%.txt
)

exit /b
