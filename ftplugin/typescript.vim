" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	let b:BuffEnter='syntax sync fromstart'
	"setlocal foldmethod=syntax

	runtime! lib/coc_commands.vim lib/term_debug.vim
endif
