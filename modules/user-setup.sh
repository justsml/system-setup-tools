#!/bin/bash
set -e
# Requires files: ./ssh-key-generator.sh AND ./authorized_keys 


user_paths="/home/deploy /home/staging /home/production /home/development"

for usr_path in $user_paths
do
  usr=$(basename $usr_path)
  echo "$usr ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
  if [ "$(grep ${usr}: /etc/passwd)" == "" ]; then
    adduser --gecos "" --shell /bin/bash --disabled-password --home /home/${usr} ${usr}
  fi
  # echo "$usr ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
  source ./ssh-key-generator.sh $usr_path
  cat ./authorized_keys >> $usr_path/.ssh/authorized_keys
done

