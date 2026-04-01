@echo off

:: EULA acceptance
set AI_LICENSE_ACCEPTED=1
echo %AI_LICENSE_ACCEPTED%

:: Get system user name, which should match the AD name used to log into FileMaker
set AI_USERNAME=%USERNAME%
echo %AI_USERNAME%

:: Set default language value
set AI_LANGUAGE=English
echo %AI_LANGUAGE%

:: Install for all users
set AI_APPLICATIONUSERS=AllUsers
echo %AI_APPLICATIONUSERS%

:: Prevent users from creating custom apps
set AI_NONEWDATABASES=1
echo %AI_NONEWDATABASES%

:: Create a shortcut for FileMaker Pro onm the desktop and in the Quick Launch toolbar
set AI_SHORTCUTS 



:: Suppress the personalization box during installation
set AI_SKIPDIALOG


:: Enable the software update dialog box
set AI_DISABLEUPDATENOTIFY


:: Enable the new version notification dialog box
set AI_DISABLEVERSIONNOTIFY



:: Enable the option for plugins to be installed by files
set AI_DISABLEPLUGINS



:: Hide or show the Enable ODBC/JDBC command
set AI_DISABLEXDBC




:: Hide or show the configure for FileMaker WebDirect command
set AI_DISABLEIWP


:: Disable or enable the FileMaker Pro development and deployment features
set AI_DISABLEADVANCEDTOOLS



:: Open a custom app when Filemaker Pro starts -- uncomment the below to set up this feature up
:: set AI_LAUNCH_CUSTOMAPP=

:: Enable or disable the warning for opening apps using an fmp URL
set AI_WARN_FMP_URL

:: Enable or disable communication with a FileMaker host using port 443 instead of 5003 (HTTPS tunneling)
set AI_USE_HTTP_PROTOCOL_NETWORK



:: Set the file cache size (if not specified, default is 128 MB)
:: set AI_SET_FILE_CACHE=

:: Enable or disable accessing external URLs when starting FileMaker Pro
set AI_DISABLEEXTERNALURLS



:: Set up AssistedInstall.txt



PAUSE


:: Install the software and display a dialog box indicating whether the software was successfully installed. 
:: "\setup.exe" /qn+
