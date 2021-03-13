" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	let b:BuffEnter='syntax sync fromstart'
	let g:termdebugger='rust-gdb'

	runtime! assets/coc_commands.vim
	" runtime! assets/vimspector.vim
	runtime! assets/term_debug.vim
endif
