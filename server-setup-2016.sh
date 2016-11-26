#!/bin/bash
set -e 

# This is for the cloud! (and cloud-like things)
# USAGE:
# curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/server-setup-2016.sh | bash

## SETUP Base Pkgs
sudo apt update
sudo apt install -y bash-completion dialog curl wget vim-nox openssl pv iotop htop apt-transport-https ca-certificates strace ltrace apparmor_parser
sudo apt -y dist-upgrade 

## Setup ENV Stuff
curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bashrc >> ~/.bashrc
curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases >> ~/.bash_aliases

## Adding Keys - see http://www.danlevy.net/cloud-config.yml
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKpLdgFovIX6gNMXojga1/WGBxiTgGXIKmDJgw9WRrp8 dlevy@Dans-Pro.local" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAvLexXB7TqW9mn6bNZbfp7tEkR27c13p31zBforRCKT5DnSrKhQTAZUHgvbhguGXyPhwV76PCTlEzgTicKKe82HcSc3uk6/3RT67MlHNaSO2hjfZSoo8tS0mo0a06DEmDcfdjHQNaDSqHjeq56r4aMAJQxIp3ySaIbRyM/r1KFuU+igJHm0mp9C3cpzm8O4fTjgsJUFGDVwFgLJ1Y5kgIhaZiHWl8UOXtReW7ETcPay9xvJ5Zqff9fV2RLBDIki07HalQE+kkSsf2HgVPNiLXDy5xRZupfmuv8SHpUFlcUMcxn5T872iHTVcvDepMbJrDNPGmWCDc0DPxzfJSFktkA95aj83tq1XHXpk7koJJEDFTkXGIPHsZeeRAp9t1WBTJlnTkYn9DInloejEC1lSZKAOQ1iky3v1tZ3SSZD1zWDLwVaDnIe+5+xPw+lzV+4fgpFmSI9bWrw2NIjo1caqNPCgeoO8ZlRjc1jQyZzVT77nCWtV4M+RTndY0ev57WCb3mgP5EFJF/7IX6Cxh1thxzinpwy3dGPT1uYf9StlTzgUi7q0sLs0mr1ONXV2K3DMBCkcsFC4og32Yaxqw6/pF8pDdvYszyfb5PjQAcwhsSQHA60lR+D7lFEsWElTli/pFcboQQOdpEuVG1TPdmdfdygILKGkEqodTq4S2Fth+Uw== dlevy@Dans-MacBook-Pro.local" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKELYVfFjdT4aud/J6X7ZctlkTCCsY5NlIZvSGZdiZrrHkYTjSATk3ZOSySz8rtXxMkCCekiawjWZeoBQTwGoqLP0WDCFIHWZ+aoskVxIbgHF/C4UeBejMPvz43Fo9Ff5tr6Y12MrmuDY/OLiDTBIZw9+LURWziJXbGDx9/ak7TuAXvSuphC0rh9nVjtpdoOSK0S43i37FLPtkR1P3lpYi+QeJ9FHb4IDCtPENv/tqEY6+Z8PtLRjyPuRljcG2KELhFozAW5HIRbfaQmHooNnejAWQRGXxoh0auNLvAaCw+3TE/q+Fi/XQyX6Ut/DplatLDKjV/6Ho2Ue+83sW70D5yoMXY3xF25UH6e6RUgN2YLFjONe0A23vi074FPxN6vrJU9cFfW4fSSaVYyfxylPs7dMhzD2qjPtbkVMt4Pjd0DCOaQsP2Slfup1eN8UxycgJDM3n+5E8eJeOsHQjyytIzOT0wfJpYTeCpQ1ViLh9dr53+SUGUm07Fmy7GfzuM+iDeqcIOJdFNGObd0KOkO+oyniHO2jm6HtIh81SXFDx8V5nwUF4eYv7qmZOT2kxHSJOZYud0s/4ZtcBZd6QobBsY38r9uJpVXeRopIXhmpAZmDvT/rDSKh7N9UNadNKUwZ1rosTPnim83R335XPD4jm2cwTWvq9vtOe0wBtftr6AQ== dan@Dev08" >> ~/.ssh/authorized_keys

## SETUP MONGODB SYSCTL TUNING ##
sudo curl -sSL -o /etc/init.d/disable-transparent-hugepages https://gist.githubusercontent.com/justsml/5e8f10892070072c4ffb/raw/disable-transparent-hugepages
sudo chmod 755 /etc/init.d/disable-transparent-hugepages
sudo update-rc.d disable-transparent-hugepages defaults

## SETUP Docker 
curl -sSL https://get.docker.com/ | sudo bash


## SETUP ZEROTIER
curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/modules/zero-tier.sh | bash

printf '\n\n ******* DONE: SERVER-SETUP-2016 ******* \n\n'
