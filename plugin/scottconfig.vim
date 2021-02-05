" Roee's default vim/nvim/gvim config
" Maintainer: Roee Shapira <ro33.sha@gmail.com>

if exists('g:disable_scott_config')
	finish
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &compatible
	set nocompatible
endif

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has('patch-8.1.1564')
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Make vim cwd the file that is being edited
autocmd BufEnter * silent! lcd %:p:h
" Add rust filetype
augroup filetype_rust
    autocmd!
    autocmd BufReadPost *.rs setlocal filetype=rust
augroup END

" Line numbering
set number
set relativenumber

let mapleader = " "

nnoremap <expr> <leader>1 ":edit ".scottconfig#utils#GetVimConfigPath()."<CR>"
nnoremap <expr> <leader>2 ":source ".scottconfig#utils#GetVimConfigPath()."<CR>"
nnoremap <silent> <leader>3 :PlugInstall<CR>
nnoremap <silent> <leader>4 :PlugUpgrade<CR>:PlugUpdate<CR>:CocUpdate<CR>
" Map redo to Ctrl+u
nnoremap U <C-r>

" Sudo saves the file (useful for handling the permission-denied error)
command! SudoW execute 'w !sudo tee % > /dev/null' <bar> edit!

""" Misc
" Return to the last editing point when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Mouse support
if has('mouse')
	set mouse=i
endif
" copy to clipboard where pressing ctrl-c in visual mode
vnoremap <C-c> "+y
" paste from clipboard where pressing ctrl-v in insert mode
inoremap <C-v> <C-o>"+p

" Trigger autoread when changing buffers inside while inside vim
autocmd FocusGained,BufEnter * :checktime

set modifiable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

set background=dark

" Set extra options when running in GUI mode
if has('gui_running')
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Set language to english
let $LANG='en'
set langmenu=en

" Reset menus (becuase of the languase set above)
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if g:scottconfig#vars#is_win
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""" Search
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if g:scottconfig#vars#is_mac
	autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows, tabs & buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Windows
" A shorter way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <silent> <leader>wh :split<CR>
nnoremap <silent> <leader>wv :vertical split<CR>
nnoremap <silent> <leader>wq <C-W>q<CR>

""" Tabs
nnoremap <silent> <leader>] :tabn<CR>
nnoremap <silent> <leader>[ :tabp<CR>
nnoremap <silent> <leader>tl :tabs<CR>
" Duplicate current tab
nnoremap <silent> <leader>tn :tab split<CR>
nnoremap <silent> <leader>tq :tabclose<CR>
nnoremap <silent> <leader>tQ :tabonly<CR>

""" Buffers
" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent> <leader>bf :bnext<CR>
nnoremap <silent> <leader>bb :bprevious<CR>
nnoremap <silent> <leader>bl :buffers<CR>
nnoremap <leader>bj :buffers<CR>:buffer<Space>

" Default split positions
set splitbelow
set splitright


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terminals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <C-t>h :terminal<CR>
nnoremap <silent> <C-t>v :vertical terminal<CR>
tnoremap <silent> <Esc> <C-\><C-n>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab sizing
set tabstop=4
set shiftwidth=4
set ai
set si
set wrap

" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" Delete trailing white space on save, useful for some filetypes ;)

autocmd BufWritePre *.txt,*.js,*.ts,*.sql,*.py,*.sh, :call scottconfig#utils#CleanExtraSpaces()

" Indentation commands
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle spell checking
nmap <leader>ss :setlocal spell!<CR>
nmap <leader>sn ]s
nmap <leader>sp [s
nmap <leader>sa zg
nmap <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists(':PlugInstall')
	call scottconfig#plugins#InstallPlug()
endif

nnoremap <silent> K :call scottconfig#utils#ShowDocumentation()<CR>
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : scottconfig#utils#CheckBackSpace() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

""" Theme
colorscheme molokai

""" Coc
let g:coc_global_extensions = scottconfig#coc#GetExtensions()

""" Ranger
let g:ranger_map_keys = 0 " Disable default key mappings
nnoremap <silent> <leader>r :Ranger<CR>

""" Rust
if g:scottconfig#vars#is_mac
	let g:rust_clip_command = 'pbcopy'
else
	let g:rust_clip_command = 'xclip -selection clipboard'
endif

""" NERDTree
let NERDTreeShowHidden=1
nnoremap <silent> <leader>tt :NERDTreeToggle<CR>
nnoremap <silent> <leader>tf :NERDTreeFocus<CR>
nnoremap <silent> <leader>ts :NERDTreeFind<CR>
nnoremap <silent> <leader>tr :NERDTreeRefreshRoot<CR>
" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
			\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

""" NERDCommneter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
nmap <leader>/ <plug>NERDCommenterToggle<CR>

""" Undotree
nnoremap <silent> <leader>u :UndotreeToggle<CR>
if has('persistent_undo')
	execute 'set undodir='.$HOME.'/.undodir'
	set undofile
endif

""" FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}

""" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" Floaterm
nnoremap <silent> <F9> :FloatermPrev<CR>
tnoremap <silent> <F9> <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F10> :FloatermNext<CR>
tnoremap <silent> <F10> <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <F11> :FloatermNew<CR>
tnoremap <silent> <F11> <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_autoclose = 1

""" Bookmarks
let g:bookmark_no_default_key_mappings = 1
nmap <silent> mm <Plug>BookmarkToggle
nmap <silent> mi <Plug>BookmarkAnnotate
nmap <silent> m] <Plug>BookmarkNext
nmap <silent> m[ <Plug>BookmarkPrev
nmap <silent> ma <Plug>BookmarkShowAll
nmap <silent> mx <Plug>BookmarkClearAll
