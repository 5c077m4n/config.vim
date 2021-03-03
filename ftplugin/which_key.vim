" Only do this when not done yet for this buffer
if !exists("b:did_ftplugin")
	let b:BuffEnter='set laststatus=0 noshowmode noruler'
	let b:BuffLeave='set laststatus=2 showmode ruler'
endif
