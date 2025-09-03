Write-Host "Select user type:"
Write-Host "1) Student"
Write-Host "2) Programmer"
Write-Host "3) Normal User"
$userType = Read-Host "Enter choice [1-3]"

# Install Chocolatey if not installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Run Windows Update
Write-Host "Running Windows Update..."
Start-Process -FilePath "wuauclt.exe" -ArgumentList "/detectnow /updatenow" -Wait

# Install common drivers and tools
choco install -y 7zip intel-chipset nvidia-display-driver-amd driverbooster

switch ($userType) {
    '1' {
        Write-Host "Installing for Student..."
        choco install -y firefox python vscode adobereader discord gimp inkscape thunderbird anki audacity blender kdenlive shotcut 7zip
    }
    '2' {
        Write-Host "Installing for Programmer..."
        choco install -y git curl vscode docker-desktop python discord nodejs openjdk mysql postgresql mongodb redis sqlite dotnet-sdk visualstudio2022community azure-cli powershell 7zip
    }
    '3' {
        Write-Host "Installing for Normal User..."
        choco install -y vlc firefox calculator adobereader discord googlechrome spotify transmission gparted htop 7zip
    }
    default {
        Write-Host "Invalid choice. Exiting."
        exit
    }
}

Write-Host "Setup complete!"
