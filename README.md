# FakeRansomware
Good to use for any malware showcase.<br>

<h2>files will <b>NOT</b> be altered!</h2>


This is just a simulation.<br>
It will look like a ransomware attack, but basically it will just move your files to a backup folder and create some new ransomware-looking files.<br><br>

<h2>How to use it:</h2>
Download FakeRansomware.ps1 to your desktop<br>
open powershell <b>AS ADMIN</b> and run:
```
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JSS0v'))
```


## Install
open powershell <b>AS ADMIN</b> and run:
```
Invoke-WebRequest -uri "https://raw.githubusercontent.com/Andreas6920/WinOptimizer/main/Winoptimizer.ps1" -OutFile "$env:ProgramData\Winoptimizer.ps1" -UseBasicParsing; cls; powershell -ep bypass "$env:ProgramData\Winoptimizer.ps1"
```