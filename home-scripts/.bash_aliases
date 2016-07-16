
# ** Rsync copy preserve-Attribs, Recursive, w/ Progress
alias cpsync='rsync -WarP'
alias copy='rsync -WarP'

# *** list startup services
alias service-list="chkconfig --list | grep '3:on'"
alias services-all="chkconfig --list | grep '3:on'"

# *** Bring harmony to the lands
alias node='node  --harmony --harmony_modules --harmony_sloppy_function --harmony_sloppy_let --harmony_arrow_functions --harmony_default_parameters --harmony_destructuring'

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

# Turn color on if we can
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# *** Extend gnu cmds
alias ll='ls -lachF --color=always'
alias la='ls -A --color=always'
alias l='ls -CF --color=always'
alias lsbig='ls -lachS --color=always'
alias lsnew='ls -lacht --color=always'

# *** Disk space in human terms
alias df='df -h'
alias du='du -h -c'
alias dud='du --max-depth=1 -h -c'
alias du1='du --max-depth=1 -h -c'
alias du2='du --max-depth=2 -h -c'
alias du3='du --max-depth=3 -h -c'

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

BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

