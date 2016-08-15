#!/bin/bash
# To Debug: set -x
set -e

### DAN'S SHELL ALIASES FILE ###
# Tested on: Debian/Ubuntu, Fedora, Mac OSX
# Source: https://github.com/justsml/system-setup-tools/edit/master/home-scripts/.bash_aliases
# Note: Must be added to run from your profile/rc script `.bashrc` or `.profile` or whatever your OS uses.


# INSTALL:
# curl -sSL https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases >> ~/.bash_aliases


# Add next line to `~/.bashrc`
# [ -f ~/.bash_aliases ] && source ~/.bash_aliases || echo "Startup Warning: Cannot find expected ~/.bash_aliases file."

KERNEL_NAME="$(uname -s)"
[[ $KERNEL_NAME =~ ^"Darwin" ]] && OSX="true" || OSX="false"

## Helper Functions  --- Aliases Below ##
function get_env_label () {
  ### Get Env Name - uses first val:
  # VALID ENV's: [production, staging, test, qa, development] - Default = development
  ENV_NAME=$RUBY_ENV     # Check RUBY
  ENV_NAME=${ENV_NAME:=$RACK_ENV}     # Check RACK
  ENV_NAME=${ENV_NAME:=$RUST_ENV}     # Check NODE
  ENV_NAME=${ENV_NAME:=$NODE_ENV}     # Check NODE
  ENV_NAME=${ENV_NAME:=$PHP_ENV}      # Check Phfffp
  ENV_NAME=${ENV_NAME:=$GO_ENV}       # Check GO
  ENV_NAME=${ENV_NAME:="development"} # Fallback to 'development'

  # TRANSFORM INTO DISPLAY VALUE
  [[ "$ENV_NAME" =~ ^"pro".* ]]  && ENV_LABEL="${RED}[LIVE]  "
  [[ "$ENV_NAME" =~ ^"dev".* ]]  && ENV_LABEL="${MAGENTA}DEV     "
  [[ "$ENV_NAME" =~ ^"sta".* ]]  && ENV_LABEL="${LIME_YELLOW}STAGING "
  [[ "$ENV_NAME" =~ ^"tes".* ]]  && ENV_LABEL="${CYAN}TEST    "
  [[ "$ENV_NAME" =~ ^"qa".* ]]   && ENV_LABEL="${POWDER_BLUE}QA      "
  export ENV_LABEL="$ENV_LABEL"
  #return $ENV_LABEL
}


#### MAIN ALIASES ####

# ** Rsync copy preserve-Attribs, Recursive, w/ Progress
alias cpsync='rsync -WarP'
alias copy='rsync -WarP'

# *** list startup services - No Mac Support. launchctrl. pffff.
if [[ -f "$(which chkconfig)" ]]; then
  alias service-list="chkconfig --list | grep '3:on'"
  alias services-all="chkconfig --list | grep '3:on'"
fi

# *** Brings harmony to the lands (remove for old node versions)
NODE_VER="$(node -v 2>/dev/null)"
if [[ $NODE_VER =~ "(v6|v7|v8)" ]]; then
  # No alias needed?
  # Node version is new enough, some (or most) ES6/harmony features available...
  alias node='node --harmony --harmony_modules --harmony_sloppy_function --harmony_default_parameters'
else
  alias node='node --harmony --harmony_modules --harmony_sloppy_function --harmony_sloppy_let --harmony_arrow_functions --harmony_default_parameters --harmony_destructuring'
fi

# ** monitor logs
alias loga='sudo tail -500f /var/log/auth.log'
alias logs='sudo tail -500f /var/log/syslog'
alias logm='sudo tail -500f /var/log/messages'

# *** See port status
alias ports-all='netstat -pawnt'
alias ports-open='netstat -pawnt | grep LISTEN'
alias ports-active='netstat -pawnt | grep ESTABLISHED'

# ** List all IP addresses
if [[ OSX == "true" ]]; then
  alias ips="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"
else
  alias ips="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}' | sed s/addr://"
fi

# ** List paths
alias path='echo -e ${PATH//:/\\n}'

# *** Extend gnu cmds
alias ll='ls -lachF'
alias la='ls -A'
alias l='ls -C'
alias lsbig='ls -lachS'
alias lss='lsbig'
alias lsnew='ls -lacht'
alias lt='lsnew'

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
#     echo "${RED}this is red ${NORMAL}this is normal"
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

function set_env_label () {
  ### Get Env Name - uses first val:
  # VALID ENV's: [production, staging, test, qa, development] - Default = development
  ENV_NAME=$RUBY_ENV     # Check RUBY
  ENV_NAME=${ENV_NAME:=$RACK_ENV}     # Check RACK
  ENV_NAME=${ENV_NAME:=$NODE_ENV}     # Check NODE
  ENV_NAME=${ENV_NAME:=$PHP_ENV}      # Check Phfffp
  ENV_NAME=${ENV_NAME:=$GO_ENV}       # Check GO
  ENV_NAME=${ENV_NAME-"development"}  # Fallback to 'development'

  printf "\n\n\t****\nENV_NAME: $ENV_NAME\n\n"

# TRANSFORM INTO DISPLAY VALUE
  [[ "$ENV_NAME" =~ ^"pro".* ]]  && ENV_LABEL="[LIVE]  " && ENV_LABEL="${RED}$ENV_LABEL"
  [[ "$ENV_NAME" =~ ^"dev".* ]]  && ENV_LABEL="DEV     " && ENV_LABEL="${MAGENTA}$ENV_LABEL"
  [[ "$ENV_NAME" =~ ^"sta".* ]]  && ENV_LABEL="STAGING " && ENV_LABEL="${LIME_YELLOW}$ENV_LABEL"
  [[ "$ENV_NAME" =~ ^"tes".* ]]  && ENV_LABEL="TEST    " && ENV_LABEL="${CYAN}$ENV_LABEL"
  [[ "$ENV_NAME" =~ ^"qa".*  ]]  && ENV_LABEL="QA      " && ENV_LABEL="${POWDER_BLUE}$ENV_LABEL"
  export ENV_NAME="$ENV_NAME"
  export ENV_LABEL="$ENV_LABEL"
}

function set_shell_prompt () {
  ## e.g. export PS1="${CYAN}$ENV_LABEL${BRIGHT} :: ${GREEN}\u${NORMAL}@${POWDER_BLUE}\h${NORMAL}: ${YELLOW}\$ ${NORMAL} "
  ### *** SHELL PROMPT COLOR (root & non-root)
  if [[ "$UID" == "0" ]]; then
    # So, we's root
    # Prior ver: export PS1="\[\e[31m\]$ENV_NAME\[\e[m\] \[\e[32m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\]: \[\e[36m\]\w\[\e[m\]\\$ "
    export PS1="${MAGENTA}${BRIGHT}$ENV_LABEL${WHITE}: ${RED}\u${NORMAL}@${POWDER_BLUE}\h${NORMAL}: ${YELLOW}\$ ${NORMAL} "
  else
    export PS1="${CYAN}$ENV_LABEL${BRIGHT} :: ${GREEN}\u${NORMAL}@${POWDER_BLUE}\h${NORMAL}: ${YELLOW}\$ ${NORMAL} "
  fi
}

set_env_label

set_shell_prompt


### === END DAN'S ALIASES === ###
