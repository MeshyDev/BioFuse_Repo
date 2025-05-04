set /a enemyFind=%RANDOM% * 5 / 32768 + 1
set /a enemyHS=%RANDOM% * 100 / 32768 + 1

if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Sick
if %enemyHS% == 66 set EhealthStatus=Burning

if %enemyFind%==1 (
set enemy=Squirrel
set EcurrentHP=20
set EmaxHP=20
set EcurrentEP=10
set EmaxEP=10
set Edmg=5
)
if %enemyFind%==2 (
set enemy=Rabbit
set EcurrentHP=25
set EmaxHP=25
set EcurrentEP=30
set EmaxEP=30
set Edmg=7
)
if %enemyFind%==3 (
set enemy=Stray Cat
set EcurrentHP=40
set EmaxHP=40
set EcurrentEP=60
set EmaxEP=60
set Edmg=9
)
if %enemyFind%==4 (
set enemy=Duck
set EcurrentHP=50
set EmaxHP=50
set EcurrentEP=70
set EmaxEP=70
set Edmg=11
)
if %enemyFind%==5 (
set enemy=Stray Dog
set EcurrentHP=50
set EmaxHP=50
set EcurrentEP=40
set EmaxEP=40
set Edmg=9
)
if %enemyFind%==6 (
set enemy=BlotBlot ###RARE###
set EcurrentHP=100
set EmaxHP=100
set EcurrentEP=100
set EmaxEP=100
set Edmg=20
)
set enemyFind=0
exit /b

