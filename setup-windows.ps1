Write-Host "Select user type:"
Write-Host "1) Student"
Write-Host "2) Programmer"
Write-Host "3) Normal User"
$installExtras = $false
$extraTools = @(
    'brave', 'opera', 'microsoft-edge', 'telegram', 'whatsapp', 'slack', 'zoom', 'notion', 'onedrive', 'googledrive',
    'steam', 'epicgameslauncher', 'ccleaner', 'winrar', 'everything', 'revo-uninstaller', 'malwarebytes', 'protonvpn',
    'paint.net', 'obs-studio', 'teams', 'dropbox', 'sharex', 'filezilla', 'putty', 'virtualbox', 'vmware-workstation-player'
)

Write-Host "Do you want to install extra Ghost Toolbox-style apps and tweaks? (y/n)"
$installBrowser = $false
$installEmail = $false

Write-Host "Do you want to install an additional browser (Brave)? (y/n)"
$browserChoice = Read-Host "Enter y or n"
if ($browserChoice -eq 'y') {
    $installBrowser = $true
}

Write-Host "Do you want to install an additional email client (Thunderbird)? (y/n)"
$emailChoice = Read-Host "Enter y or n"
if ($emailChoice -eq 'y') {
    $installEmail = $true
}
$extrasChoice = Read-Host "Enter y or n"
if ($extrasChoice -eq 'y') {
    $installExtras = $true
}
$extraTools = @(
    'brave', 'opera', 'microsoft-edge', 'telegram', 'whatsapp', 'slack', 'zoom', 'notion', 'onedrive', 'googledrive',
    'steam', 'epicgameslauncher', 'ccleaner', 'winrar', 'everything', 'revo-uninstaller', 'malwarebytes', 'protonvpn',
    'paint.net', 'obs-studio', 'teams', 'dropbox', 'sharex', 'filezilla', 'putty', 'virtualbox', 'vmware-workstation-player'
)
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
    if ($installBrowser) { choco install -y brave }
    if ($installEmail) { choco install -y thunderbird }
    if ($installExtras) { choco install -y $extraTools }
    }
    '2' {
        Write-Host "Installing for Programmer..."
    choco install -y git curl vscode docker-desktop python discord nodejs openjdk mysql postgresql mongodb redis sqlite dotnet-sdk visualstudio2022community azure-cli powershell 7zip
    if ($installBrowser) { choco install -y brave }
    if ($installEmail) { choco install -y thunderbird }
    if ($installExtras) { choco install -y $extraTools }
    }
    '3' {
        Write-Host "Installing for Normal User..."
    choco install -y vlc firefox calculator adobereader discord googlechrome spotify transmission gparted htop 7zip
    if ($installBrowser) { choco install -y brave }
    if ($installEmail) { choco install -y thunderbird }
    if ($installExtras) { choco install -y $extraTools }
    }
    default {
        Write-Host "Invalid choice. Exiting."
        exit
    }
}

Write-Host "Setup complete!"
if ($installExtras) {
    Write-Host "Applying system tweaks..."
    # Example tweaks: Enable dark mode, disable telemetry, show file extensions
    try {
        # Enable dark mode
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 0
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value 0
        # Show file extensions
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0
        # Disable telemetry (basic)
        Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 0
        Write-Host "System tweaks applied."
    } catch {
        Write-Host "Some tweaks could not be applied. Run as administrator for best results."
    }
}
