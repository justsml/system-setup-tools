# Clear the terminal
alias cls='clear'

# list startup services
alias service-list="chkconfig --list | grep '3:on'"
alias services-all="chkconfig --list | grep '3:on'"

# Bring harmony to the land
alias node='node --harmony --harmony_arrow_functions'

# monitor logs
alias slog='sudo tail -100f /var/log/syslog'
alias mlog='sudo tail -100f /var/log/messages'
alias ips ='hostname --all-ip-addresses'

# List paths
alias path='echo -e ${PATH//:/\\n}'

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -lachF --color=always'
alias la='ls -A --color=always'
alias l='ls -CF --color=always'
alias lsbig='ls -lachS --color=always'
alias lsnew='ls -lacht --color=always'

# Disk space in human terms
alias df='df -h'
alias du='du -h -c'
alias dud='du --max-depth=1 -h -c'
alias du1='du --max-depth=1 -h -c'
alias du2='du --max-depth=2 -h -c'
alias du3='du --max-depth=3 -h -c'
