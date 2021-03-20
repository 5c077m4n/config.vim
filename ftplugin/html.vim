" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	let b:BuffEnter='syntax sync fromstart'

	runtime! lib/coc_commands.vim
endif
