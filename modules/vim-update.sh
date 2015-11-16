#!/bin/bash
set -e


function check_paths () {
	if [ ! -d ~/.vim/colors ]; then
		mkdir -p ~/.vim/colors
		printf "VIM: created folder             ~/.vim/colors\n"
	else
		printf "VIM: folder already exists      ~/.vim/colors\n"
	fi

	if [ ! -f ~/.vimrc ]; then
		touch ~/.vimrc
		cat > ~/.vimrc <<-'EOF'
			syntax on
			colorscheme desert
		EOF
		printf "VIM: created file             ~/.vimrc\n"
	else
		printf "VIM: file already exists      ~/.vimrc\n"
	fi
}

function get_themes () {
	cd ~/.vim/colors
	[ ! -e ./onedark.vim ] && wget https://raw.githubusercontent.com/geoffharcourt/one-dark.vim/master/colors/onedark.vim
	[ ! -e ./ubaryd.vim ] && wget https://raw.githubusercontent.com/Donearm/Ubaryd/master/colors/ubaryd.vim
	[ ! -e ./antares.vim ] && wget https://raw.githubusercontent.com/Haron-Prime/Antares/master/colors/antares.vim
	[ ! -e ./molokai_dark.vim ] && wget https://raw.githubusercontent.com/fcevado/molokai_dark/master/colors/molokai_dark.vim
	[ ! -e ./materialbox.vim ] && wget https://raw.githubusercontent.com/mkarmona/materialbox/master/colors/materialbox.vim
	[ ! -e ./colorsbox-stnight.vim ] && wget https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-stnight.vim
	[ ! -e ./colorsbox-faff.vim ] && wget https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-faff.vim
	[ ! -e ./colorsbox-stblue.vim ] && wget https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-stblue.vim
	[ ! -e ./colorsbox-stbright.vim ] && wget https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-stbright.vim
	[ ! -e ./colorsbox-material.vim ] && wget https://raw.githubusercontent.com/mkarmona/colorsbox/master/colors/colorsbox-material.vim
}

function vim_check () {
	is_installed=$(dpkg --status vim-nox | grep 'Status:.*install')
	if [ ! -e /etc/debian_version ]; then
		printf "UNSUPPORTED: Only debian-based platforms supported\n"
		sleep 3s
		exit -99
	fi

	if [[ $is_installed =~ "install" ]]; then
		printf "VIM: Success: vim-nox package already installed\n"
	else
		printf "VIM: installing needed packages: vim-nox\n"
		sudo apt-get update && apt-get install -y vim-nox wget
	fi
}

check_paths
vim_check
get_themes
