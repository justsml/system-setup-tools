##### Console Prompt Style:

## Red HOST, GREEN fldr
> PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;32m\] \W \$\[\033[00m\] '


## Red HOST, GREEN fldr name
> PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '

------------
## Short Prompt: user@Host & curr folder (\w) - e.g.:

```sh
# dan@dev30:bin$ echo 'HELLO'

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


## W/ User Name@Host - Full path (\W)
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
DARKYELLOW: [\033[01;29m\]
GREY:       [\033[01;30m\]
RED:        [\033[01;31m\]
GREEN:		  [\033[01;32m\]
YELLOW: 	  [\033[01;33m\]
BLUE:   	  [\033[01;34m\]
PURPLE: 	  [\033[01;35m\]
TEAL:   	  [\033[01;36m\]
WHITE:  	  [\033[01;37m\]



export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # white
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;29m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;28m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[00m\]@\[\033[01;31m\]\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

```
