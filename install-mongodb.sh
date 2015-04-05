sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
# MongoDB @ v2.6.8
sudo apt-get install -y mongodb-org=2.6.8 mongodb-org-server=2.6.8 mongodb-org-shell=2.6.8 mongodb-org-mongos=2.6.8 mongodb-org-tools=2.6.8
