Write-Output "Searching for Python uninstall program..."
$pyUninstall = "C:\Users\$env:USERNAME\AppData\Local\Programs\Python\Python312\uninstall.exe"

if (Test-Path $pyUninstall) {
    Write-Output "Running Python uninstaller..."
    Start-Process -FilePath $pyUninstall -ArgumentList "/quiet" -Wait
    Write-Output "Python has been removed successfully."

    # Remove Python path from user environment variables
    $pyPath = "C:\Users\$env:USERNAME\AppData\Local\Programs\Python\Python312"
    $oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $newPath = ($oldPath.Split(";") | Where-Object { $_ -notlike "$pyPath*" }) -join ";"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Output "Python path removed from user environment variables."
} else {
    Write-Output "Python uninstall file not found. Python may not be installed."
}

Write-Output "Searching for Miniconda uninstall program..."
$condaUninstall = "$env:LOCALAPPDATA\Miniconda3\Uninstall-Miniconda3.exe"

if (Test-Path $condaUninstall) {
    Write-Output "Running Miniconda uninstaller..."
    Start-Process -FilePath $condaUninstall -ArgumentList "/S" -Wait
    Write-Output "Miniconda has been removed successfully."

    # Remove Miniconda path from user environment variables
    $condaPath = "$env:LOCALAPPDATA\Miniconda3"
    $oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $newPath = ($oldPath.Split(";") | Where-Object { $_ -notlike "$condaPath*" }) -join ";"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Output "Miniconda path removed from user environment variables."
} else {
    Write-Output "Miniconda uninstall file not found. Miniconda may not be installed."
}