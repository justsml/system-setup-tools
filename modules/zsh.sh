#!/bin/bash

export TOOLS_URI=https://raw.githubusercontent.com/justsml/system-setup-tools

function setup () {
  apt-get update && apt-get install -y zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sleep 2s
  printf "\n Oh My ZSH Instller Dunzo!\n"
}

function get_dot_files () {
  # printf "VIM: checking for themes \n"
  cd ~/.vim/colors
  [ ! -e ~/.zshrc ] && \
    curl --progress-bar \
      -o ~/.zshrc -SL $TOOLS_URI/master/home-scripts/.zshrc

}

if [[ ! -d ~/.oh-my-zsh ]]; then
  setup ()
fi
if [[ -e "$HOME/.zsh_aliases" ]]; then
  . "$HOME/.zsh_aliases"
elif [[ -e "$HOME/.bash_aliases" ]]; then
  . "$HOME/.bash_aliases"
else
  get_dot_files ()
fi
