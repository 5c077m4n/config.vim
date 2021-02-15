# 5c077m4n's vim configuration

In order to use this plugin add this to your `.vimrc`/`init.vim`/`.gvimrc`/whatever file:

```vim
function! s:get_plug_install_dir()
	if has('nvim')
		return $HOME.'/.config/nvim/plugged'
	elseif has('gui_macvim')
		return $HOME.'/config/macvim/plugged'
	else
		return $HOME.'/.vim/plugged'
	endif
endfunction

call plug#begin(<SID>get_plug_install_dir())
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" install ranger plugin when not in macvim
if !has('gui_macvim')
	Plug 'francoiscabrol/ranger.vim'
endif

Plug 'townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'itspriddle/vim-shellcheck'
Plug 'mbbill/undotree'
Plug 'eliba2/vim-node-inspect'
Plug 'voldikss/vim-floaterm'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug '5c077m4n/scottconfig.vim'
call plug#end()
```

and to disable:
```vim
let g:disable_scott_config = 1
```
