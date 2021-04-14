function! scottconfig#registers#get() abort
	redir => l:regs
	silent registers
	redir END

	return split(l:regs, '\n')[1:]
endfunction

function! scottconfig#registers#show_in_fzf(...) abort
	let l:opts = {
				\ 'source': scottconfig#registers#get(),
				\ 'sink': {x -> feedkeys(matchstr(x, '\v^\S+\ze.*') . (a:1 ? 'P' : 'p'), 'x')},
				\ 'options': '--prompt="Reg> "'
				\ }
	call fzf#run(fzf#wrap(l:opts))
endfunction
