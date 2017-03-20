#!/bin/bash

# Dan's BASH/Shell Aliases for Servers + Developer Workstations.
# GOAL: Ease Server Admin Tasks (with an emphasis on visibility/auditing)

# License: MIT
# Author: Dan Levy || www.DanLevy.net || github.com/justsml || twitter.com/justsml

# Tested on: Debian, Ubuntu, CentOS, Fedora. 
# Developed & tested on: OSX & Linux Mint

# ** View common linux logs
alias tail-auth='sudo tail -500f /var/log/auth.log'
alias tail-kern='sudo tail -500f /var/log/kern.log'
alias tail-syslog='sudo tail -500f /var/log/syslog'
alias tail-messages='sudo tail -500f /var/log/messages'


# Security & Audit Tools
alias scan-host="nmap -A -v -p1-65535 -T5 " # Example/Usage: `scan-host blog.danlevy.net`
alias scan-localnet="nmap -A --min-parallelism 8 -v -p1-65535 -T5 192.168.0.0/24 172.16.0.0/16 10.0.0.0/8"
# TODO: Add masscan examples

# ** List all IP addresses (see netlisteners helpers below)
if [[ "$(uname -s)" =~ ^"Darwin" ]]; then
  # Show Local IPs Assigned
  alias ips="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"
  # *** See port status
  alias ports-all='lsof -Pn -i4'
  alias ports-open='lsof -Pn -i4 | grep LISTEN'
  alias ports-active='lsof -Pn -i4 | grep ESTABLISHED'
else
  # Show Local IPs Assigned
  alias ips="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}' | sed s/addr://"
  # *** See port status
  alias ports-all='netstat -pawnt'
  alias ports-open='netstat -pawnt | grep LISTEN'
  alias ports-active='netstat -pawnt | grep ESTABLISHED'
fi
alias netlisteners='lsof -i -P | grep LISTEN'


#>>>> Start: Recovered from http://alias.sh

# List top ten largest files/directories in current directory
alias ducks='du -cks *|sort -rn|head -11'
alias dskload="ps faux|awk '\$8 ~ /D/{print}'"

# Find a String in the Entire Git History
alias findgit='git rev-list --all | xargs git grep -F'

# Search Shell Commands History (tip: add shopt config to .bashrc to enable 30000+ command saved)
# Usage: hs ssh
alias hs='history | grep --color=auto'
alias hsx='history | egrep --color=auto'
#<<<< End: alias.sh inspired content


# Start: Dan's Gnu Helper Aliases For Them Gnu Tools!
# ** List paths, one per line
alias paths='echo -e ${PATH//:/\\n}'

# *** Setup shortcuts for common gnu cmd + options
alias ll='ls -lach' # Recommended
alias la='ls -A'
alias l='ls -C'
alias lsbig='ls -lachS'
alias lss='lsbig'
alias lsnew='ls -lacht'
alias lt='lsnew'

# *** Disk space use in human terms
alias df='df -h'
alias du='du -h -c'
alias du1='du -d 1 -h -c' # Sums 1 folder deep, *follows symlinks*
alias du2='du -d 2 -h -c' # Sums 2 folder deep, *follows symlinks*
alias du3='du -d 3 -h -c' # Sums 3 folder deep, *follows symlinks*
# Only include same filesystem
alias dud='du -d 1 -h -c -x'
alias dud1='du -d 1 -h -c -x' # Sums 1 folder deep, same fs
alias dud2='du -d 2 -h -c -x' # Sums 2 folder deep, same fs
alias dud3='du -d 3 -h -c -x' # Sums 3 folder deep, same fs

# Old Misc Polyfills
alias cls='clear'


