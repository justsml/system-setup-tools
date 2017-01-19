#!/bin/bash
#set -e 
#### ^^^^ WARN: Continues on ERRORS
#### ^^^^ WARN: Continues on ERRORS
#### ^^^^ WARN: Continues on ERRORS
#### ^^^^ WARN: Continues on ERRORS

# This is for the cloud! (and cloud-like things)
# USAGE:
# curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/server-setup-2016.sh | bash

###################
#### NOTE TO USERS: PLEASE UPDATE THE NEXT BIT WITH YOUR PUBLIC KEY(S)
## Adding Keys - see http://www.danlevy.net/cloud-config.yml
if [ "$(grep dlevy ~/.ssh/authorized_keys)" == "" ]; then
  echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKpLdgFovIX6gNMXojga1/WGBxiTgGXIKmDJgw9WRrp8 dlevy@Dans-Pro.local" >> ~/.ssh/authorized_keys
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAvLexXB7TqW9mn6bNZbfp7tEkR27c13p31zBforRCKT5DnSrKhQTAZUHgvbhguGXyPhwV76PCTlEzgTicKKe82HcSc3uk6/3RT67MlHNaSO2hjfZSoo8tS0mo0a06DEmDcfdjHQNaDSqHjeq56r4aMAJQxIp3ySaIbRyM/r1KFuU+igJHm0mp9C3cpzm8O4fTjgsJUFGDVwFgLJ1Y5kgIhaZiHWl8UOXtReW7ETcPay9xvJ5Zqff9fV2RLBDIki07HalQE+kkSsf2HgVPNiLXDy5xRZupfmuv8SHpUFlcUMcxn5T872iHTVcvDepMbJrDNPGmWCDc0DPxzfJSFktkA95aj83tq1XHXpk7koJJEDFTkXGIPHsZeeRAp9t1WBTJlnTkYn9DInloejEC1lSZKAOQ1iky3v1tZ3SSZD1zWDLwVaDnIe+5+xPw+lzV+4fgpFmSI9bWrw2NIjo1caqNPCgeoO8ZlRjc1jQyZzVT77nCWtV4M+RTndY0ev57WCb3mgP5EFJF/7IX6Cxh1thxzinpwy3dGPT1uYf9StlTzgUi7q0sLs0mr1ONXV2K3DMBCkcsFC4og32Yaxqw6/pF8pDdvYszyfb5PjQAcwhsSQHA60lR+D7lFEsWElTli/pFcboQQOdpEuVG1TPdmdfdygILKGkEqodTq4S2Fth+Uw== dlevy@Dans-MacBook-Pro.local" >> ~/.ssh/authorized_keys
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKELYVfFjdT4aud/J6X7ZctlkTCCsY5NlIZvSGZdiZrrHkYTjSATk3ZOSySz8rtXxMkCCekiawjWZeoBQTwGoqLP0WDCFIHWZ+aoskVxIbgHF/C4UeBejMPvz43Fo9Ff5tr6Y12MrmuDY/OLiDTBIZw9+LURWziJXbGDx9/ak7TuAXvSuphC0rh9nVjtpdoOSK0S43i37FLPtkR1P3lpYi+QeJ9FHb4IDCtPENv/tqEY6+Z8PtLRjyPuRljcG2KELhFozAW5HIRbfaQmHooNnejAWQRGXxoh0auNLvAaCw+3TE/q+Fi/XQyX6Ut/DplatLDKjV/6Ho2Ue+83sW70D5yoMXY3xF25UH6e6RUgN2YLFjONe0A23vi074FPxN6vrJU9cFfW4fSSaVYyfxylPs7dMhzD2qjPtbkVMt4Pjd0DCOaQsP2Slfup1eN8UxycgJDM3n+5E8eJeOsHQjyytIzOT0wfJpYTeCpQ1ViLh9dr53+SUGUm07Fmy7GfzuM+iDeqcIOJdFNGObd0KOkO+oyniHO2jm6HtIh81SXFDx8V5nwUF4eYv7qmZOT2kxHSJOZYud0s/4ZtcBZd6QobBsY38r9uJpVXeRopIXhmpAZmDvT/rDSKh7N9UNadNKUwZ1rosTPnim83R335XPD4jm2cwTWvq9vtOe0wBtftr6AQ== dan@Dev08" >> ~/.ssh/authorized_keys
fi

