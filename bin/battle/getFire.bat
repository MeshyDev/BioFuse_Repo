
if %currentEP% LSS 35 echo Your energy supply is exhausted. && echo Cannot perform EP ability! && exit /b
set /a MGCfire=%RANDOM% * %mDmg% / 32768 + 1 
if %nulbool% == 1 set testvar=1 && echo Made it to test magic %testvar% && pause &&  set /a testvar=%testvar% + 1 
set /a currentEP=%currentEP% - 35
if %nulbool% == 1 set testvar=1 && echo Made it to test magic %testvar% && pause &&  set /a testvar=%testvar% + 1 

set /a critDMG=%mDmg% * 5
if %nulbool% == 1 set testvar=1 && echo Made it to test magic %testvar% && pause &&  set /a testvar=%testvar% + 1 

:: CHECKME: Does this do anything?
:: ANSWER: YES. YES IT DOES.

if %nulbool% == 1 set testvar=1 && echo Made it to test magic %testvar% && pause &&  set /a testvar=%testvar% + 1 
if "%enemy%" == "Wendigo" set /a MGCfire=%MGCfire% + %critDMG% && echo The Wendigo screeches in pain.
echo You cast a fireball^! You did %MGCfire% damage to %enemy%^!
echo %enemy% is now on fire^!  
set EhealthStatus=Burning 
if %nulbool% == 1 set testvar=1 && echo Made it to test magic  %testvar% && pause &&  set /a testvar=%testvar% + 1 
set /a EcurrentHP=%EcurrentHP% - %MGCfire%  
if %nulbool% == 1 set testvar=1 && echo Made it to test magic %testvar% && pause &&  set /a testvar=%testvar% + 1 
echo.
exit /b 