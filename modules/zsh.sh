#!/bin/bash

function setup () {
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sleep 2s
  printf "\n Oh My ZSH Instller Dunzo!\n"
}
if [[ ! -d ~/.oh-my-zsh ]]; then
  setup ()
fi
if [[ -e "$HOME/.zsh_aliases" ]]; then
  . "$HOME/.zsh_aliases"
elif [[ -e "$HOME/.bash_aliases" ]]; then
  . "$HOME/.bash_aliases"
fi

