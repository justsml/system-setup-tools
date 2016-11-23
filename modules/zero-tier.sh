#!/bin/bash

curl -s https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg | gpg --import
ZT_RESULTS=$(curl -s https://install.zerotier.com/ | gpg --output - >/tmp/zt-install.sh && bash /tmp/zt-install.sh)

echo $ZT_RESULTS > $HOME/zerotier-install.log

cat $HOME/zerotier-install.log

printf '\n\n^^^^ Save ZeroTier Client ID ^^^^\n===============================\n\n\n'

