
if %currentEP% LSS 35 echo Your energy supply is exhausted. && echo Cannot perform EP ability! && goto Battle 
set /a MGCfire=%RANDOM% * 10 / 32768 + 1 
set /a currentEP=%currentEP% - 35
if %nulbool% == 1 set testvar=1 && echo Made it to test magic %testvar% && pause &&  set /a testvar=%testvar% + 1 
echo You cast a fireball! You did %MGCfire% damage to %enemy%!
echo %enemy% is now on fire!  
set EhealthStatus=Burning 
if %nulbool% == 1 set testvar=1 && echo Made it to test magic  %testvar% && pause &&  set /a testvar=%testvar% + 1 
set /a EcurrentHP=%EcurrentHP% - %MGCfire%  
if %nulbool% == 1 set testvar=1 && echo Made it to test magic %testvar% && pause &&  set /a testvar=%testvar% + 1 
echo.
exit /b 