#!/bin/sh

cat "./lib/init.vim" > ~/.vimrc

while test $# -gt 0; do
	case "$1" in
		-i|--init)
			if [ -x "$(command -v nvim)" ]; then
				curl -fLo \
					"${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" \
					--create-dirs \
					https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
				nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
			fi
			if [ -x "$(command -v vim)" ]; then
				curl -fLo \
					~/.vim/autoload/plug.vim \
					--create-dirs \
					https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
				vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
			fi
			;;
		*)
			break
			;;
	esac
done
