:: Lightly now...

if %resetSwitch% == 1 (
    if %weaponone% == 1 (echo Shopkeep: Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 150 (echo Shopkeep: You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 150 && set weaponone=1 && echo Shopkeep: Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 2 (
    if %weapontwo% == 1 (echo Shopkeep: Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 550 (echo Shopkeep: ou cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 550 && set weapontwo=1 && echo Shopkeep: Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 3 (
    if %weaponthree% == 1 (echo Shopkeep: Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 1500 (echo Shopkeep: You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 1500 && set weaponthree=1 && echo Shopkeep: Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 4 (
    if %weaponfour% == 1 (echo Shopkeep: Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 5000 (echo Shopkeep: You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 5000 && set weaponfour=1 && echo Shopkeep: Purchase successful. && pause && set resetSwitch=0 &&  exit /b))
)

if %resetSwitch% == 5 (
    if %Nodes% LSS 25 (echo Shopkeep: You cannot afford that item! Brokeass. && set resetSwitch=0 && pause && exit /b) else (set /a Nodes=%Nodes% - 25 && set /a hppot=%hppot% + 1 && echo Shopkeep: Purchase successful. && set resetSwitch=0 && pause && exit /b)
)

if %resetSwitch% == 6 (
    if %Nodes% LSS 50 (echo Shopkeep: You cannot afford that item! && set resetSwitch=0 && pause && exit /b) else (set /a Nodes=%Nodes% - 50 && set /a eppot=%eppot% + 1 && echo Shopkeep: Purchase successful. && set resetSwitch=0 && pause && exit /b)
)

if %resetSwitch% == 7 (
    if %weaponfive% == 1 (echo Shopkeep: Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 10000 (echo Shopkeep: You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 10000 && set weaponfive=1 && echo Shopkeep: Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 8 (
    if %weaponsix% == 1 (echo Shopkeep: Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 45000 (echo Shopkeep: You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 45000 && set weaponsix=1 && echo Shopkeep: Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 9 (
    if %weaponseven% == 1 (echo Shopkeep: Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 750000 (echo Shopkeep: You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 750000 && set weaponseven=1 && echo Shopkeep: Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 10 (
    if %weaponeight% == 1 (echo Shopkeep: Sorry, you can only have ONE God Finger. Company policy. && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 1000000 (echo Shopkeep: You cannot afford that item! I mean, it's a MILLION Nodes, what were you expecting? && pause && if "%lbnam%" == "TheLoof" goto SPECIALFORYOU && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 1000000 && set weaponeight=1 && echo You've torn off Gods Finger. && pause && set resetSwitch=0 && exit /b))
)

:: Imbue weapons

if %resetSwitch% == 11 (
    if %nodes% LSS 1000 (echo Shopkeep: Like I said! It's a new service, you gotta pay the fee IN FULL! && pause && set resetSwitch=0 && exit /b) else (set /a nodes=%nodes%-1000 && set weaponmod=Flame && echo Your weapon glows with a fiery hue! && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 12 (
    if %nodes% LSS 1000 (echo Shopkeep: Like I said! It's a new service, you gotta pay the fee IN FULL! && pause && set resetSwitch=0 && exit /b) else (set /a nodes=%nodes%-1000 && set weaponmod=Sickness && echo Your weapon radiates a sickly hue, gross. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 13 (
    if %nodes% LSS 1000 (echo Shopkeep: Like I said! It's a new service, you gotta pay the fee IN FULL! && pause && set resetSwitch=0 && exit /b) else (set /a nodes=%nodes%-1000 && set weaponmod=Corruption && echo Your weapon spazzes out, leaving the Shopkeep puzzled. && echo With a frown, he hands it to you. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 14 (
    if %nodes% LSS 1000 (echo Shopkeep: Like I said! It's a new service, you gotta pay the fee IN FULL! && pause && set resetSwitch=0 && exit /b) else (set /a nodes=%nodes%-1000 && set weaponmod=Infection && echo Your weapon oozes with... intent. There's something seriously wrong with this. && pause && echo Shopkeep: Yeah, I dunno about this one %lbnam%... && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 15 (
    if %nodes% LSS 1000 (echo Shopkeep: Dude, you got the Finger. How can you not afford this?? && pause && set resetSwitch=0 && exit /b) else (set /a nodes=%nodes%-1000 && set weaponmod=Finger && echo Your weapon glows with a warm hue. Big Finger Energy. && pause && set resetSwitch=0 && exit /b))
)

:: adds Greater HP/EP pots

if %resetSwitch% == 16 (
    if %Nodes% LSS 750 (echo Shopkeep: You cannot afford that item! && set resetSwitch=0 && pause && exit /b) else (set /a Nodes=%Nodes% - 750 && set /a geppot=%geppot% + 1 && echo Shopkeep: Purchase successful. && set resetSwitch=0 && pause && exit /b)
)

if %resetSwitch% == 17 (
    if %Nodes% LSS 500 (echo Shopkeep: You cannot afford that item! && set resetSwitch=0 && pause && exit /b) else (set /a Nodes=%Nodes% - 500 && set /a ghppot=%ghppot% + 1 && echo Shopkeep: Purchase successful. && set resetSwitch=0 && pause && exit /b)
)

exit /b
:: I would like to point out that I wasn't expecting it to work so well.

:SPECIALFORYOU
cls
echo Shopkeep: WAAAAIT! I have a note here saying to just... GIVE you one.
ping localhost -n 6 >nul
echo Shopkeep: Listen, I don't listen to just ANYBODY... but this is The Guy.
ping localhost -n 6 >nul
echo Shopkeep: Yknow... Uncle? Consider yourself special. Enjoy your finger.
ping localhost -n 6 >nul
echo *sounds of ripping flesh...*
set weaponeight=1
set weaponname=Gods Finger
:: Boosted God Finger.
set weapondmg=5500
echo Shopkeep: Huh... this one is... special.
set weaponmod=Finger
set weaponarray=8
ping localhost -n 3 >nul
echo Shopkeep: Uncle also said not to let it go or it loses its power. Good luck.
echo You now have Gods Finger.
pause
set resetSwitch=0
exit /b
