#!/bin/bash


# Performance profiling
sudo apt-get update && \
  apt-get install -y collectl



# Redis Setup
sudo apt-get update && \
  apt-get install -y redis-server


# MariaDB/mySql
sudo apt-get update && \
  apt-get install -y mariadb-server

sudo /usr/bin/mysql_secure_installation

# Java, if needed
# sudo apt-get update && \
#  apt-get install -y openjdk-7-jdk openjdk-7-jre icedtea-7-plugin


if [[ $(cat /etc/sysctl.conf | grep max_user_watches) == "" ]]; then
  printf "NOTICE: Patching sysctl.conf ...\n"
  sudo sh -c 'echo fs.inotify.max_user_watches=1048576 >> /etc/sysctl.conf'
else
  printf "Info: sysctl already patched.\n"
fi


# Add Repos For debian 8 / jessie
echo 'deb http://httpredir.debian.org/debian jessie main contrib non-free' > /etc/apt/sources.list
echo 'deb http://httpredir.debian.org/debian jessie-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://security.debian.org jessie/updates main contrib non-free' >> /etc/apt/sources.list


#	Debian8 PhantomJS Boxes Might Need this:
#### START: DEBIAN 8 TESTED ####
apt-get update && \
  apt-get install -y apt-utils build-essential g++ flex bison gperf \
      ruby perl python libpython3-dev python-setuptools libssl-dev git git-core \
      libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 \
      libpng-dev libjpeg-dev libx11-dev libxext-dev \
      ttf-freefont ttf-mscorefonts-installer ttf-bitstream-vera ttf-dejavu ttf-liberation
sudo apt-get update && \
  apt-get install -y fonts-levien-typoscript fonts-droid fonts-century-catalogue fonts-levien-typoscript fonts-lindenhill fonts-linex fonts-ocr-a fonts-ubuntu-title fonts-unfonts-extra
#### END: DEBIAN 8 TESTED ####

# Debian7 PhantomJS Boxes Might Need this:
sudo apt-get update && \
  apt-get install -y ttf-dejavu fonts-droid ttf-droid ttf-century-catalogue ttf-unifont  ttf-unfonts-core ttf-unfonts-extra ttf-ubuntu-title  ttf-anonymous-pro ttf-opensymbol fonts-opensymbol ttf-adf-* ttf-ocr-a  ttf-levien-museum ttf-levien-typoscript ttf-lindenhill ttf-linex ttf-linux-libertine ttf-lyx ttf-mscorefonts-installer ttf-mplus libpython3-dev





#And everything now...
sudo apt-get update && \
  apt-get install -y nodejs vim-nox build-essential libssl-dev zlib1g-dev curl wget checkinstall cdbs \
devscripts dh-make fakeroot libxml-parser-perl check \
p7zip p7zip-rar zip unzip \
redis-server ttf-mscorefonts-installer ttf-dejavu fonts-droid fonts-opensymbol \
mongodb-org=3.2.0 mongodb-org-server=3.2.0 mongodb-org-shell=3.2.0 mongodb-org-mongos=3.2.0 mongodb-org-tools=3.2.0


# Setup latest docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# ### STEPS, IF CURL DONT WORK! ^^^
# sudo sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
# sudo apt-get update
# sudo apt-get update && \
#   apt-get install lxc-docker

#	Debian PhantomJS Boxes Might Need this:
sudo apt-get install -y ttf-dejavu fonts-droid ttf-droid ttf-century-catalogue ttf-unifont  ttf-unfonts-core ttf-unfonts-extra ttf-ubuntu-title  ttf-anonymous-pro ttf-opensymbol fonts-opensymbol ttf-adf-* ttf-ocr-a  ttf-levien-museum ttf-levien-typoscript ttf-lindenhill ttf-linex ttf-linux-libertine ttf-lyx ttf-mscorefonts-installer ttf-mplus



#And everything now...
sudo apt-get install -y nodejs vim-nox build-essential libssl-dev zlib1g-dev curl wget checkinstall cdbs \
devscripts dh-make fakeroot libxml-parser-perl check p7zip-full zip unzip \
redis-server ttf-mscorefonts-installer ttf-dejavu fonts-droid fonts-opensymbol \
mongodb-org=3.2.0 mongodb-org-server=3.2.0 mongodb-org-shell=3.2.0 mongodb-org-mongos=3.2.0 mongodb-org-tools=3.2.0


# Setup latest docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

### STEPS, IF CURL DONT WORK! ^^^
sudo sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker
