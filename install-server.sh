# Performance profiling
sudo apt-get install -y collectl


# Redis Setup
sudo apt-get install -y redis-server

# MariaDB/mySql
sudo apt-get install -y mariadb-server
sudo /usr/bin/mysql_secure_installation

# Java, if needed
#sudo apt-get install -y openjdk-7-jdk openjdk-7-jre icedtea-7-plugin

#	Debian PhantomJS Boxes Might Need this:
sudo apt-get install -y ttf-dejavu fonts-droid ttf-droid ttf-century-catalogue ttf-unifont  ttf-unfonts-core ttf-unfonts-extra ttf-ubuntu-title  ttf-anonymous-pro ttf-opensymbol fonts-opensymbol ttf-adf-* ttf-ocr-a  ttf-levien-museum ttf-levien-typoscript ttf-lindenhill ttf-linex ttf-linux-libertine ttf-lyx ttf-mscorefonts-installer ttf-mplus



#And everything now...
sudo apt-get install -y nodejs vim-nox build-essential libssl-dev zlib1g-dev curl wget checkinstall cdbs \
devscripts dh-make fakeroot libxml-parser-perl check p7zip p7zip-rar zip unzip \
redis-server ttf-mscorefonts-installer ttf-dejavu fonts-droid fonts-opensymbol \
mongodb-org=2.6.8 mongodb-org-server=2.6.8 mongodb-org-shell=2.6.8 mongodb-org-mongos=2.6.8 mongodb-org-tools=2.6.8


# Setup latest docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

### STEPS, IF CURL DONT WORK! ^^^ 
sudo sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker
