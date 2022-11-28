Write-Host 'Downloading python'
$url = 'https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe'
$pyExe = "$($env:TEMP)/autopy/pyinstaller.exe"
if (Test-Path $pyExe) {
    Write-Host "PyInstaller likely already present"
} else {
    Invoke-WebRequest -Uri $url -OutFile $pyExe
}

Write-Host "Running installer"
# https://docs.python.org/3.11/using/windows.html#installing-without-ui
& $pyExe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to install python"
    exit(1)
}

Write-Host "Installing required pip packages"
& python -m pip install selenium
& python -m pip install webdriver-manager