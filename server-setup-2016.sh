#!/bin/bash
#set -e 
#### ^^^^ WARN: Continues on ERRORS
#### ^^^^ WARN: Continues on ERRORS
#### ^^^^ WARN: Continues on ERRORS
#### ^^^^ WARN: Continues on ERRORS

# This is for the cloud! (and cloud-like things)
# USAGE:
# curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/server-setup-2016.sh | bash

# Create shared main folder structure /data
mkdir -p \
  /data/drone/var/lib/drone \
  /data/drone/opt/rancher \
  /data/drone/etc/drone \
  /data/{redis,mongodb,logs,rancher,registry,_shared}

DEBIAN_FRONTEND=noninteractive \
 apt-get update && \
 apt-get install sudo net-tools curl -y --allow-downgrades 
 
## SETUP Base Pkgs
sudo DEBIAN_FRONTEND=noninteractive \
 apt-get update && \
 apt-get dist-upgrade -y && \
 apt-get install -y --allow-downgrades \
    bash-completion dialog \
    curl wget vim-nox openssl pv iotop htop \
    apt-transport-https ca-certificates strace ltrace fail2ban \
    parted sshfs aufs-tools zfs nfs-common 
# Install on nfs file server: nfs-kernel-server

if [ ! -d ~/backups/profile ]; then
  # Backup on first run
  mkdir -p ~/backups/profile
  cp -ra ~/.bash* ~/backups/profile
fi

if [ "$(grep 'justsml' ~/.bashrc)" == "" ]; then
  ## Setup NEW ENV Stuff -- APPEND MODE
  curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bashrc >> ~/.bashrc
  curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases >> ~/.bash_aliases
else
  # Pre-existing, OVERWRITE MODE
  printf "\n\n&&&&& ####### >>>>>>>> Found old script, upgrading .bashrc - OVERWRITE MODE \n#################\n\n\n\n\n"
  # already embeded my env scripts, overwrite - might lose shit - try cat'ing the output with file(s) in ~/backups/profile
  curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bashrc > ~/.bashrc
  curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases > ~/.bash_aliases
fi

## Adding Keys - see http://www.danlevy.net/cloud-config.yml
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKpLdgFovIX6gNMXojga1/WGBxiTgGXIKmDJgw9WRrp8 dlevy@Dans-Pro.local" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAvLexXB7TqW9mn6bNZbfp7tEkR27c13p31zBforRCKT5DnSrKhQTAZUHgvbhguGXyPhwV76PCTlEzgTicKKe82HcSc3uk6/3RT67MlHNaSO2hjfZSoo8tS0mo0a06DEmDcfdjHQNaDSqHjeq56r4aMAJQxIp3ySaIbRyM/r1KFuU+igJHm0mp9C3cpzm8O4fTjgsJUFGDVwFgLJ1Y5kgIhaZiHWl8UOXtReW7ETcPay9xvJ5Zqff9fV2RLBDIki07HalQE+kkSsf2HgVPNiLXDy5xRZupfmuv8SHpUFlcUMcxn5T872iHTVcvDepMbJrDNPGmWCDc0DPxzfJSFktkA95aj83tq1XHXpk7koJJEDFTkXGIPHsZeeRAp9t1WBTJlnTkYn9DInloejEC1lSZKAOQ1iky3v1tZ3SSZD1zWDLwVaDnIe+5+xPw+lzV+4fgpFmSI9bWrw2NIjo1caqNPCgeoO8ZlRjc1jQyZzVT77nCWtV4M+RTndY0ev57WCb3mgP5EFJF/7IX6Cxh1thxzinpwy3dGPT1uYf9StlTzgUi7q0sLs0mr1ONXV2K3DMBCkcsFC4og32Yaxqw6/pF8pDdvYszyfb5PjQAcwhsSQHA60lR+D7lFEsWElTli/pFcboQQOdpEuVG1TPdmdfdygILKGkEqodTq4S2Fth+Uw== dlevy@Dans-MacBook-Pro.local" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKELYVfFjdT4aud/J6X7ZctlkTCCsY5NlIZvSGZdiZrrHkYTjSATk3ZOSySz8rtXxMkCCekiawjWZeoBQTwGoqLP0WDCFIHWZ+aoskVxIbgHF/C4UeBejMPvz43Fo9Ff5tr6Y12MrmuDY/OLiDTBIZw9+LURWziJXbGDx9/ak7TuAXvSuphC0rh9nVjtpdoOSK0S43i37FLPtkR1P3lpYi+QeJ9FHb4IDCtPENv/tqEY6+Z8PtLRjyPuRljcG2KELhFozAW5HIRbfaQmHooNnejAWQRGXxoh0auNLvAaCw+3TE/q+Fi/XQyX6Ut/DplatLDKjV/6Ho2Ue+83sW70D5yoMXY3xF25UH6e6RUgN2YLFjONe0A23vi074FPxN6vrJU9cFfW4fSSaVYyfxylPs7dMhzD2qjPtbkVMt4Pjd0DCOaQsP2Slfup1eN8UxycgJDM3n+5E8eJeOsHQjyytIzOT0wfJpYTeCpQ1ViLh9dr53+SUGUm07Fmy7GfzuM+iDeqcIOJdFNGObd0KOkO+oyniHO2jm6HtIh81SXFDx8V5nwUF4eYv7qmZOT2kxHSJOZYud0s/4ZtcBZd6QobBsY38r9uJpVXeRopIXhmpAZmDvT/rDSKh7N9UNadNKUwZ1rosTPnim83R335XPD4jm2cwTWvq9vtOe0wBtftr6AQ== dan@Dev08" >> ~/.ssh/authorized_keys