# Create my common host-server folder structure under /data
mkdir -p \
  /data/drone/var/lib/drone \
  /data/drone/opt/rancher \
  /data/drone/etc/drone \
  /data/{redis,mongodb,logs,rancher,registry,certs}

if [ ! -d /certs ]; then
  ln -sf /data/certs /certs
fi

# Add Sudo in case it's missing
DEBIAN_FRONTEND=noninteractive \
 apt-get update && \
 apt-get install sudo curl -y --allow-downgrades 
 
## SETUP Base Pkgs
sudo DEBIAN_FRONTEND=noninteractive \
 apt-get update && \
 apt-get dist-upgrade -y && \
 apt-get install -y --allow-downgrades \
    bash-completion dialog net-tools \
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

if [ "$(which docker)" == "" ]; then
  ## SETUP Docker 
  curl -sSL https://get.docker.com/ | sudo DEBIAN_FRONTEND=noninteractive bash  
fi

if [ "$INSTALL_ZEROTIER" != "" ]; then 
  ## SETUP ZEROTIER - OPTIONAL PRIVATE VPN LAYER
  curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/modules/zero-tier.sh | bash
fi

function genSshId () {
  if [ ! -f $HOME/.ssh/id_ed25519 ]; then
     DEBIAN_FRONTEND=noninteractive ssh-keygen -N '' -t ed25519 -f $HOME/.ssh/id_ed25519
  fi

  printf '\n\n\n******* START: SSH PUB KEY ********* \n\n\n'
  if [ -f $HOME/.ssh/id_ed25519.pub ]; then
    printf "\nSSH KEY: $(cat $HOME/.ssh/id_ed25519.pub)\n\n\n"
  else
    printf '\n\n\nCRITICAL ERROR: NO ED25519 SSH KEY FOUND\n\n\n' >&2
  fi
  printf '\n******* DONE: SSH PUB KEY ********* \n\n'
}

function enableSSHKeepAlive () {
  if [ "$(grep ClientAliveCountMax /etc/ssh/sshd_config)" == "" ]; then
    printf "\nClientAliveInterval 50\nClientAliveCountMax 5\n" >> /etc/ssh/sshd_config
  fi
}

function setupDHParam () {
  if [ ! -f "/certs/dhparam.pem" ]; then
   sudo openssl dhparam -out /certs/dhparam.pem 2048
 fi
}

function setupLimits () {
  if [ ! -f "/etc/security/limits.conf" ]; then
    cat << HEREDOC >> /etc/security/limits.conf
soft nofile 65535
hard nofile 65535
HEREDOC
  fi
  if [ "$(egrep "soft nofile" /etc/security/limits.conf)" == "" ]; then
    echo "soft nofile 65535" >> /etc/security/limits.conf
  fi
  if [ "$(egrep "hard nofile" /etc/security/limits.conf)" == "" ]; then
    echo "hard nofile 65535" >> /etc/security/limits.conf
  fi  
}

