#!/bin/bash -e

domain_list=$1
domain_list=${domain_list-"example.com"}

docker run -it --rm -p 443:443 -p 80:80 --name certbot \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            quay.io/letsencrypt/letsencrypt:latest certonly \
            --noninteractive \
            --expand --allow-subset-of-names \
            --agree-tos --rsa-key-size 4096 \
            --email postmaster@example.com \
            --domains $domain_list
            

