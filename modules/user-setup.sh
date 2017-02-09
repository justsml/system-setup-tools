#!/bin/bash
set -e
# Requires files: ./ssh-key-generator.sh AND ./authorized_keys 

# mkdir -p ~/deploy-scripts && curl -sSL https://github.com/justsml/system-setup-tools/raw/master/modules/ssh-key-generator.sh > ~/deploy-scripts/ssh-key-generator.sh  && curl -sSL https://github.com/justsml/system-setup-tools/raw/master/modules/user-setup.sh > ~/deploy-scripts/user-setup.sh && chmod a+x -Rfc ~/deploy-scripts && printf "\n\n\n##### Before running ~/deploy-scripts/user-setup.sh...\nCreate a ~/deploy-scripts/authorized_keys file!!!!!\n\n\n\n!!!!!!\n\n"

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

