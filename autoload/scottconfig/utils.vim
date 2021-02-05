let s:is_vim = !has('nvim')
let s:is_nvim = has('nvim')
let s:is_gvim = get(v:, 'progname', '') ==# 'gvim' || has('gui_macvim')

function! scottconfig#utils#CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

function! scottconfig#utils#GetVimConfigPath()
	if is_nvim
		return $HOME.'/.config/nvim/init.vim'
	elseif is_gvim
		return $HOME.'/.gvimrc'
	elseif is_vim
		return $HOME.'/.vimrc'
	else
		echohl Error
		echom "This version of Vim is unsupported"
		echohl None
		sleep 2

		return $HOME.'/.vimrc'
	endif
endfunction

function! scottconfig#utils#CheckBackSpace()
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! scottconfig#utils#ShowDocumentation()
	if index(['vim', 'help'], &filetype) >= 0
		execute 'h '.expand('<cword>')
	elseif coc#rpc#ready()
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction
