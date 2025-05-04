set /a enemyFind=%Random% * 5 / 32768 + 1
set /a enemyHS=%RANDOM% * 100 / 32768 + 1

if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Corrupted
if %enemyHS% == 66 set EhealthStatus=Infected

if %enemyFind%==1 (
set enemy=Scraplink
set EcurrentHP=100
set EmaxHP=100
set EcurrentEP=80
set EmaxEP=80
set Edmg=35
)
if %enemyFind%==2 (
set enemy=Scraplink Greater
set EcurrentHP=125
set EmaxHP=125
set EcurrentEP=100
set EmaxEP=100
set Edmg=40
)
if %enemyFind%==3 (
set enemy=Humanoid Robo-Reject
set EcurrentHP=175
set EmaxHP=175
set EcurrentEP=125
set EmaxEP=125
set Edmg=55
)
if %enemyFind%==4 (
set enemy=Humanoid Retail
set EcurrentHP=200
set EmaxHP=200
set EcurrentEP=160
set EmaxEP=160
set Edmg=70
)
if %enemyFind%==5 (
set enemy=Scrapped Government Android
set EcurrentHP=300
set EmaxHP=300
set EcurrentEP=400
set EmaxEP=400
set Edmg=125
)
if %enemyFind%==6 (
set enemy=Goverment Patrol Assembly
set EcurrentHP=500
set EmaxHP=500
set EcurrentEP=1000
set EmaxEP=1000
set Edmg=350
)
set enemyFind=0
exit /b