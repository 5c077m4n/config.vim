" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	"syntax sync fromstart
	"setlocal foldmethod=syntax

	runtime! assets/coc_commands.vim assets/node_inspect_commands.vim
endif
