let g:scottconfig#vars#root = expand('<sfile>:h:h')

let g:scottconfig#vars#is_win = has('win32') || has('win64')
let g:scottconfig#vars#is_mac = has('mac') || has('macunix')

let g:scottconfig#vars#is_nvim = has('nvim')
let g:scottconfig#vars#is_gvim = get(v:, 'progname', '') ==# 'gvim' || has('gui_macvim')
let g:scottconfig#vars#is_vim = !g:scottconfig#vars#is_nvim && !g:scottconfig#vars#is_gvim
