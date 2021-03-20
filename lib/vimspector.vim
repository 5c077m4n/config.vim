""" Vimspector
packadd! vimspector

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dD :VimspectorStop<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <leader>dt :call vimspector#ToggleBreakpoint()<CR>

let g:vimspector_install_gadgets = ['vscode-node-debug2', 'debugger-for-chrome', 'CodeLLDB']
