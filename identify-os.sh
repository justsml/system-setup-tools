#!/bin/bash
#Author: Dan Levy <Dan@DanLevy.net>
#Credits: docker - https://github.com/docker/docker/blob/master/hack/install.sh

command_exists() {
  command -v "$@" > /dev/null 2>&1
}

lsb_dist=''
dist_version=''
if command_exists lsb_release; then
  lsb_dist="$(lsb_release -si)"
fi
if [ -z "$lsb_dist" ] && [ -r /etc/lsb-release ]; then
  lsb_dist="$(. /etc/lsb-release && echo "$DISTRIB_ID")"
fi
if [ "$lsb_dist" == "LinuxMint" ] || [ -z "$lsb_dist" ] && [ -r /etc/debian_version ]; then
  lsb_dist='debian'
fi
if [ -z "$lsb_dist" ] && [ -r /etc/fedora-release ]; then
  lsb_dist='fedora'
fi
if [ -z "$lsb_dist" ] && [ -r /etc/oracle-release ]; then
  lsb_dist='oracleserver'
fi
if [ -z "$lsb_dist" ]; then
  if [ -r /etc/centos-release ] || [ -r /etc/redhat-release ]; then
    lsb_dist='centos'
  fi
fi
if [ -z "$lsb_dist" ] && [ -r /etc/os-release ]; then
  lsb_dist="$(. /etc/os-release && echo "$ID")"
fi

lsb_dist="$(echo "$lsb_dist" | tr '[:upper:]' '[:lower:]')"

identify_os() {
  echo $lsb_dist
}



