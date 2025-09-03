#!/bin/bash

echo "Select user type:"
echo "1) Student"
echo "2) Programmer"
echo "3) Normal User"
read -p "Enter choice [1-3]: " usertype

sudo apt update && sudo apt upgrade -y && sudo apt install -y linux-firmware clamav ufw unattended-upgrades

case $usertype in
    1)
        echo "Installing for Student..."
        sudo apt install -y libreoffice evince firefox python3 python3-pip code okular gimp inkscape thunderbird discord anki audacity blender kdenlive shotcut clamav ufw unattended-upgrades
        ;;
    2)
        echo "Installing for Programmer..."
        sudo apt install -y git curl wget vim code docker.io build-essential python3 python3-pip nodejs npm openjdk-11-jdk discord mysql-server postgresql postgresql-contrib mongodb redis-server sqlite3 dotnet-sdk azure-cli powershell clamav ufw unattended-upgrades
        ;;
    3)
        echo "Installing for Normal User..."
        sudo apt install -y vlc gnome-calculator firefox okular chromium-browser discord spotify-client transmission gparted htop neofetch clamav ufw unattended-upgrades
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Setup complete!"
