set /a enemyFind=%Random% * 101 / 32768 + 1
set /a enemyHS=%RANDOM% * 100 / 32768 + 1
set /a canCastLvl=%RANDOM% * 5 / 32768 + 1
if %enemyFind% GEQ 77 (
if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Presidential-Corruption
if %enemyHS% == 66 set EhealthStatus=Presidential
set enemy=Mr. President
set EhealthStatus=Healthy
set canCast=1
set castLvl=5
set EcurrentHP=45000
set EmaxHP=45000
set EcurrentEP=500
set EmaxEP=500
set Edmg=450
)
if %enemyFind% == 76 (
set enemy=The President
set EhealthStatus=Presidential
set canCast=1
set castLvl=6
set ECurrentHP=150000
set EmaxHP=150000
set EcurrentEP=1000
set EmaxEP=1000
set Edmg=1000
)
if %enemyFind% LEQ 75 (
if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Presidential-Corruption
if %enemyHS% == 66 set EhealthStatus=Presidential
set enemy=Deprecated President
set canCast=1
set castLvl=%canCastLvl%
set EcurrentHP=5000
set EmaxHP=5000
set EcurrentEP=500
set EmaxEP=500
set Edmg=150
)
set enemyFind=0
exit /b