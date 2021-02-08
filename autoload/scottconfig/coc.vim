function! scottconfig#coc#GetExtensions()
	let l:coc_ext = ['coc-prettier', 'coc-spell-checker']

	if &filetype ==? 'json'
		let l:coc_ext += ['coc-json']
	elseif index(['ts', 'typescript', 'tsx', 'typescriptreact', 'js', 'javascript', 'jsx', 'javascriptreact'], &filetype) >= 0
		let l:coc_ext += ['coc-tsserver', 'coc-jest', 'coc-eslint', 'coc-react-refactor', 'coc-sql']
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
	endif

	return l:coc_ext
endfunction
