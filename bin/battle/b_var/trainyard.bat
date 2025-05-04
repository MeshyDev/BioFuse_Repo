set /a enemyFind=%Random% * 6 / 32768 + 1
set /a enemyHS=%RANDOM% * 100 / 32768 + 1

if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Corrupted
if %enemyHS% == 66 set EhealthStatus=Infected

if %enemyFind%==1 (
set enemy=Generic Railyard Android
set canCast=0
set castLvl=0
set EcurrentHP=100
set EmaxHP=100
set EcurrentEP=70
set EmaxEP=70
set Edmg=50
)
if %enemyFind%==2 (
set enemy=Generic Railyard Android
set canCast=0
set castLvl=0
set EcurrentHP=130
set EmaxHP=130
set EcurrentEP=100
set EmaxEP=100
set Edmg=60
)
if %enemyFind%==3 (
set enemy=Specialized Railyard Repairbot
set canCast=0
set castLvl=0
set EcurrentHP=150
set EmaxHP=150
set EcurrentEP=500
set EmaxEP=500
set Edmg=70
)
if %enemyFind%==4 (
set enemy=Enhanced Railyard Repairbot
set canCast=1
set castLvl=2
set EcurrentHP=180
set EmaxHP=180
set EcurrentEP=500
set EmaxEP=500
set Edmg=100
)
if %enemyFind%==5 (
set enemy=Pristine Government Android
set canCast=1
set castLvl=3
set EcurrentHP=500
set EmaxHP=500
set EcurrentEP=1000
set EmaxEP=1000
set Edmg=200
)
if %enemyFind%==6 (
set enemy=Military Government Patrol Assembly
set canCast=1
set castLvl=5
set EcurrentHP=4500
set EmaxHP=4500
set EcurrentEP=10000
set EmaxEP=10000
set Edmg=300
)

set enemyFind=0
exit /b