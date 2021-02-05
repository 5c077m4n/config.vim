let s:is_vim = !has('nvim')
let s:is_nvim = has('nvim')
let s:is_gvim = get(v:, 'progname', '') ==# 'gvim' || has('gui_macvim')

function! scottconfig#plugins#GetInstallDir()
	if s:is_nvim
		return $HOME.'/.config/nvim/plugged'
	elseif s:is_gvim
		return $HOME.'/config/macvim/plugged'
	elseif s:is_vim
		return $HOME.'/.vim/plugged'
	else
		echohl Error
		echom "This version of Vim is unsupported"
		echohl None
		sleep 2

		return $HOME.'/.vim/plugged'
	endif
endfunction

function! scottconfig#plugins#InstallPlug()
	if is_nvim
		silent !curl -fLo
					\ "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
					\ --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	elseif is_vim
		silent !curl -fLo
					\ ~/.vim/autoload/plug.vim
					\ --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	else
		echohl Error
		echom "This version of Vim is unsupported"
		echohl None
		sleep 2
	endif
endfunction
