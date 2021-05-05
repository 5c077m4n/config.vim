let b:BuffEnter='syntax sync fromstart'
let b:BuffLeave='syntax sync clear'

let g:termdebugger='rust-gdb'

if g:scottconfig#vars#is_mac
	let g:rust_clip_command = 'pbcopy'
else
	let g:rust_clip_command = 'xclip -selection clipboard'
endif

runtime! lib/coc_commands.vim lib/term_debug.vim
