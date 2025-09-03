#!/bin/bash

echo "Select user type:"
echo "1) Student"
echo "2) Programmer"
echo "3) Normal User"
read -p "Enter choice [1-3]: " usertype

# Prompt for extra browser and email client
read -p "Do you want to install an additional browser (Brave)? [y/n]: " install_browser
read -p "Do you want to install an additional email client (Thunderbird)? [y/n]: " install_email

# Prompt for Ghost Toolbox-style extras
read -p "Do you want to install extra Ghost Toolbox-style apps and tweaks? [y/n]: " install_extras

EXTRA_APPS="brave-browser telegram-desktop slack zoom notion steam ccleaner winrar filezilla virtualbox obs-studio dropbox sharex putty revo-uninstaller protonvpn gnome-tweaks"

sudo apt update && sudo apt upgrade -y && sudo apt install -y linux-firmware clamav ufw unattended-upgrades

case $usertype in
    1)
        echo "Installing for Student..."
    sudo apt install -y libreoffice evince firefox python3 python3-pip code okular gimp inkscape discord anki audacity blender kdenlive shotcut clamav ufw unattended-upgrades
    [ "$install_browser" = "y" ] && sudo apt install -y brave-browser
    [ "$install_email" = "y" ] && sudo apt install -y thunderbird
    [ "$install_extras" = "y" ] && sudo apt install -y $EXTRA_APPS
        ;;
    2)
        echo "Installing for Programmer..."
    sudo apt install -y git curl wget vim code docker.io build-essential python3 python3-pip nodejs npm openjdk-11-jdk discord mysql-server postgresql postgresql-contrib mongodb redis-server sqlite3 dotnet-sdk azure-cli powershell clamav ufw unattended-upgrades
    [ "$install_browser" = "y" ] && sudo apt install -y brave-browser
    [ "$install_email" = "y" ] && sudo apt install -y thunderbird
    [ "$install_extras" = "y" ] && sudo apt install -y $EXTRA_APPS
        ;;
    3)
        echo "Installing for Normal User..."
    sudo apt install -y vlc gnome-calculator firefox okular chromium-browser discord spotify-client transmission gparted htop neofetch clamav ufw unattended-upgrades
    [ "$install_browser" = "y" ] && sudo apt install -y brave-browser
    [ "$install_email" = "y" ] && sudo apt install -y thunderbird
    [ "$install_extras" = "y" ] && sudo apt install -y $EXTRA_APPS
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Setup complete!"
if [ "$install_extras" = "y" ]; then
    echo "Applying system tweaks..."
    # Example tweaks: Enable dark mode (GNOME), show hidden files, disable telemetry (where possible)
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark" 2>/dev/null
    gsettings set org.gnome.nautilus.preferences show-hidden-files true 2>/dev/null
    echo "System tweaks applied."
fi
