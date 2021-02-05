" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	setl iskeyword+=@-@

	runtime! assets/coc_commands.vim
endif
