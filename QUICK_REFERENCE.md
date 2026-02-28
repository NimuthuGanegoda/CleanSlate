# Quick Reference: Device Reset/New Setup Checklist

## Before Reset or New Device Purchase

### 📋 Application Inventory
- [ ] List all installed applications and their versions
- [ ] Document license keys and activation information
- [ ] Note custom configurations and settings
- [ ] Identify critical tools and their download sources
- [ ] Export browser bookmarks and saved passwords

### 💾 Data Backup
- [ ] Backup important files to cloud storage
- [ ] Export application configurations
- [ ] Save custom themes, plugins, and extensions
- [ ] Backup development environment settings
- [ ] Create external storage backup of large files

### 🔑 Account Information
- [ ] Document software licenses and accounts
- [ ] Ensure cloud account access (passwords/2FA)
- [ ] Note subscription services and their login details
- [ ] Backup SSH keys and certificates
- [ ] Save API keys and development credentials

### 📱 Device-Specific Preparations
#### Windows
- [ ] Export Windows features list
- [ ] Create Chocolatey/Winget package list
- [ ] Backup Windows activation key

#### macOS
- [ ] Create Time Machine backup
- [ ] Export Homebrew package list
- [ ] Ensure iCloud backup is current

#### Linux
- [ ] Export package manager selections
- [ ] Backup dotfiles (.bashrc, .vimrc, etc.)
- [ ] Document installed repositories

## During Reset/Setup

### 🔧 Initial Setup
- [ ] Install operating system updates
- [ ] Set up internet connection
- [ ] Configure basic system settings
- [ ] Install essential security software

### ☁️ Account Setup
- [ ] Sign into cloud accounts (Google, Microsoft, Apple)
- [ ] Enable automatic sync services
- [ ] Restore backed-up files from cloud storage
- [ ] Set up email accounts and calendars

## After Reset/New Device Setup

### 🚀 Priority 1: Essential Applications
- [ ] Web browser (Chrome, Firefox, Safari, Edge)
- [ ] Communication tools (email client, messaging apps)
- [ ] Productivity suite (Office, Google Workspace)
- [ ] Security software (antivirus, VPN)
- [ ] File manager/compression tools

### 🛠️ Priority 2: Work/Development Tools
- [ ] Code editors/IDEs
- [ ] Version control tools (Git)
- [ ] Development frameworks and runtimes
- [ ] Database tools and clients
- [ ] Testing and debugging tools

### 🎨 Priority 3: Specialized Applications
- [ ] Creative software (Photoshop, video editors)
- [ ] Gaming platforms (Steam, Epic Games)
- [ ] Media players and codecs
- [ ] Specialty industry tools
- [ ] Entertainment applications

### ⚙️ Configuration Restoration
- [ ] Import browser bookmarks and settings
- [ ] Restore application preferences
- [ ] Set up custom keyboard shortcuts
- [ ] Configure development environments
- [ ] Apply custom themes and visual preferences

### 🔍 Verification
- [ ] Test all critical applications
- [ ] Verify file associations
- [ ] Check network connectivity for all apps
- [ ] Confirm license activations
- [ ] Test backup and sync functionality

## Common Applications and Their Persistence

| Application Type | Lost on Reset? | Recovery Method |
|------------------|----------------|-----------------|
| Web browsers | Yes | Re-download + import bookmarks |
| Microsoft Office | Yes | Re-install with license |
| Adobe Creative Suite | Yes | Re-install with account |
| Steam games | Yes | Re-install Steam + games |
| Development tools | Yes | Re-install + restore configs |
| Cloud storage apps | Yes | Re-install + sign in |
| Media players | Yes | Re-install + import libraries |
| Mobile apps | Depends | App store + account restore |

## Platform-Specific Quick Commands

### Windows PowerShell
```powershell
# List installed programs
Get-WmiObject -Class Win32_Product | Select-Object Name, Version

# Export with Winget
winget export -o apps.json

# Import with Winget
winget import -i apps.json
```

### macOS Terminal
```bash
# Export Homebrew packages
brew bundle dump

# Restore Homebrew packages
brew bundle install
```

### Linux Terminal
```bash
# Export installed packages (Ubuntu/Debian)
dpkg --get-selections > packages.list

# Restore packages
sudo dpkg --set-selections < packages.list
sudo apt-get dselect-upgrade
```

## Emergency Contact List

### License Recovery
- [ ] Software vendor support contacts
- [ ] Organization IT department
- [ ] License management system access
- [ ] Purchase receipt locations

### Technical Support
- [ ] Internet service provider
- [ ] Device manufacturer support
- [ ] IT support contacts
- [ ] Local computer repair services

## Time Estimates

| Setup Type | Estimated Time |
|------------|----------------|
| Basic user setup | 2-4 hours |
| Power user setup | 4-8 hours |
| Developer workstation | 6-12 hours |
| Creative professional | 8-16 hours |
| Enterprise setup | 1-3 days |

## Pro Tips

💡 **Use package managers** - They make reinstallation much faster
💡 **Cloud-first approach** - Prefer cloud-based alternatives when possible
💡 **Regular backups** - Don't wait until you need to reset
💡 **Document everything** - Your future self will thank you
💡 **Test your backups** - Ensure they work before you need them

---

**Remember**: The answer to "will my applications be gone?" is generally **YES**, but with proper preparation, recovery can be quick and painless!