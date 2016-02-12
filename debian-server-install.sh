#!/bin/bash
# On fresh debian 8 - run this
apt-get update
apt-get install -y sudo curl
echo 'deb http://httpredir.debian.org/debian jessie main contrib non-free' > /etc/apt/sources.list
echo 'deb http://httpredir.debian.org/debian jessie-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://security.debian.org jessie/updates main contrib non-free' >> /etc/apt/sources.list
sudo apt-get update
#Security stuff
sudo apt-get install -y ufw fail2ban unhide
# My misc essentials
sudo apt-get install -y dbus rlwrap qshutdown vim-nox build-essential p7zip-full zip unzip wget
# Lang+Dev Pkgs
sudo apt-get install -y python-dev ruby perl python-setuptools python-pip
# Assorted Dev Stuff
sudo apt-get install -y git g++ automake devscripts dh-make checkinstall libssl-dev zlib1g-dev \
    apt-utils flex bison gperf libssl-dev \
    libsqlite3-dev libpng-dev libjpeg-dev libx11-dev libxext-dev
# Misc fonts (non-free in list)
sudo apt-get install -y \
  ttf-mscorefonts-installer libfontconfig1-dev libicu-dev libfreetype6 \
  ttf-freefont ttf-bitstream-vera ttf-dejavu ttf-liberation

sleep 2s

# Install VI Prefs - Recommended - Optional
curl -o- https://raw.githubusercontent.com/justsml/system-setup-tools/master/modules/vim-update.sh | sudo bash

sleep 2s

# Backup Profile init scripts before appending new scripts below
mkdir ~/backups
cp ~/.bash* ~/backups/
# Debian/BSD:  Append Shell Environment Shortcuts + XTERM Colors
curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bashrc > ~/.bashrc
curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases > ~/.bash_aliases
# Read into current shell (login steps already missed the aliases file)
source ~/.bashrc

sleep 5s

echo Completing System Upgrade
sudo apt-get dist-upgrade -y 
echo Completed System Upgrade
