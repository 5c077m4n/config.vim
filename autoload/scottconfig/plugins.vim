function! scottconfig#plugins#PlugDeregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
  call remove(g:plugs_order, index(g:plugs_order, name))
endfunction

function! scottconfig#plugins#GetInstallDir()
	if g:scottconfig#vars#is_nvim
		return $HOME.'/.config/nvim/plugged'
	elseif g:scottconfig#vars#is_gvim
		return $HOME.'/config/macvim/plugged'
	elseif g:scottconfig#vars#is_vim
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
	if g:scottconfig#vars#is_nvim
		silent !curl -fLo
					\ "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
					\ --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	elseif g:scottconfig#vars#is_vim
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
