# .bashrc

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

