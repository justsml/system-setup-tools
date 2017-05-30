#!/bin/bash

## To Debug:
# set -x
# To Fail on Errors: set -e
#############################################
### DAN'S SHELL ALIASES FILE ################
# Tested on: Debian/Ubuntu, Fedora, Mac OSX #
# Source: https://github.com/justsml/system-setup-tools/edit/master/home-scripts/.bash_aliases
# Note: Must be added to run from your profile/rc script `.bashrc` or `.profile` or whatever your OS uses.
#############################################
# INSTALL: (append both init & aliases to existing)
# curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bashrc >> ~/.bashrc
# curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases >> ~/.bash_aliases
## ADVANCED: INSTALL BY FORCE - DONT DO THIS UNLESS YOU'VE READ THE SCRIPTS
# curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bashrc > ~/.bashrc && curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases > ~/.bash_aliases

KERNEL_NAME="$(uname -s)"
if [[ $KERNEL_NAME =~ ^"Darwin" ]]; then
  export OSX="true"
else
  export OSX="false"
fi
#### MAIN ALIASES ####

# ** Rsync copy preserve-Attribs, Recursive, w/ Progress
alias cpsync='rsync -WarP'
alias copy='rsync -WarP'

# *** list startup services - No Mac Support. launchctrl. pffff.
if [ -f "$(which chkconfig 2>/dev/null)" ]; then
  alias service-list="chkconfig --list | grep '3:on'"
  alias services-all="chkconfig --list | grep '3:on'"
fi
if [[ $KERNEL_NAME =~ ^"Darwin" ]]; then
  alias service-list="echo 'Haha, good luck with launchctl'"
  alias services-all="echo 'Haha, good luck with launchctl'"
else
  alias service-list="service --status-all"
  alias services-all="service --status-all"
fi

# *** Brings harmony to the lands
alias node='node --harmony '

# ** monitor logs
alias loga='sudo tail -500f /var/log/auth.log'
alias logs='sudo tail -500f /var/log/syslog'
alias logm='sudo tail -500f /var/log/messages'
# alias logk='sudo tail -500f /var/log/kern.log'

# ** List all IP addresses (see netspy & netlisteners helpers below)
alias ips="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\t -f2 | sed 's/[^0-9\.]*//g'"
if [[ "$OSX" == "true" ]]; then
  # *** See port status
  alias ports-all='lsof -Pn -i4'
  alias ports-open='lsof -Pn -i4 | grep LISTEN'
  alias ports-active='lsof -Pn -i4 | grep ESTABLISHED'
else
  # *** See port status
  alias ports-all='netstat -pawnt'
  alias ports-open='netstat -pawnt | grep LISTEN'
  alias ports-active='netstat -pawnt | grep ESTABLISHED'
fi

# ** List paths
alias paths='echo -e ${PATH//:/\\n}'

# *** Extend gnu cmds
alias ll='ls -lach'
alias la='ls -A'
alias l='ls -C'
alias lsbig='ls -lachS'
alias lss='lsbig'
alias lsnew='ls -lacht'
alias lt='lsnew'

# *** Disk space use in human terms
alias df='df -h'
alias du='du -h -c'
alias du1='du -d 1 -h -c' # Sums 1 folder deep
alias du2='du -d 2 -h -c' # Sums 2 folder deep
alias du3='du -d 3 -h -c' # Sums 3 folder deep
# Only include same filesystem
alias dud='du -d 1 -h -c -x'
alias dud1='du -d 1 -h -c -x' # Sums 1 folder deep, same fs
alias dud2='du -d 2 -h -c -x' # Sums 2 folder deep, same fs
alias dud3='du -d 3 -h -c -x' # Sums 3 folder deep, same fs

# Old Misc Polyfills
alias cls='clear'

