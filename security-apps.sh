
#### Network Security
# Peer Guardian IP List
# sudo add-apt-repository ppa:jre-phoenix/ppa
# sudo apt-get update
# sudo apt-get install -y pgld pglcmd pglgui

# Virus Scanning
sudo apt-get update && apt-get install -y clamav clamav-daemon clamav-freshclam
# firewall, sec related apps
sudo apt-get update && apt-get install ufw fail2ban psad
# intrusion detection
sudo apt-get update && apt-get install aide
# Update
/etc/init.d/clamav-freshclam restart
# Scan home directory
clamscan -r /home
