@echo off

title "Revo's simple EDF backup"

:5
cls
echo ============================================
echo Please select one of the following options.
echo.
echo 1) Backup EDF save folder
echo 2) Restore EDF backup
echo 3) Exit
echo ============================================

choice /C 123 /N
IF %ERRORLEVEL% EQU 1 GOTO 15
IF %ERRORLEVEL% EQU 2 GOTO 20
IF %ERRORLEVEL% EQU 3 exit
pause

:15
IF NOT EXIST "%userprofile%/Documents/My Games/.EDFBACKUPS" mkdir "%userprofile%/Documents/My Games/.EDFBACKUPS"
robocopy "%userprofile%/Documents/My Games/EDF4.1/SAVE_DATA" "%userprofile%/Documents/My Games/.EDFBACKUPS" *.* /S /IS
cls
echo Backup sucessful.
pause
GOTO :5

:20
IF NOT EXIST "%%userprofile%/Documents/My Games/.EDFBACKUPS" GOTO :50
robocopy "%userprofile%/Documents/My Games/.EDFBACKUPS" "%userprofile%/Documents/My Games/EDF4.1/SAVE_DATA" *.* /S /IS
cls
echo Backup restore successful.
pause
GOTO :5

:50
cls
echo No Backup found. Please back up a save first!
pause
goto 5
exit
