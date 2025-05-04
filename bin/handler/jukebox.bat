cls
:: Call me only please 
:: also specify music before calling. 
del bin\aud\loop.guru >nul
taskkill /f /im wscript.exe >nul
timeout /t 1 /nobreak >nul
::  This timeout needs to stay here. Apparently the delay ensures that only ONE copy 
:: of wscript.exe is executed. audioHandler.bat will insist on having two instances without it for some reason.
:: I'm sure it's fixable but I've spent some hours now just getting music to work. 
(echo plsstopmusicing) > bin\aud\loop.guru
start /min "audioHandler" bin\aud\audioHandler.bat
exit /b