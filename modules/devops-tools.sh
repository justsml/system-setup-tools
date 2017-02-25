#!/bin/bash
set -e

export  RANCHER_COMPOSE_VERSION=0.12.2
export  DOCKER_COMPOSE_VERSION=1.11.2 
export  DOCKER_VERSION=1.13.1

### Install binaries ###
sudo curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz
sudo tar --strip-components=1 -xzf docker-$DOCKER_VERSION.tgz -C /usr/local/bin 
sudo chmod +x /usr/local/bin/docker

sudo curl -sL "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose 
sudo chmod +x /usr/local/bin/docker-compose

sudo curl -sL "https://github.com/rancher/rancher-compose/releases/download/$RANCHER_COMPOSE_VERSION/rancher-compose-linux-amd64-$RANCHER_COMPOSE_VERSION.tar.gz" > /tmp/rancher-compose.tar.gz 
sudo tar --strip-components=1 -xzf /tmp/rancher-compose.tar.gz -C /usr/local/bin 
sudo chmod +x /usr/local/bin/rancher-compose

printf "\n\nVersions:\n"
printf "  Docker: $(docker --version)\n"
printf "  Docker Compose: $(docker-compose --version)\n"
printf "  Rancher Compose: $(rancher-compose --version)\n"
printf "===============================\n\n\n"