# if [ "$INSTALL_DOCKER" != "" ]; then 
## SETUP Docker 
curl -sSL https://get.docker.com/ | sudo DEBIAN_FRONTEND=noninteractive bash  
# fi

if [ "$INSTALL_ZEROTIER" != "" ]; then 
  ## SETUP ZEROTIER
  curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/modules/zero-tier.sh | bash
fi

function genSshId () {
  printf '\n\n\n******* START: SSH PUB KEY ********* \n\n\n'
  if [ ! -f /root/.ssh/id_ed25519 ]; then
     DEBIAN_FRONTEND=noninteractive ssh-keygen -N '' -t ed25519 -f /root/.ssh/id_ed25519
  fi

  [ -f /root/.ssh/id_ed25519.pub ] && cat /root/.ssh/id_ed25519.pub || printf '\n\n\nCRITICAL ERROR: NO ED25519 SSH KEY FOUND\n\n\n'
  printf '\n******* DONE: SSH PUB KEY ********* \n\n'
}

function enableSSHKeepAlive () {
  printf "\nClientAliveInterval 120\nClientAliveCountMax 5" >> /etc/ssh/sshd_config
}

function serverSystemTuning () {
  if [ "$(egrep "mem_max.?=.?[0-9]{7,}" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
# 16MB per socket - which sounds like a lot, but will virtually never
# consume that much.
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
HEREDOC
  fi

  if [ "$(egrep "tcp_max_syn_backlog.?=.?[0-9]{4,}" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
# Increase the number of outstanding syn requests allowed.
# c.f. The use of syncookies.
net.ipv4.tcp_max_syn_backlog = 4096
net.ipv4.tcp_syncookies = 1
HEREDOC
  fi

  if [ "$(egrep "somaxconn.?=.?[0-9]{4,}" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
# The maximum number of "backlogged sockets".  Default is 128.
net.core.somaxconn = 1024
net.ipv4.ip_local_port_range = 1024 65535
HEREDOC
  fi
  
  if [ ! -f /etc/init.d/disable-transparent-hugepages ]; then
    ## SETUP MONGODB SYSCTL TUNING ##
    sudo curl -sSL -o /etc/init.d/disable-transparent-hugepages https://gist.githubusercontent.com/justsml/5e8f10892070072c4ffb/raw/disable-transparent-hugepages
    sudo chmod 755 /etc/init.d/disable-transparent-hugepages
    sudo update-rc.d disable-transparent-hugepages defaults
  fi
  
  ## ADD CGROUP STUFF TO GRUB
  if [ "$(grep 'cgroup_enable=memory' /etc/default/grub)" == "" ]; then 
    if [ "$(grep 'GRUB_CMDLINE_LINUX' /etc/default/grub)" == "" ]; then 
      echo 'GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"' >> /etc/default/grub
    else
      sudo sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT="\)"/\1cgroup_enable=memory swapaccount=1"/' /etc/default/grub 
    fi
    sudo update-grub
    printf "\n### *** UPDATED GRUB W/ CGROUPS *** ###\n\n\n"
    printf "\n### *** RESTART REQUIRED *** ###\n" && sleep 2s
    printf "\n### *** RESTART REQUIRED *** ###\n" && sleep 2s
    printf "\n### *** RESTART REQUIRED *** ###\n" && sleep 2s
    printf "\n### *** RESTART REQUIRED *** ###\n" && sleep 2s
    printf "#####################\n\n\n\n\n\n"
  fi
}

genSshId
enableSSHKeepAlive
serverSystemTuning

printf '\n\n### Attempting SSH Key Check & AutoGenerator \n'
curl -L https://github.com/justsml/system-setup-tools/raw/master/modules/ssh-key-generator.sh | HOME_DIR=/root bash
printf   '\n### DONEL SSH Check \n'

printf '\n\n ******* DONE: SERVER-SETUP-2016 ******* \n\n'

