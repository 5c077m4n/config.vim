" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	syntax sync fromstart
	syntax match Comment +\/\/.\+$+

	runtime! assets/coc_commands.vim
endif
