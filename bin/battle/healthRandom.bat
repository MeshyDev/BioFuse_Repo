:: This should only be called! This is a subroutine, not a fully accessible block. 
set /a randomSickcnce=%random% * 20 / 32768 + 1
set /a randomBurncnce=%random% * 150 / 32768 + 1 
set /a randomBurncnce2=%random% * 150 / 32768 + 1

if %nulbool% == 1 set testvar=1 && echo Made it to test, random HP %testvar% && pause &&  set /a testvar=%testvar% + 1 
if %EhealthStatus% == Sick (
if %randomSickcnce% == 13 echo %enemy% snarls and spits, its sickness poisoning you! && echo. && echo You are now sick! && set healthStatus=Sick
)
if %nulbool% == 1 set testvar=1 && echo Made it to test, RHP, %randomSickcnce% %testvar% && pause &&  set /a testvar=%testvar% + 1 

if %EhealthStatus% == Burning (
if %randomBurncnce% == %randomBurncnce2% echo %enemy% latches onto you! It's burning flames have set you on fire! && echo. && echo You are now burning! && set healthStatus=Burning
)
if %nulbool% == 1 set testvar=1 && echo Made it to test, RHP success, %randomBurncnce% %randomBurncnce2% %testvar% && pause &&  set /a testvar=%testvar% + 1 
exit /b