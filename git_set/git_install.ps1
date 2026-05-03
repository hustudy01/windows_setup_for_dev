# Force TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Output "Downloading Git installer..."
$gitInstaller = "$env:TEMP\Git-Setup.exe"
Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.54.0.windows.1/Git-2.54.0-64-bit.exe" -OutFile $gitInstaller

Write-Output "Running Git installer..."
Start-Process -FilePath $gitInstaller -ArgumentList "/VERYSILENT","/NORESTART" -Wait

# Add Git to PATH (User scope)
$gitPath = "C:\Program Files\Git\bin"
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($oldPath -notlike "*$gitPath*") {
    $newPath = "$oldPath;$gitPath"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Output "Git path added to user environment variables."
}

Write-Output "Git installation completed!"
git --version