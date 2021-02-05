autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>qr <Plug>(coc-format-selected)
nmap <leader>qr <Plug>(coc-format-selected)

" format current buffer.
command! -nargs=0 Format :call CocAction('format')
" fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" organize imports of the current buffer.
command! -nargs=0 OrgImp :call CocAction('runCommand', 'editor.action.organizeImport')
