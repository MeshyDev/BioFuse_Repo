:: This should only be called! This is a subroutine, not a fully accessible block.
set /a scalingfactor=2+((%level%-30)/3)
if %nulbool%==1 echo Scaling factor is %scalingfactor%
set /a EmaxHP=%EmaxHP%*%scalingfactor%
set /a EmaxEP=%EmaxEP%*%scalingfactor%
set /a EcurrentHP=%EmaxHP%
set /a EcurrentEP=%EmaxEP%
if %EhealthStatus%==Corrupted exit /b
if %EhealthStatus%==Infected exit /b
if %EhealthStatus%==Sick exit /b
set EhealthStatus=Enraged
if "%enemy%" == "The President" set EhealthStatus=Presidential
if "%enemy%" == "Mr. President" set EhealthStatus=Healthy
if %nulbool% == 1 set testvar=1 && echo Made it to scaling! Scaling is %scalingfactor%... %testvar% && pause &&  set /a testvar=%testvar% + 1 
exit /b