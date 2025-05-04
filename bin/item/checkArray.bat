:: weaponzero
:: weaponone
:: weapontwo
:: weaponthree
:: weaponfour
:: weaponarray
:: weaponname
:: weapondmg
:: weaponmod 

if %weaponarray% == 0 (if %weaponzero% == 1 (set weaponname=Fists && set weapondmg=0) else (set weaponarray=0 && set weaponzero=1 && set weaponname=Fists && set weapondmg=0 && echo How you don't have fists is beyond us, but here's a pair on the house. && pause && cls && exit /b))
if %weaponarray% == 1 (if %weaponone% == 1 (set weaponname=Dagger && set weapondmg=5 && echo You grab the dagger.) else (set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && echo You go to grab your dagger, but it was never there. && pause && exit /b))
if %weaponarray% == 2 (if %weapontwo% == 1 (set weaponname=Sword && set weapondmg=10 && echo You grab your sword.) else (set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && echo A simple jaunt over to the swordrack shows you have no swords. && pause && exit /b))
if %weaponarray% == 3 (if %weaponthree% == 1 (set weaponname=Flame Sword && set weapondmg=15 && set weaponmod=Flame && echo You grab your FLAME sword.) else (set weaponarray=0 && set weaponmod=Nothing && set weaponname=Fists && set weapondmg=0 && echo It would've burned your swordrack. It's not there. && pause && exit /b))
if %weaponarray% == 4 (if %weaponfour% == 1 (set weaponname=Rocket Launcher && set weapondmg=35 && echo A whole damn rocket launcher.) else (set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && echo Pft, they wouldn't let you buy a rocket launcher... right? && pause && exit /b))
if %weaponarray% == 5 (if %weaponfive% == 1 (set weaponname=Death Machine && set weapondmg=65 && echo A weapon from retired ninja scout.) else (set weaponarray=0 && set weaponname=Fists && set weapondmg=2 && echo You go to grab Death Machine but... a fast blue man came and took it. && pause && exit /b))
if %weaponarray% == 6 (if %weaponsix% == 1 (set weaponname=Bot Buster && set weapondmg=115 && echo It's a freakin' cannon.) else (set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && echo It appears... it's not there. WHERES MY CANNON? && pause && exit /b))
if %weaponarray% == 7 (if %weaponseven% == 1 (set weaponname=Portable Death Laser && set weapondmg=750 && set weaponmod=Flame && echo A military grade portable death laser.) else (set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && echo Psh, yeah you wish! Like the government would ever let you have that && pause && exit /b))
exit /b