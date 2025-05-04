:: This should only be called! This is a subroutine, not a fully accessible block. 
set /a regDMG=%RANDOM% * %dmg% / 32768 + 1 
set /a regDMG=%regDMG% + %weapondmg%
if %nulbool% == 1 set testvar=1 && echo Made it to test critDMG %testvar% && pause &&  set /a testvar=%testvar% + 1 
set /a critDMG=%regDMG% * %critMult%
if %nulbool% == 1 set testvar=1 && echo Made it to test critDMG %testvar% && pause &&  set /a testvar=%testvar% + 1 
set /a EcurrentHP=%EcurrentHP% - %critDMG%
if %nulbool% == 1 set testvar=1 && echo Made it to test critDMG %testvar% && pause &&  set /a testvar=%testvar% + 1 
exit /b 
