set /a enemyFind=%Random% * 7 / 32768 + 1
set /a enemyHS=%RANDOM% * 100 / 32768 + 1

if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Corrupted
if %enemyHS% == 66 set EhealthStatus=Infected

if %enemyFind%==1 (
set enemy=Generic Railyard Android
set EcurrentHP=100
set EmaxHP=100
set EcurrentEP=70
set EmaxEP=70
set Edmg=50
)
if %enemyFind%==2 (
set enemy=Generic Railyard Android
set EcurrentHP=130
set EmaxHP=130
set EcurrentEP=100
set EmaxEP=100
set Edmg=60
)
if %enemyFind%==3 (
set enemy=Specialized Railyard Repairbot
set EcurrentHP=150
set EmaxHP=150
set EcurrentEP=500
set EmaxEP=500
set Edmg=70
)
if %enemyFind%==4 (
set enemy=Enhanced Railyard Repairbot
set EcurrentHP=180
set EmaxHP=180
set EcurrentEP=500
set EmaxEP=500
set Edmg=100
)
if %enemyFind%==5 (
set enemy=Pristine Government Android
set EcurrentHP=500
set EmaxHP=500
set EcurrentEP=1000
set EmaxEP=1000
set Edmg=200
)
if %enemyFind%==6 (
set enemy=Military Goverment Patrol Assembly
set EcurrentHP=4500
set EmaxHP=4500
set EcurrentEP=10000
set EmaxEP=10000
set Edmg=300
)
if %enemyFind%==7 (
set enemy=Car Frame
set ECurrentHP=45000
set EmaxHP=45000
set EcurrentEP=0
set EmaxEP=0
set Edmg=0
)
set enemyFind=0
exit /b