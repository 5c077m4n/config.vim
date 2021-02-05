function! scottconfig#plugins#GetInstallDir() abort
	if has('nvim')
		return $HOME.'/.config/nvim/plugged'
	elseif has('gui_macvim')
		return $HOME.'/config/macvim/plugged'
	else
		return $HOME.'/.vim/plugged'
	endif
endfunction

function! scottconfig#plugins#InstallPlug() abort
	if has('nvim')
		silent !curl -fLo
					\"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
					\--create-dirs
					\https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	elseif
		silent !curl -fLo
					\~/.vim/autoload/plug.vim
					\--create-dirs
					\https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	endif
endfunction
