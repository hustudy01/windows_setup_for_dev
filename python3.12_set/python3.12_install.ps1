# Force TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Output "Downloading Python 3.12 installer..."
$pythonInstaller = "$env:TEMP\Python-Setup.exe"
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe" -OutFile $pythonInstaller

Write-Output "Running Python installer..."
Start-Process -FilePath $pythonInstaller -ArgumentList "/quiet","InstallAllUsers=0","PrependPath=1" -Wait

# Add Python to PATH (User scope)
$pythonPath = "C:\Users\$env:USERNAME\AppData\Local\Programs\Python\Python312"
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($oldPath -notlike "*$pythonPath*") {
    $newPath = "$oldPath;$pythonPath;$pythonPath\Scripts"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Output "Python path added to user environment variables."
}

Write-Output "Python installation completed!"
python --version

Write-Output "Downloading Miniconda installer..."
$condaInstaller = "$env:TEMP\Miniconda-Setup.exe"
Invoke-WebRequest -Uri "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe" -OutFile $condaInstaller

Write-Output "Running Miniconda installer..."
# Force installation to ASCII-only path
Start-Process -FilePath $condaInstaller -ArgumentList "/S","/D=C:\Miniconda3" -Wait

# Add Miniconda to PATH (User scope)
$condaPath = "C:\Miniconda3"
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($oldPath -notlike "*$condaPath*") {
    $newPath = "$oldPath;$condaPath;$condaPath\Scripts;$condaPath\Library\bin"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Output "Miniconda path added to user environment variables."
}

Write-Output "Miniconda installation completed!"
conda --version

# Accept Conda Terms of Service automatically
Write-Output "Accepting Conda Terms of Service..."
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/msys2

Write-Output "Installing Jupyter Notebook..."
conda install -y notebook
Write-Output "Jupyter Notebook installation completed!"
jupyter --version