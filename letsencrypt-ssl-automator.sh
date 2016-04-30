#!/bin/bash
set -e
# Automatically setup letsencrypt (https://github.com/letsencrypt/letsencrypt)
# and signup for given domain
# Note: Requires port 80 for (temporary) use as a standalone webserver to acquire cert(s)

VERSION=0.5.0

# The following 3 functions define this script
function download () {
  curl --progress-bar -o ./letsencrypt.tar.gz -SL https://github.com/letsencrypt/letsencrypt/archive/v${VERSION}.tar.gz
  tar -xvf letsencrypt.tar.gz
  mv letsencrypt-${VERSION} letsencrypt

}
function renew () {
  ~/letsencrypt/letsencrypt-auto renew --force-renewal
}
function get_certs () {
  [ ! -s "$DOMAIN" ] && printf "\nERROR: Ahhh! Required DOMAIN env var not specified\n" && exit -99
  [ ! -s "$EMAIL" ] && printf "\nERROR: Ahhh! Required EMAIL env var not specified\n" && exit -98

  ~/letsencrypt/letsencrypt-auto certonly \
    -a standalone \
    --text \
    --agree-tos \
    --rsa-key-size 4096 \
    --email $EMAIL \
    -d $DOMAIN
    # Add extra domains like so:
    # -d beta.example-domain \
    # -d blog.example-domain \
}



#########################
# Here's where the script's logic is defined
#########################

# Home dir to start
cd ~/
# Download if missing
[ ! -d ~/letsencrypt ] && download

# Now, renew if existing or try run auto-request certs via a standalone webserver, to be run on port 80
if [ -d /etc/letsencrypt/archive ]; then
  renew
else
  get_certs
fi


