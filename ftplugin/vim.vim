" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	syntax sync fromstart

	runtime! assets/coc_commands.vim
endif
