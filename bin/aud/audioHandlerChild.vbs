Set Sound = CreateObject("WMPlayer.OCX.7")
Sound.URL = "bin/aud/null.mp3"
Sound.Controls.play
Sound.Settings.Volume = 30
do while Sound.currentmedia.duration = 0
wscript.sleep 100
loop
wscript.sleep (int(Sound.currentmedia.duration)+1)*1000
