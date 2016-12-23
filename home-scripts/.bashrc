#!/bin/bash
#############################################
########### DAN'S SHELL INIT FILE ###########
# Tested on: Debian/Ubuntu, Fedora, Mac OSX #
# Source: https://github.com/justsml/system-setup-tools/edit/master/home-scripts/.bashrc
# Note: Must be added to your home folder's `.bashrc` or `.*profile` or whatever your OS uses.

# PRE REQ / PRE INSTALL
# apt-get update && apt-get install -y curl pv wget sudo iotop htop apt-transport-https ca-certificates strace ltrace
# INSTALL: w/ bash_aliases (appends to existing) 
# curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bashrc >> ~/.bashrc    &&    curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases >> ~/.bash_aliases
# OR OVERWRITE existing scripts:
# curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bashrc > ~/.bashrc    &&    curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases > ~/.bash_aliases

# If not running interactively, don't do anything more
case $- in
  *i*) ;;
    *) return;;
esac

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# don't add duplicate lines #> See bash(1) for more options
# for history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTCONTROL=ignoredups
HISTSIZE=15000
HISTFILESIZE=15000

if [[ -f "$(which shopt 2>/dev/null)" ]]; then
  # append to the history file, don't overwrite it
  shopt -s histappend
  # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
  shopt -s checkwinsize
fi

# NOTE: Alias definitions are in ~/.bash_aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# enable programmable completion features 
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### GPG Agent setup http://harryrschwartz.com/2014/11/05/configuring-gpg-agent-on-a-mac.html
if [[ $(uname) == Darwin ]]; then
  export GPG_TTY=$(tty)

  if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
  fi
fi

# Add RVM to PATH
[ -d "$HOME/.rvm/bin" ] && export PATH="$PATH:$HOME/.rvm/bin" 

# Default to local profile install
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
