set /a enemyFind=%Random% * 6 / 32768 + 1
set /a enemyHS=%RANDOM% * 100 / 32768 + 1

if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Sick
if %enemyHS% == 66 set EhealthStatus=Burning

if %enemyFind%==1 (
set enemy=Hare
set EcurrentHP=40
set EmaxHP=40
set EcurrentEP=30
set EmaxEP=30
set Edmg=8
)
if %enemyFind%==2 (
set enemy=Woodpecker
set EcurrentHP=25
set EmaxHP=25
set EcurrentEP=20
set EmaxEP=20
set Edmg=8
)
if %enemyFind%==3 (
set enemy=Small Beaver
set EcurrentHP=45
set EmaxHP=45
set EcurrentEP=30
set EmaxEP=30
set Edmg=10
)
if %enemyFind%==4 (
set enemy=Beaver
set EcurrentHP=65
set EmaxHP=65
set EcurrentEP=70
set EmaxEP=70
set Edmg=13
)
if %enemyFind%==5 (
set enemy=Moose
set EcurrentHP=75
set EmaxHP=75
set EcurrentEP=100
set EmaxEP=100
set Edmg=18
)
if %enemyFind%==6 (
set enemy=Bear
set EcurrentHP=150
set EmaxHP=150
set EcurrentEP=150
set EmaxEP=150
set Edmg=14
)
set enemyFind=0
exit /b