function! scottconfig#CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

function! scottconfig#GetVimConfigPath()
	if has('nvim')
		return $HOME . '/.config/nvim/init.vim'
	elseif has('gui_macvim')
		return $HOME . '.gvimrc'
	else
		return $HOME . '/.vimrc'
	endif
endfunction

function! scottconfig#GetCocExtensions()
	let l:coc_ext = ['coc-prettier']

	if &filetype ==? 'json'
		let l:coc_ext += ['coc-json']
	elseif index(['ts', 'tsx', 'typescriptreact', 'js', 'jsx', 'javascriptreact'], &filetype) != -1
		let l:coc_ext += ['coc-tsserver', 'coc-jest', 'coc-eslint', 'coc-react-refactor', 'coc-sql']
	elseif &filetype ==? 'html'
		let l:coc_ext += ['coc-html']
	elseif index(['css', 'scss', 'less'], &filetype) != -1
		let l:coc_ext += ['coc-css']
	elseif index(['yml', 'yaml'], &filetype) != -1
		let l:coc_ext += ['coc-yaml']
	elseif index(['shell', 'sh'], &filetype) != -1
		let l:coc_ext += ['coc-sh']
	elseif &filetype ==? 'sql'
		let l:coc_ext += ['coc-sql']
	elseif &filetype ==? 'rust'
		let l:coc_ext += ['coc-rust-analyzer']
	elseif &filetype ==? 'toml'
		let l:coc_ext += ['coc-toml']
	endif

	return l:coc_ext
endfunction

function! scottconfig#GetPlugInstallDir() abort
	if has('nvim')
		return $HOME . '/.config/nvim/plugged'
	elseif has('gui_macvim')
		return $HOME . '/config/macvim/plugged'
	else
		return $HOME . '/.vim/plugged'
	endif
endfunction


function! scottconfig#CheckBackSpace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction


function! scottconfig#ShowDocumentation()
	if index(['vim', 'help'], &filetype) >= 0
		execute 'h '.expand('<cword>')
	elseif coc#rpc#ready()
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

function! scottconfig#InstallPlug() abort
	if exists(':PlugInstall')
		return
	endif

	if has('nvim')
		silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
					\https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	elseif
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
					\https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	endif
endfunction
