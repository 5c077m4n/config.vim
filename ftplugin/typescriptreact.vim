" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	let b:BuffEnter='syntax sync fromstart'
	let b:BuffLeave='syntax sync clear'
	"setlocal foldmethod=syntax

	runtime! lib/coc_commands.vim lib/term_debug.vim
endif

" To beat the typescript-vim plug
runtime! lib/coc_commands.vim
