iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) 
choco install -y --params=\"Quiet IgnoreMissingIIS\" dotnetcore-windowshosting
