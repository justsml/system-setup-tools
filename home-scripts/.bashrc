#!/bin/bash
# dan's .bashrc file -
# Automation: http://www.danlevy.net/2015/04/06/docker-server-setup-notes/
# Source:     https://github.com/justsml/system-setup-tools/home-scripts/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Color prompt
color_prompt=yes
force_color_prompt=yes
if [ "$color_prompt" = "yes" ]; then
  # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[00m\]@\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # darkyellow
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;29m\]\u\[\033[00m\]@\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # grey
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u\[\033[00m\]@\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # red host:
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # green
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u\[\033[00m\]\[\033[01;30m\]@\[\033[00m\]\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # blue
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[00m\]@\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # blue
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u\[\033[00m\]@\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # purple
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u\[\033[00m\]@\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # teal
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[00m\]@\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # white
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\u\[\033[00m\]@\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# USE THIS FOR NOW
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u\[\033[00m\]\[\033[01;30m\]@\[\033[00m\]\[\033[01;35m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

else
  PS1='${debian_chroot:+($debian_chroot)}\u@\H:\w\$ '
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTCONTROL=ignoredups
HISTSIZE=2000
HISTFILESIZE=4000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# DON'T ENABLE - ** NEEDS TO BE RECURSIVE
# shopt -s globstar

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Global Install Now! 2015-05-10
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

