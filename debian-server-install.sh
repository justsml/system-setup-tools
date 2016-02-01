#!/bin/bash
# On fresh debian 8 - run this
apt-get update
apt-get install -y sudo curl
echo 'deb http://httpredir.debian.org/debian jessie main contrib non-free' > /etc/apt/sources.list
echo 'deb http://httpredir.debian.org/debian jessie-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://security.debian.org jessie/updates main contrib non-free' >> /etc/apt/sources.list
sudo apt-get update && \
  sudo apt-get install -y \
    ufw fail2ban dbus rlwrap qshutdown vim-nox build-essential \
    libssl-dev zlib1g-dev curl wget checkinstall python-dev \
    devscripts dh-make p7zip-full zip unzip apt-utils g++ flex bison gperf \
    ruby perl python-setuptools python-pip libssl-dev git git-core \
    libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 \
    libpng-dev libjpeg-dev libx11-dev libxext-dev \
    ttf-freefont ttf-mscorefonts-installer ttf-bitstream-vera ttf-dejavu ttf-liberation

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
