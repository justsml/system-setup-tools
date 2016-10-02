#!/bin/bash
set -e

# Credit:
# https://raw.githubusercontent.com/justsml/system-setup-tools/
# /modules/vim-update.sh

function check_options () {
  [ "$(grep '^\s*set tabstop' ~/.vimrc)" == "" ] && echo 'set tabstop=2' >> ~/.vimrc || echo "tabstop already set"
  [ "$(grep '^\s*set softtabstop' ~/.vimrc)" == "" ] && echo 'set softtabstop=2' >> ~/.vimrc || echo "softtabstop already set"
  [ "$(grep '^\s*set expandtab' ~/.vimrc)" == "" ] && echo 'set expandtab' >> ~/.vimrc || echo "expandtab already set"
  [ "$(grep '^\s*set cursorline' ~/.vimrc)" == "" ] && echo 'set cursorline' >> ~/.vimrc || echo "cursorline already set"
  [ "$(grep '^\s*filetype indent' ~/.vimrc)" == "" ] && echo 'filetype indent on' >> ~/.vimrc || echo "filetype already set"
  [ "$(grep '^\s*syntax' ~/.vimrc)" == "" ] && echo 'syntax enable' >> ~/.vimrc || echo "syntax already enabled"
  [ "$(grep '^\s*set hlsearch' ~/.vimrc)" == "" ] && echo 'set hlsearch' >> ~/.vimrc || echo "search highlighting already enabled"

  if [ "$(grep '^\s*nnoremap .F2.' ~/.vimrc)" == "" ]; then
    echo '# Set F2 to toggle paste mode' >> ~/.vimrc
    echo 'nnoremap <F2> :set invpaste paste?<CR>' >> ~/.vimrc
    echo 'set pastetoggle=<F2>' >> ~/.vimrc
    echo 'set showmode' >> ~/.vimrc    
  else
    echo "syntax already enabled"
  fi
}

function check_paths () {
	if [ ! -d ~/.vim/colors ]; then
		mkdir -p ~/.vim/colors
		printf "VIM: created folder             ~/.vim/colors\n"
	else
		printf "VIM: Success: folder already exists      ~/.vim/colors\n"
	fi

	if [ ! -f ~/.vimrc ]; then
		touch ~/.vimrc
		cat > ~/.vimrc <<-'EOF'
			syntax on
			colorscheme desert
		EOF
		printf "VIM: created file               ~/.vimrc\n"
	else
		printf "VIM: Success: file already exists        ~/.vimrc\n"
	fi
}

function get_themes () {
	# printf "VIM: checking for themes \n"
	cd ~/.vim/colors
	[ ! -e ./onedark.vim ] && \
		curl --progress-bar \
			-o ./onedark.vim -SL https://raw.githubusercontent.com/geoffharcourt/one-dark.vim/master/colors/onedark.vim
	[ ! -e ./ubaryd.vim ] && \
		curl --progress-bar \
			-o ./ubaryd.vim -SL https://raw.githubusercontent.com/Donearm/Ubaryd/master/colors/ubaryd.vim
	[ ! -e ./antares.vim ] && \
		curl --progress-bar \
			-o ./antares.vim -SL https://raw.githubusercontent.com/Haron-Prime/Antares/master/colors/antares.vim
	[ ! -e ./molokai_dark.vim ] && \
		curl --progress-bar \
			-o ./molokai_dark.vim -SL https://raw.githubusercontent.com/fcevado/molokai_dark/master/colors/molokai_dark.vim
	[ ! -e ./materialbox.vim ] && \
		curl --progress-bar \
			-o ./materialbox.vim -SL https://raw.githubusercontent.com/mkarmona/materialbox/master/colors/materialbox.vim
	[ ! -e ./colorsbox-stnight.vim ] && \
		curl --progress-bar \
			-o ./colorsbox-stnight.vim -SL https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-stnight.vim
	[ ! -e ./colorsbox-faff.vim ] && \
		curl --progress-bar \
			-o ./colorsbox-faff.vim -SL https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-faff.vim
	[ ! -e ./colorsbox-stblue.vim ] && \
		curl --progress-bar \
			-o ./colorsbox-stblue.vim -SL https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-stblue.vim
	[ ! -e ./colorsbox-stbright.vim ] && \
		curl --progress-bar \
			-o ./colorsbox-stbright.vim -SL https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-stbright.vim
	[ ! -e ./colorsbox-material.vim ] && \
		curl --progress-bar \
			-o ./colorsbox-material.vim -SL https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-material.vim
	printf "VIM: Success: themes \n"
	cd ~/
}

function vim_check () {
	is_installed=$(dpkg --status vim-nox | grep 'Status:.*install')
	if [ ! -e /etc/debian_version ]; then
		printf "\nUNSUPPORTED: Currently only debian-base supported\n\n\n"
		sleep 3s
		exit -99
	fi

	if [[ $is_installed =~ "install" ]]; then
		printf "VIM: Success: vim-nox package already installed\n"
	else
		printf "VIM: installing needed packages: vim-nox\n"
		sudo apt-get update && \
				 apt-get install -y vim-nox curl
	fi
}

check_paths
vim_check
get_themes
check_options

