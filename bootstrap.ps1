Write-Host 'Downloading python'
$url = 'https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe'
$pyExe = "$($env:TEMP)/autopy/pyinstaller.exe"
Invoke-WebRequest -Uri $url -OutFile $pyExe

Write-Host "Running installer"
# https://docs.python.org/3.11/using/windows.html#installing-without-ui
& $pyExe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0