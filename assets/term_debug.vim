packadd termdebug

nmap <leader>dd :Termdebug<Space>
nmap <silent> <leader>dD :call TermDebugSendCommand('quit')<CR>:Gdb<CR>y<CR>
nmap <leader>dr :Run<CR>
nmap <leader>dR :Stop<CR>
nmap <leader>db :Break<CR>
nmap <leader>dB :Clear<CR>
nmap <leader>ds :Step<CR>
nmap <leader>dn :Over<CR>
nmap <leader>df :Finish<CR>
nmap <leader>dc :Continue<CR>
nmap <leader>dp :Evaluate<CR>
nmap <leader>de :Evaluate<Space>
nmap <leader>dl :call TermDebugSendCommand('info locals')<CR>
nmap <leader>da :call TermDebugSendCommand('info args')<CR>

let g:termdebug_wide=1