#>>>> Recovered from http://alias.sh
#List top ten largest files/directories in current directory
alias ducks='du -cks *|sort -rn|head -11'
alias dskload="ps faux|awk '\$8 ~ /D/{print}'"
#Find a String in the Entire Git History
alias findgit='git rev-list --all | xargs git grep -F'
#history-search
alias hs='history | grep --color=auto'
alias hsx='history | egrep --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
#identify and search for active network connections
# netspy() { lsof -i -P +c 0 +M | grep -i "$1" }
# Extract almost any compressed format
# extractall () {
#   if [ -f $1 ] ; then
#     case $1 in
#       *.tar.bz2)   tar xjf $1     ;;
#       *.tar.gz)    tar xzf $1     ;;
#       *.bz2)       bunzip2 $1     ;;
#       *.rar)       unrar e $1     ;;
#       *.gz)        gunzip $1      ;;
#       *.tar)       tar xf $1      ;;
#       *.tbz2)      tar xjf $1     ;;
#       *.tgz)       tar xzf $1     ;;
#       *.zip)       unzip $1       ;;
#       *.Z)         uncompress $1  ;;
#       *.7z)        7z x $1        ;;
#       *)     echo "'$1' cannot be extracted via extractall()" ;;
#      esac
#   else
#      echo "'$1' is not a valid file"
#   fi
# }

# #Reconnect or start a tmux or screen session over ssh
# shux () { ssh -t "$1" 'tmux attach || tmux new || screen -DR'; }

# credit: http://mywiki.wooledge.org/BashFAQ/037
function init_term_cmds () {
  # only set if we're on an interactive session
  if [[ -t 2 ]]; then
    reset=$(    tput sgr0   || tput me 2>/dev/null) # Reset cursor
    bold=$(     tput bold   || tput md 2>/dev/null) # Start bold
    under=$(    tput smul   || tput us 2>/dev/null) # Start underline
    italic=$(   tput sitm   || tput ZH 2>/dev/null) # Start italic
    eitalic=$(  tput ritm   || tput ZH 2>/dev/null) # End italic
    default=$(  tput op                2>/dev/null)
    back=$'\b'

    if [[ $TERM != *-m ]]; then
      black=$(    tput setaf 0 || tput AF 0    2>/dev/null)
      red=$(      tput setaf 1 || tput AF 1    2>/dev/null)
      green=$(    tput setaf 2 || tput AF 2    2>/dev/null)
      yellow=$(   tput setaf 3 || tput AF 3    2>/dev/null)
      blue=$(     tput setaf 4 || tput AF 4    2>/dev/null)
      magenta=$(  tput setaf 5 || tput AF 5    2>/dev/null)
      cyan=$(     tput setaf 6 || tput AF 6    2>/dev/null)
      white=$(    tput setaf 7 || tput AF 7    2>/dev/null)

      onblue=$(   tput setab 4 || tput AB 4    2>/dev/null)
      ongrey=$(   tput setab 7 || tput AB 7    2>/dev/null)
    fi
  fi

  # osx's termcap doesn't have italics. The below adds support for iTerm2
  # and is harmless on Terminal.app
  if [ "$(get_platform)" == "osx" ]; then
    italic=$(echo -e "\033[3m")
    eitalic=$(echo -e "\033[23m")
  fi
  
  export back black blue bold cyan default eitalic green italic magenta onblue ongrey red reset under white yellow
}

function get_platform () {
  case `uname -s` in
    Darwin) echo "osx"    ;;
    Linux)  echo "linux"  ;;
    SunOS)  echo "sunos"  ;;
    *)      echo "common" ;;
  esac
}

## Run this town... code!
if [ -f "$(which tput)" ]; then
  # set_env_label
  # set_shell_prompt
  init_term_cmds
fi

if [ -z "$ZSH" ]; then
  # PS1='\[\e[1;31m\]Staging2 \[\e[1;33m\]\u@\[\e[1;35m\]\h:\w\$\[\e[0;32m\] '
  # export PS1="\[\e[31m\]\H \[\e[m\] \[\e[32m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\]: \[\e[36m\]\w\[\e[m\]\\$ "
  export PS1_BACKUP=$PS1
  if [ "$UID" == "0" ]; then
    user_color=$red
  else
    user_color=$green
  fi
  export PS1="${reset}${yellow}\H${white}@${user_color}\u${white}: ${cyan}\w${white}\$${reset} "
fi

export PS1="\[\e[31m\]\H \[\e[m\] \[\e[32m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\]: \[\e[36m\]\w\[\e[m\]\\$ "

### === END DAN'S ALIASES === ###
