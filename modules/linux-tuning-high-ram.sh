#!/bin/bash

# PERFORMANCE TUNING SCRIPT
# Set high thread, socket & process limits.
# TARGET: large servers w/ +64-256GB RAM

if [ "$(egrep "kernel.threads-max" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
#           Default: 253572
kernel.threads-max = 256000
HEREDOC
fi
if [ "$(egrep "kernel.max_pid" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
# Default          32768
kernel.pid_max = 4194303
HEREDOC
fi
if [ "$(egrep "vm.max_map_count" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
#          Default: 65530
vm.max_map_count = 600000
HEREDOC
fi

# exit 0

# Tune NETWORK configuration for 2-10G+ Ethernet + Many Connections
# Credit: https://fasterdata.es.net/host-tuning/linux/
if [ "$(egrep "mem_max.?=.?[0-9]{7,}" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
# Defaults: 212K. Now: 16.7M
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
HEREDOC
fi
if [ "$(egrep "ipv4.tcp_mem" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
# this gives the kernel more memory for tcp
# which you need with many (100k+) open socket connections
net.ipv4.tcp_mem = 50576   64768   98152
# net.core.netdev_max_backlog = default 1000
net.core.netdev_max_backlog = 2500
HEREDOC
fi
if [ "$(egrep "tcp_rmem" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
# increase Linux autotuning TCP buffer limit to 32MB
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
HEREDOC
fi
if [ "$(egrep "tcp_syncookies" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
net.ipv4.tcp_syncookies = 1
# net.ipv4.tcp_syn_retries = 2
# net.ipv4.tcp_synack_retries = 2
HEREDOC
fi
# Credit: https://www.linode.com/docs/websites/nginx/configure-nginx-for-optimized-performance
if [ "$(egrep "tcp_max_tw_buckets" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
#                     Default: 131072
net.ipv4.tcp_max_tw_buckets = 1440000
HEREDOC
fi
if [ "$(egrep "net.ipv4.tcp_fin_timeout" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
# Default 60 - too long, easy to "find" low-key DoS attack
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
# default usually under 1024, it could be risky opening up this too big if we don't restrict timeouts elsewhere
net.ipv4.tcp_max_syn_backlog = 3240000
HEREDOC
fi

if [ "$(egrep "somaxconn.?=.?[0-9]{4,}" /etc/sysctl.conf)" == "" ]; then
cat << HEREDOC >> /etc/sysctl.conf
# The maximum number of "backlogged sockets".  Default is 128.
net.core.somaxconn = 16384
# net.core.somaxconn = 4096
net.ipv4.ip_local_port_range = 4096 65535
HEREDOC
fi



