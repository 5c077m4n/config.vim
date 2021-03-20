#!/bin/sh

cat > ~/.vimrc << END
function! s:get_plug_install_dir()
	if has('nvim')
		return stdpath('config') . '/.config/nvim/plugged'
	elseif has('gui_macvim')
		return '$HOME/.config/macvim/plugged'
	else
		return '$HOME/.vim/plugged'
	endif
endfunction

call plug#begin(<SID>get_plug_install_dir())
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mkitt/tabline.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Install ranger plugin when not in macvim
if !has('gui_macvim')
	Plug 'francoiscabrol/ranger.vim'
endif

Plug 'townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'itspriddle/vim-shellcheck'
Plug 'mbbill/undotree'
Plug 'puremourning/vimspector'

" Install Floaterm only when in neovim
if has('nvim')
	Plug 'voldikss/vim-floaterm'
endif

Plug '5c077m4n/scottconfig.vim', { 'do': './install.sh' }
call plug#end()
END

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
