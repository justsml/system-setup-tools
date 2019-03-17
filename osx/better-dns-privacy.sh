#!/bin/bash
set -e

echo "> CURRENT DNS SERVERS:"
networksetup -getdnsservers Wi-Fi
networksetup -setdnsservers Wi-Fi \
  9.9.9.9    1.1.1.1    8.8.8.8
# Quad 9    Cloudflare  Google

echo "> DNS SERVERS UPDATED"

