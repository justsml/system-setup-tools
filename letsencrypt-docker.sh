#!/bin/bash
set -e

# USAGE
# export HOSTNAMES=danlevy.net,www.danlevy.net,app.danlevy.net && curl -L https://raw.githubusercontent.com/justsml/system-setup-tools/master/letsencrypt-docker.sh | HOSTNAMES="$HOSTNAMES" bash

domain_list=${HOSTNAMES-"`hostname -f`"}
first_domain=$(echo $domain_list | sed 's/,/\n/g' | head -n 1)

if [ -d "/etc/letsencrypt/live/$first_domain" ]; then
  docker run -it --rm -p 443:443 -p 80:80 --name certbot \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            quay.io/letsencrypt/letsencrypt:latest renew
else
  docker run -it --rm -p 443:443 -p 80:80 --name certbot \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            quay.io/letsencrypt/letsencrypt:latest certonly \
            --standalone --noninteractive \
            --expand --allow-subset-of-names \
            --agree-tos --rsa-key-size 2048 \
            --email postmaster@$first_domain \
            --domains $domain_list
fi

# Update certs in shared 'local' or volume-mounted cert location
mkdir -p /certs/$first_domain
cp -raL /etc/letsencrypt/live/$first_domain/*.pem /certs/$first_domain/

# Now, always override local/vol-mounted /certs/*.pem
cp -raL /certs/$first_domain/* /certs/

# # override if no default /certs/ keys exist already
# if [ ! -f /certs/fullchain.pem ]; then
#  cp -raL /certs/$first_domain/* /certs/
# fi
