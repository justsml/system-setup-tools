
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


# Clear the terminal
alias cls='clear'
