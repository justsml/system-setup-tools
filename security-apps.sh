
#### Network Security
# Peer Guardian IP List
sudo add-apt-repository ppa:jre-phoenix/ppa
sudo apt-get update
sudo apt-get install -y pgld pglcmd pglgui

# Virus Scanning
sudo apt-get install clamav clamav-daemon clamav-freshclam 
# Update
/etc/init.d/clamav-freshclam restart
# Scan home directory
clamscan -r /home
