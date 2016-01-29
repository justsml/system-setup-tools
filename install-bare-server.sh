#!/bin/bash
# On fresh debian 8 - run this
apt-get update
apt-get install sudo
echo 'deb http://httpredir.debian.org/debian jessie main contrib non-free' > /etc/apt/sources.list
echo 'deb http://httpredir.debian.org/debian jessie-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://security.debian.org jessie/updates main contrib non-free' >> /etc/apt/sources.list
sudo apt-get update && \
  sudo apt-get install -y \
    dbus rlwrap qshutdown vim-nox build-essential \
    libssl-dev zlib1g-dev curl wget checkinstall python-dev \
    devscripts dh-make p7zip-full zip unzip apt-utils g++ flex bison gperf \
    ruby perl python-setuptools libssl-dev git git-core \
    libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 \
    libpng-dev libjpeg-dev libx11-dev libxext-dev \
    ttf-freefont ttf-mscorefonts-installer ttf-bitstream-vera ttf-dejavu ttf-liberation
