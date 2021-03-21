" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	let b:BuffEnter='syntax sync fromstart'
	let g:termdebugger='rust-gdb'

	if g:scottconfig#vars#is_mac
		let g:rust_clip_command = 'pbcopy'
	else
		let g:rust_clip_command = 'xclip -selection clipboard'
	endif

	runtime! lib/coc_commands.vim lib/term_debug.vim
endif
