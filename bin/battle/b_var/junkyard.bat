set /a enemyFind=%Random% * 7 / 32768 + 1
set /a enemyHS=%RANDOM% * 100 / 32768 + 1

if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Corrupted
if %enemyHS% == 66 set EhealthStatus=Infected

if %enemyFind%==1 (
set enemy=Scraplink
set canCast=1
set castLvl=2
set EcurrentHP=100
set EmaxHP=100
set EcurrentEP=80
set EmaxEP=80
set Edmg=35
)
if %enemyFind%==2 (
set enemy=Scraplink Greater
set canCast=1
set castLvl=2
set EcurrentHP=125
set EmaxHP=125
set EcurrentEP=100
set EmaxEP=100
set Edmg=40
)
if %enemyFind%==3 (
set enemy=Humanoid Robo-Reject
set canCast=1
set castLvl=3
set EcurrentHP=175
set EmaxHP=175
set EcurrentEP=125
set EmaxEP=125
set Edmg=55
)
if %enemyFind%==4 (
set enemy=Humanoid Retail
set canCast=1
set castLvl=3
set EcurrentHP=200
set EmaxHP=200
set EcurrentEP=160
set EmaxEP=160
set Edmg=55
)
if %enemyFind%==5 (
set enemy=Scrapped Government Android
set canCast=1
set castLvl=3
set EcurrentHP=250
set EmaxHP=250
set EcurrentEP=400
set EmaxEP=400
set Edmg=75
)
if %enemyFind%==6 (
set enemy=Goverment Patrol Assembly
set canCast=1
set castLvl=4
set EcurrentHP=500
set EmaxHP=500
set EcurrentEP=1000
set EmaxEP=1000
set Edmg=350
)
if %enemyFind%==7 (
set enemy=Car Frame
set canCast=0
set castLvl=0
set ECurrentHP=45000
set EmaxHP=45000
set EcurrentEP=0
set EmaxEP=0
set Edmg=0
)
set enemyFind=0
exit /b