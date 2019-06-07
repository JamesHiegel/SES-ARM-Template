Add-WindowsFeature Web-Server, Web-Basic-Auth, Web-Windows-Auth, Web-Mgmt-Console
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; &([scriptblock]::Create((Invoke-WebRequest -useb 'https://dot.net/v1/dotnet-install.ps1'))) -InstallDir 'C:\Program Files\dotnet'
net stop was /y
net start w3svc
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; &iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
cinst -y --params="Quiet IgnoreMissingIIS" dotnetcore-windowshosting
$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newpath = "$oldpath;C:\Program Files\dotnet"
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath
Restart-Computer
