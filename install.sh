#!/bin/sh

if [ -x "$(command -v nvim)" ]; then
	curl -fLo \
		"${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" \
		--create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
if [ -x "$(command -v vim)" ]; then
	curl -fLo \
		~/.vim/autoload/plug.vim \
		--create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

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

Plug '5c077m4n/scottconfig.vim'
call plug#end()
END
