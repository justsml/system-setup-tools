# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
  return
fi
PS1='\h:\W \u\$ '

set -o vi

# Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ -f ~/.bash/git-completion.sh ]; then
    source ~/.bash/git-completion.sh
fi

# `npm completion > ~/.bash/npm-completion.bash`
if [ -f ~/.bash/npm-completion.sh ]; then
    source ~/.bash/npm-completion.sh
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# enable the "z" command
# . `brew --prefix`/etc/profile.d/z.sh

# Default to local profile install
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
