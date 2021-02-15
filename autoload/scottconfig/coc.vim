function! scottconfig#coc#GetExtensions()
	let l:coc_ext = ['coc-lists', 'coc-spell-checker']

	if isdirectory('./node_modules') && isdirectory('./node_modules/prettier') || executable('prettier')
		let l:coc_ext += ['coc-prettier']
	endif

	if isdirectory('./node_modules') && isdirectory('./node_modules/eslint') || executable('eslint')
		let l:coc_ext += ['coc-eslint']
	endif

	if &filetype ==? 'json'
		let l:coc_ext += ['coc-json']
	elseif index(['ts', 'typescript', 'tsx', 'typescriptreact', 'js', 'javascript', 'jsx', 'javascriptreact'], &filetype) >= 0
		let l:coc_ext += ['coc-tsserver', 'coc-jest', 'coc-react-refactor', 'coc-sql', 'coc-graphql']
	elseif &filetype ==? 'html'
		let l:coc_ext += ['coc-html', 'coc-css']
	elseif index(['css', 'scss', 'less'], &filetype) >= 0
		let l:coc_ext += ['coc-css']
	elseif index(['yml', 'yaml'], &filetype) >= 0
		let l:coc_ext += ['coc-yaml']
	elseif index(['sh', 'shell'], &filetype) >= 0
		let l:coc_ext += ['coc-sh']
	elseif &filetype ==? 'sql'
		let l:coc_ext += ['coc-sql']
	elseif &filetype ==? 'rust'
		let l:coc_ext += ['coc-rust-analyzer']
	elseif &filetype ==? 'toml'
		let l:coc_ext += ['coc-toml']
	elseif &filetype ==? 'svg'
		let l:coc_ext += ['coc-svg']
	elseif &filetype ==? 'vim'
		let l:coc_ext += ['coc-vimlsp']
	endif

	return l:coc_ext
endfunction
