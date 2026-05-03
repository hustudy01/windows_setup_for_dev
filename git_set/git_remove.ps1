Write-Output "Searching for Git uninstall program..."

# Possible uninstall paths
$gitUninstallPaths = @(
    "C:\Program Files\Git\unins000.exe",
    "C:\Program Files\Git\uninstall.exe"
)

$found = $false
foreach ($path in $gitUninstallPaths) {
    if (Test-Path $path) {
        Write-Output "Running Git uninstaller at $path ..."
        Start-Process -FilePath $path -ArgumentList "/VERYSILENT","/NORESTART" -Wait
        $found = $true
        break
    }
}

if (-not $found) {
    Write-Output "No Git uninstaller found. Git may not be installed."
} else {
    Write-Output "Git has been removed successfully."

    # Remove Git path from user environment variables
    $gitPath = "C:\Program Files\Git\bin"
    $oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $newPath = ($oldPath.Split(";") | Where-Object { $_ -ne $gitPath }) -join ";"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Output "Git path removed from user environment variables."
}