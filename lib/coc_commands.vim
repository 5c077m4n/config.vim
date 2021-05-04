autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <buffer> <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <buffer> <silent> g] <Plug>(coc-diagnostic-next)
nmap <buffer> <silent> gd <Plug>(coc-definition)
nmap <buffer> <silent> gt <Plug>(coc-type-definition)
nmap <buffer> <silent> gi <Plug>(coc-implementation)
nmap <buffer> <silent> gr <Plug>(coc-references)
nmap <buffer> <leader>ac <Plug>(coc-codeaction)
nmap <buffer> <leader>qf <Plug>(coc-fix-current)
nmap <buffer> <leader>rn <Plug>(coc-rename)
xmap <buffer> <leader>qr <Plug>(coc-format-selected)
nmap <buffer> <leader>qr <Plug>(coc-format-selected)

" format current buffer.
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 F :call CocAction('format')
" fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" organize imports of the current buffer.
command! -nargs=0 OrgImp :call CocAction('runCommand', 'editor.action.organizeImport')

""" Jest
" Run jest for current project
command! -nargs=0 Jest :call CocAction('runCommand', 'jest.projectTest')<CR>
" Run jest for current file
command! -nargs=0 JestFile :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>
" Run jest for current test
command! -nargs=0 JestTest :call CocAction('runCommand', 'jest.singleTest')<CR>
" Init jest in current cwd, require global jest command exists
command! -nargs=0 JestInit :call CocAction('runCommand', 'jest.init')<CR>
