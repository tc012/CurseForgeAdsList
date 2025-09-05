@echo off
title xa-adlist dns apply
echo ======================
echo  xa-adlist dns apply
echo ======================
goto backup
rem go to backup to restore, restore coming soon :)


:backup
echo.
echo.
echo Backing up Hosts
echo This should be stored in your User Directory in a folder called xa-adlist-data
echo (%USERPROFILE%/xa-adlist-data)
cd %USERPROFILE%
mkdir xa-adlist-data

copy C:\Windows\System32\drivers\etc\hosts %USERPROFILE%\xa-adlist-data\oldhosts
goto download

cls
echo.
echo ==============
echo  Downloading
echo ==============


:download
powershell -command Invoke-WebRequest -Uri "https://tc012.gtk.cl/xa-adlist/cfads.txt" -OutFile "$env:USERPROFILE/xa-adlist-data/hosts"
goto apply

:apply
cls
echo ==========================
echo    Applying changes :)
echo ==========================
xcopy /y "%USERPROFILE%\xa-adlist-data\hosts" "c:/windows/system32/drivers/etc/hosts"

goto credits

:credits
cls
echo.
echo ============================
echo Finished, thanks for using
echo this tool from tc012.gtk.cl
echo ============================
echo.
echo. 
echo This will close in 5 seconds.
timeout /t 5