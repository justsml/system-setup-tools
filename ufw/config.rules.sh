#!/bin/bash
set -e
# make sure ufw is installed
[ ! -s "$(which ufw)" ] && apt-get update && apt-get install ufw -y

# Setup Firewall on Docker host using UFW - Applies hardened defaults (nb: ufw cmds are more readable)
ufw logging medium

# Block all the things
ufw default deny incoming
ufw default deny outgoing

# inbound rules (recommended: change default SSH port to anything else - or use Port Knocking - see https://www.github.com/mrash/fwknop )
ufw allow 80/tcp
ufw allow 443/tcp
ufw limit ssh/tcp

# outbound exceptions (restrict DNS host ips if you feel like going hardcore)
ufw allow out on eth0 to any port 53 proto udp
ufw allow out on eth0 from 0.0.0.0/0 to any port 80 proto tcp
ufw allow out on eth0 from 0.0.0.0/0 to any port 443 proto tcp
ufw allow out on docker0 to any port 53 proto udp
ufw allow out on docker0 to any port 80 proto tcp
ufw allow out on docker0 to any port 443 proto tcp

# For restricted remote access to docker-machine & docker-swarm add YOUR IP to var $REMOTE_IP
# (e.g. use your current ISP given IP or other orchestrator host IP)
[ -n "$REMOTE_IP" ] && ufw allow proto tcp from $REMOTE_IP to any port 2376

ufw enable
