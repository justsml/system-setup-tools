### DAN'S SHELL ALIASES FILE ###
# Tested on: Debian/Ubuntu, Fedora, Mac OSX
# Source: https://github.com/justsml/system-setup-tools/edit/master/home-scripts/.bash_aliases
# Note: Must be added to run from your profile/rc script `.bashrc` or `.profile` or whatever your OS uses.

# Add next line to `~/.bashrc` 
# [ -f ~/.bash_aliases ] && source ~/.bash_aliases || echo "Startup Warning: Cannot find expected ~/.bash_aliases file."

# ** Rsync copy preserve-Attribs, Recursive, w/ Progress
alias cpsync='rsync -WarP'
alias copy='rsync -WarP'

# *** list startup services - No Mac Support. launchctrl. pffff.
alias service-list="chkconfig --list | grep '3:on'"
alias services-all="chkconfig --list | grep '3:on'"

# *** Bring es6-ish harmony to the lands
alias node='node --harmony --harmony_modules --harmony_sloppy_function --harmony_sloppy_let --harmony_arrow_functions --harmony_default_parameters --harmony_destructuring'

# ** monitor logs
alias alog='sudo tail -500f /var/log/auth.log'
alias slog='sudo tail -500f /var/log/syslog'
alias mlog='sudo tail -500f /var/log/messages'

# *** See port status
alias ports-all='netstat -pawnt'
alias ports-open='netstat -pawnt | grep LISTEN'
alias ports-active='netstat -pawnt | grep ESTABLISHED'

# ** List all IP addresses
alias ips='hostname --all-ip-addresses'

# ** List paths
alias path='echo -e ${PATH//:/\\n}'

# *** Extend gnu cmds
alias ll='ls -lachF'
alias la='ls -A'
alias l='ls -C'
alias lsbig='ls -lachS'
alias lsnew='ls -lacht'

# *** Disk space in human terms
alias df='df -h'
alias du='du -h -c -x'
alias dud='du -d 1 -h -c -x'
alias du1='du -d 1 -h -c -x'
alias du2='du -d 2 -h -c -x'
alias du3='du -d 3 -h -c -x'

# Old Misc Polyfills 
alias cls='clear'

# *** Add Named Colors 
# (credit: SiegeX - http://stackoverflow.com/questions/4332478/read-the-current-text-color-in-a-xterm/4332530#4332530 )
#   Examples: 
#     printf "%40s\n" "${BLUE}This text is blue${NORMAL}"
#     echo "${RED}this is red ${NORMAL}this is normal
BLACK=$(tput setaf 0)
BLUE=$(tput setaf 4)
BRIGHT=$(tput bold)
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
LIME_YELLOW=$(tput setaf 190)
MAGENTA=$(tput setaf 5)
NORMAL=$(tput sgr0)
POWDER_BLUE=$(tput setaf 153)
RED=$(tput setaf 1)
WHITE=$(tput setaf 7)
YELLOW=$(tput setaf 3)
# Font styles:
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

### === END DAN'S ALIASES === ###

