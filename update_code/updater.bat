:: =========================================================
:: UPDATE VERSION
:: =========================================================

set update_version=1.10.0_5826

:: =========================================================
:: VERSION CHECK
:: =========================================================

echo Current Version: %version%
echo Update Version : %update_version%
echo.

if "%version%"=="%update_version%" (
    echo Already up to date.
    pause
    exit /b
)

echo Update required.
echo.

:: =========================================================
:: CREATE TEMP DOWNLOAD AREA
:: =========================================================

if exist temp_files rmdir /S /Q temp_files
mkdir temp_files

:: =========================================================
:: DOWNLOAD UPDATED FILES
:: =========================================================

echo Downloading updated files...

curl -L -o temp_files\BioFuse.bat ^
https://raw.githubusercontent.com/MeshyDev/BioFuse_Repo/refs/heads/1.10.0/BioFuse.bat
:: curl -L -o temp_files\combat.bat ^
:: https://raw.githubusercontent.com/MeshyDev/BioFuse_Repo/refs/heads/1.10.0/bin/

::curl -L -o temp_files\inventory.bat ^
::https://raw.githubusercontent.com/MeshyDev/BioFuse_Repo/main/bin/inventory.bat

:: =========================================================
:: VERIFY DOWNLOADS
:: =========================================================

if not exist temp_files\BioFuse.bat (
    echo ERROR 0404: Failed to download BioFuse.bat
    echo Please check your internet connection and try again.
    pause
    exit /b
)

:: =========================================================
:: REPLACE FILES
:: =========================================================

echo Patching files...

move /Y temp_files\BioFuse.bat BioFuse.bat
:: move /Y temp_files\combat.bat bin\combat.bat
:: move /Y temp_files\inventory.bat bin\inventory.bat

:: =========================================================
:: OPTIONAL FULL BIN RESET
:: =========================================================

:: rmdir /S /Q bin
:: mkdir bin

:: =========================================================
:: CLEANUP
:: =========================================================

rmdir /S /Q temp_files

echo.
echo Update complete!
echo Launching BioFuse...
echo.

start BioFuse.bat

exit
