let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-h': 'vsplit' }
nnoremap <silent> <leader>ffl :Files<CR>
nnoremap <silent> <leader>fft :Filetypes<CR>
nnoremap <silent> <leader>fsr :Rg<CR>
nnoremap <silent> <leader>fsa :Ag<CR>
nnoremap <silent> <leader>fm :Marks<CR>
nnoremap <silent> <leader>fhb :History<CR>
nnoremap <silent> <leader>fhs :History/<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>fbc :BCommits<CR>
nnoremap <silent> <leader>fy :call scottconfig#registers#show_in_fzf('<bang>' ==# '!')<CR>
