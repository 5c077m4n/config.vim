function! scottconfig#utils#CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

function! scottconfig#utils#GetVimConfigPath()
	if has('nvim')
		return $HOME . '/.config/nvim/init.vim'
	elseif has('gui_macvim')
		return $HOME . '.gvimrc'
	else
		return $HOME . '/.vimrc'
	endif
endfunction

function! scottconfig#utils#CheckBackSpace() abort
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
