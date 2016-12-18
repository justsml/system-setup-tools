#!/bin/bash
set -e
DEBIAN_FRONTEND=noninteractive

# Uses current dir as 'base' by default
home_dir=${HOME_DIR-"$1"}
home_dir=${home_dir-"$HOME"}
cert_password=${cert_password-""}
user_name="$(basename $home_dir)"


# First, swap your RSA keys for ed25519-based keys - it's a vastly more efficient algorithm & will probably just work.

# Second, if you can't upgrade due to old tooling, servers and/or requirements. My condolences.... Save yourself from any illusion of security and publish your "private" "2-bit" RSA keys to Twitter.

###########
# If you think you need ancient RSA-based key tech, double check - it's ~2017.
# Here's the nitty gritty:
# NOTE: RSA KEYGEN IS SET TO A CRAZY-HIGH 2000 ROUNDS - THE PERFORMANCE HIT IS REAL, OVERRIDE IF NEEDED
# Rough benchmark #'s to ssh-keygen:
# '2000' rounds REQUIRES a BEEFY 2016+ Xeon w/ lot of available CPU power.
# IMPORTANT: Use -a 400 or -a 600 if running an ARMv6 or Ultra-Low-Watt Core i? CPU. 
# 0.12-1.77s  i5-3570K    @ 3.40GHz
# 0.54-2.11s  E5-1620  v2 @ 3.70GHz
# 0.60-1.90s  E5-2640  v3 @ 2.60GHz
# 0.42-1.92s  E5-2650L v3 @ 1.80GHz
# 0.31-1.89s  E5-2630L v2 @ 2.40GHz
# 2.10-13.0s  Atom C2550  @ 2.40GHz

printf '\n\n\n******* START: GEN/SHOW SSH PUB KEY ********* \n\n\n'
IP_ADDRS=$(ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}' | sed s/addr:// | xargs echo )
printf "\n\nHost:     $(hostname)\n" 
printf "Addr:     $IP_ADDRS\n===========================================\n\n" 

if [ ! -f $home_dir/.ssh/id_ed25519 ]; then
  mkdir -p $home_dir/.ssh
  ssh-keygen -N "$cert_password" -t ed25519 -f $home_dir/.ssh/id_ed25519
  echo "\n$home_dir/.ssh/id_ed25519.pub"
  cat $home_dir/.ssh/id_ed25519.pub
fi
if [ ! -f "$home_dir/.ssh/id_rsa" ]; then 
  # NOTE: '2000' rounds REQUIRES a BEEFY 2016+ Xeon w/ lot of available CPU power.
  # IMPORTANT: Use 400 or 600 if running an ARMv6 or Ultra-Low-Watt Core i? CPU. 
  printf "\n... About to start hashing, **cancel** (ctrl-C) if running more than 10-30 sec...\n\n\n"
  ssh-keygen -o -a 2000 -N "$cert_password" -t rsa -b 4096 -f $home_dir/.ssh/id_rsa
  echo "\n$home_dir/.ssh/id_rsa.pub"
  cat $home_dir/.ssh/id_rsa.pub
fi
if [ -f $home_dir/.ssh/id_ed25519.pub ]; then
  printf "\n==============\n\nSuccess!\nRemember to append $user_name\'s public key(s) from above (try ed25519 first) into ~/.ssh/authorized_keys file(s) wherever you need access. >>> \nEXPERTS: Check/export $home_dir/.ssh/* for the rest of the goods. \n\n"
else
  printf "\n\n\nCRITICAL ERROR: NO ED25519/RSA ID FOUND\n\n\n"
fi

# Try fix ownership + permissions
sudo chown $user_name: -Rfc $home_dir/.ssh
sudo chmod 600 -Rf $home_dir/.ssh
sudo chmod 644 -Rf $home_dir/.ssh/*.pub

printf '\n******* DONE: GEN/SHOW SSH PUB KEY ********* \n\n'
