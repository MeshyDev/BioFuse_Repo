set /a enemyFind=%Random% * 6 / 32768 + 1
set /a enemyHS=%RANDOM% * 100 / 32768 + 1

if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Sick
if %enemyHS% == 66 set EhealthStatus=Burning

if %enemyFind%==1 (
set enemy=Wild Boar
set canCast=0
set castLvl=0
set EcurrentHP=85
set EmaxHP=85
set EcurrentEP=0
set EmaxEP=0
set Edmg=30
)
if %enemyFind%==2 (
set enemy=Deer
set canCast=1
set castLvl=1
set EcurrentHP=110
set EmaxHP=110
set EcurrentEP=20
set EmaxEP=20
set Edmg=35
)
if %enemyFind%==3 (
set enemy=Buck
set canCast=1
set castLvl=1
set EcurrentHP=145
set EmaxHP=145
set EcurrentEP=30
set EmaxEP=30
set Edmg=50
)
if %enemyFind%==4 (
set enemy=Mountain Lion
set canCast=1
set castLvl=1
set EcurrentHP=175
set EmaxHP=175
set EcurrentEP=70
set EmaxEP=70
set Edmg=60
)
if %enemyFind%==5 (
set enemy=Rogue Robot
set canCast=1
set castLvl=3
set EcurrentHP=75
set EmaxHP=75
set EcurrentEP=100
set EmaxEP=100
set Edmg=70
)
if %enemyFind%==6 (
set enemy=Wendigo
set canCast=1
set castLvl=2
set EcurrentHP=150
set EmaxHP=150
set EcurrentEP=150
set EmaxEP=150
set Edmg=100
)
set enemyFind=0
exit /b