" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	let b:BuffEnter='syntax sync fromstart'
	let b:BuffLeave='syntax sync clear'

	runtime! lib/coc_commands.vim
endif
