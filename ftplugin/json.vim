let b:BuffEnter='syntax sync fromstart'
let b:BuffLeave='syntax sync clear'
syntax match Comment +\/\/.\+$+

runtime! lib/coc_commands.vim
