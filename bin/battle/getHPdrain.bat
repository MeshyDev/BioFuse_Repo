
if %currentEP% LSS 50 echo Your energy supply is exhausted. && echo Cannot perform EP ability! && exit /b
set /a MGCdrain=%RANDOM% * %maxHP% / 32768 + 1 
if %MGCdrain% LSS 0 set MGCdrain=10000
set /a EcurrentHP=%EcurrentHP% - %MGCdrain%
set /a currentHP=%currentHP% + %MGCdrain%  
set /a currentEP=%currentEP% - 50
if %nulbool% == 1 set testvar=1 && echo Made it to test magic %testvar% && pause &&  set /a testvar=%testvar% + 1 
echo You begin to drain %enemy%'s HP. You did %MGCdrain% damage to %enemy%!
echo You recover %MGCdrain% HP!  
if %nulbool% == 1 set testvar=1 && echo Made it to test magic  %testvar% && pause &&  set /a testvar=%testvar% + 1 
echo.
exit /b 