#!/bin/bash
set -e

## Installs CLI Client Binaries for common DevOps tools.
## For Linux & OSX. 

export  RANCHER_COMPOSE_VERSION=0.12.4
export  DOCKER_COMPOSE_VERSION=1.11.2 
export  DOCKER_VERSION=1.13.1

### Install/copy CLI binaries ###

function installDocker() {
  sudo curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz
  sudo tar --strip-components=1 -xzf docker-$DOCKER_VERSION.tgz -C /usr/local/bin 
  sudo chmod +x /usr/local/bin/docker
}

function installDockerCompose() {
  sudo curl -sL "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose 
  sudo chmod +x /usr/local/bin/docker-compose
}

function installRancherCompose() {
  sudo curl -sL "https://github.com/rancher/rancher-compose/releases/download/v${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-v${RANCHER_COMPOSE_VERSION}.tar.gz" -o /tmp/rancher-compose.tar.gz 
  sudo tar --strip-components=1 -xzf /tmp/rancher-compose.tar.gz -C /usr/local/bin 
  sudo mv /usr/local/bin/rancher-compose-v${RANCHER_COMPOSE_VERSION}/rancher-compose /usr/local/bin/
  sudo chmod +x /usr/local/bin/rancher-compose
}


printf "\n\n\t*** Checking/Installing CLI Client Binaries for Docker & Rancher ***\t\n"
printf "\nCurrent Version(s):\n"
printf "\tDocker:\t\t\t$(docker --version 2>/dev/null)\n"
printf "\tDocker Compose:\t\t$(docker-compose --version 2>/dev/null)\n"
printf "\tRancher Compose:\t\t$(rancher-compose --version 2>/dev/null)\n"
printf "===============================\n"


printf "\nDocker & Rancher Versions:\n"
[ "$(which docker)" == "" ]           && installDocker          || printf "\tDocker:\t\t\t$(docker --version 2>&1)\n"
[ "$(which docker-compose)" == "" ]   && installDockerCompose   || printf "\tDocker Compose:\t\t$(docker-compose --version 2>&1)\n"
[ "$(which rancher-compose)" == "" ]  && installRancherCompose  || printf "\tRancher Compose:\t\t$(rancher-compose --version 2>&1)\n"
printf "===============================\n\n"