function serverSystemTuning () {
  # Set high thread & process limits - ideal for servers w/ +16GB RAM
  if [ "$(egrep "kernel.threads-max" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
kernel.threads-max = 256000
HEREDOC
  fi
  if [ "$(egrep "kernel.max_pid" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
kernel.pid_max = 4194303
HEREDOC
  fi
  if [ "$(egrep "vm.max_map_count" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
vm.max_map_count = 600000
HEREDOC
  fi

  # Tune NETWORK configuration for 2-10G+ Ethernet + Many Connections
  # Credit: https://fasterdata.es.net/host-tuning/linux/
  if [ "$(egrep "mem_max.?=.?[0-9]{7,}" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
# Allow up to 64MB per socket - it will virtually never consume that much.
net.core.rmem_max = 67108864 
net.core.wmem_max = 67108864 
HEREDOC
  fi
  if [ "$(egrep "tcp_rmem" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
# increase Linux autotuning TCP buffer limit to 32MB
net.ipv4.tcp_rmem = 4096 87380 33554432
net.ipv4.tcp_wmem = 4096 65536 33554432
HEREDOC
  fi
  if [ "$(egrep "tcp_syncookies" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_syn_retries = 2
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_max_syn_backlog = 8192
HEREDOC
  fi
# Credit: https://www.linode.com/docs/websites/nginx/configure-nginx-for-optimized-performance
  if [ "$(egrep "tcp_max_tw_buckets" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
net.ipv4.tcp_max_tw_buckets = 1440000
HEREDOC
  fi
  if [ "$(egrep "net.ipv4.tcp_fin_timeout" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
net.ipv4.tcp_fin_timeout = 10
HEREDOC
  fi
  if [ "$(egrep "net.ipv4.tcp_window_scaling" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
net.ipv4.tcp_window_scaling = 1
HEREDOC
  fi
  if [ "$(egrep "net.ipv4.tcp_max_syn_backlog" /etc/sysctl.conf)" == "" ]; then
    cat << HEREDOC >> /etc/sysctl.conf
net.ipv4.tcp_max_syn_backlog = 3240000
HEREDOC
  fi

  if [ "$(egrep "somaxconn.?=.?[0-9]{4,}" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
# The maximum number of "backlogged sockets".  Default is 128.
net.core.somaxconn = 65535
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
  # Ref: https://docs.docker.com/engine/installation/linux/ubuntulinux/#/enable-memory-and-swap-accounting
  # And: https://wiki.debian.org/systemd#Missing_startup_messages_on_console.28tty1.29_after_the_boot
  if [ -f "/etc/default/grub" ]; then
    if [ "$(grep 'cgroup_enable=memory' /etc/default/grub 2>/dev/null)" == "" ]; then 
      if [ "$(grep 'GRUB_CMDLINE_LINUX' /etc/default/grub)" == "" ]; then 
        echo 'GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1 systemd.show_status=1 "' >> /etc/default/grub
      else
        sudo sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT="\)/\1cgroup_enable=memory swapaccount=1 systemd.show_status=1 /' /etc/default/grub 
      fi
      sudo update-grub
      printf "\n### *** UPDATED GRUB W/ CGROUPS *** ###\n\n\n"
      printf "\n### *** RESTART REQUIRED *** ###\n" && sleep 2s
      printf "\n### *** RESTART REQUIRED *** ###\n" && sleep 2s
      printf "\n### *** RESTART REQUIRED *** ###\n" && sleep 2s
      printf "\n### *** RESTART REQUIRED *** ###\n" && sleep 2s
      printf "#####################\n\n\n\n\n\n"
    fi
  fi
}

function fixDockerSystemd () {
  if [ "$(grep overlay2 /lib/systemd/system/docker.service)" == "" ]; then
    grep --color 'ExecStart' /lib/systemd/system/docker.service
    sudo sed -i 's/^ExecStart=.*$/ExecStart=\/usr\/bin\/dockerd -H fd:\/\/ -s overlay2 --dns 8.8.8.8 --dns 8.8.4.4/' /lib/systemd/system/docker.service
    grep --color 'ExecStart' /lib/systemd/system/docker.service
  fi
}

genSshId
enableSSHKeepAlive
setupDHParam
serverSystemTuning
setupLimits
fixDockerSystemd

printf "\n===============\n============\nServer sysctl.conf Config:\n\n"
cat /etc/sysctl.conf
printf "\n===============\n============\n\n\n\n"

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  printf '\n\n### Attempting SSH Key Check & AutoGenerator \n'
  curl -L https://github.com/justsml/system-setup-tools/raw/master/modules/ssh-key-generator.sh | HOME_DIR=$HOME bash
  printf   '\n### DONEL SSH Check \n'
fi

printf '\n\n ******* DONE: SERVER-SETUP-2016 ******* \n\n'
