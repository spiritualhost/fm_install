@echo off

:: For expanded wildcards 
setlocal enabledelayedexpansion

:: Connect to network share and get drive letter
call "%~dp0config.bat"
echo %NET_SHARE%

:: EULA acceptance
set AI_LICENSE_ACCEPTED=1
:: Get system user name, which should match the AD name used to log into FileMaker
set AI_USERNAME=%USERNAME%
:: Set default language value
set AI_LANGUAGE=English
:: Install for all users
set AI_APPLICATIONUSERS=AllUsers
:: Prevent users from creating custom apps
set AI_NONEWDATABASES=1
:: Create a shortcut for FileMaker Pro onm the desktop and in the Quick Launch toolbar
set AI_SHORTCUTS=1
:: Suppress the personalization box during installation
set AI_SKIPDIALOG=1
:: Enable the software update dialog box
set AI_DISABLEUPDATENOTIFY=0
:: Enable the new version notification dialog box
set AI_DISABLEVERSIONNOTIFY=0
:: Enable the option for plugins to be installed by files
set AI_DISABLEPLUGINS=0
:: Show the Enable ODBC/JDBC command
set AI_DISABLEXDBC=0
:: Show the configure for FileMaker WebDirect command
set AI_DISABLEIWP=0
:: Disable or enable the FileMaker Pro development and deployment features
set AI_DISABLEADVANCEDTOOLS=0
:: Open a custom app when Filemaker Pro starts -- add a path below to set up this feature up
set AI_LAUNCH_CUSTOMAPP=
:: Disable the warning for opening apps using an fmp URL
set AI_WARN_FMP_URL=0
:: Enable or disable communication with a FileMaker host using port 443 instead of 5003 (HTTPS tunneling)
set AI_USE_HTTP_PROTOCOL_NETWORK=0 
:: Set the file cache size (if not specified, default is 128 MB)
set AI_SET_FILE_CACHE=
:: Enable or disable accessing external URLs when starting FileMaker Pro
set AI_DISABLEEXTERNALURLS=0

:: Create Assisted Install.txt file (no >>, new file created)
echo: > "Assisted Install.txt"
echo [Assisted Install] >> "Assisted Install.txt"

:: Iterate through variables for writing to AssistedInstall.txt
:: Append newline, then full variable line from above
for /f "delims=" %%V in ('set AI 2^nul') do (
    echo: >> "Assisted Install.txt"
    echo %%V >> "Assisted Install.txt"
)

PAUSE

:: Create path variables using wildcards
set "ROOT_PATH=%NET_SHARE%\Filemaker*"
echo %ROOT_PATH%

for /d %%D in ("%ROOT_PATH%") do (
    set "SETUP_FILEPATH=%%D\Files"
)

:: Copy the 'Assisted Install.txt' file created above to the proper place
copy /y "Assisted Install.txt" "%SETUP_FILEPATH%\Assisted Install.txt"

:: Create variable path pointing to setup.exe
set "SETUP_EXECUTABLE_PATH=%SETUP_FILEPATH%\setup.exe"

echo %SETUP_EXECUTABLE_PATH%

::Silent assisted installation options -- to use another option, have at most *one* uncommented at runtime

:: Install without a user interface (silent installation)
:: "%SETUP_EXECUTABLE_PATH%" /qn

:: Uninstall without a user interface (silent uninstallation)
:: "%SETUP_EXECUTABLE_PATH%" /x /qn 

:: Install when required—advertise to current user (silent advertised installation)
:: "%SETUP_EXECUTABLE_PATH%" /q /ju 

:: Install when required—advertise to all users (silent advertised installation)
:: "%SETUP_EXECUTABLE_PATH%" /q /jm

:: Install the software and display a dialog box indicating whether the software was successfully installed. 
"%SETUP_EXECUTABLE_PATH%" /qn+

:: Install and display a progress bar and Cancel button during installation
:: "%SETUP_EXECUTABLE_PATH%" /qb+ 

:: Install to a non-default location on the user's computer
:: "%SETUP_EXECUTABLE_PATH%" /qb+ INSTALLDIR="installpath"