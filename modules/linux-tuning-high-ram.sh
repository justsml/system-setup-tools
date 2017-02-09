#!/bin/bash

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

exit 0
## Shit below is still in testing, (alpha quality)

# Tune NETWORK configuration for 2-10G+ Ethernet + Many Connections
# Credit: https://fasterdata.es.net/host-tuning/linux/
if [ "$(egrep "mem_max.?=.?[0-9]{7,}" /etc/sysctl.conf)" == "" ]; then
  cat << HEREDOC >> /etc/sysctl.conf
# Allow up to 64MB per socket - it will virtually never consume that much.
# net.core.rmem_max = 67108864 
# net.core.wmem_max = 67108864 
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
net.core.somaxconn = 4096
net.ipv4.ip_local_port_range = 4096 65535
HEREDOC
fi



