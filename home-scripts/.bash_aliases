# Clear the terminal
alias cls='clear'

# list startup services
alias service-list="chkconfig --list | grep '3:on'"
alias services-all="chkconfig --list | grep '3:on'"

# monitor logs
alias slog='tail -200f /var/log/syslog'
alias mlog='tail -200f /var/log/messages'
alias ips='hostname --all-ip-addresses'


# List path
alias path='echo -e ${PATH//:/\\n}'

# searching & stuff
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'

# ls modifiers - should be more helpful to use ll or l now
alias ls='ls --color=always'
alias ll='ls -lach --color=always'
 alias l='ls -lach --color=always'
alias la='ls -A --color=always'
alias lsbig='ls -lachS --color=always'
alias lsnew='ls -lacht --color=always'

alias dir='dir --color=always'
alias vdir='vdir --color=always'

# Disk space in human sizes, with sum total
alias df='df -h'
alias du='du -h -c'
alias dud='du --max-depth=1 -h -c'
alias du1='du --max-depth=1 -h -c'
alias du2='du --max-depth=2 -h -c'
alias du3='du --max-depth=3 -h -c'
