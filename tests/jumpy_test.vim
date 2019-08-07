fun! Test_jumpy() abort
	let l:tests = {
		\ 'test.c'        : [3, 12, 15],
		\ 'test.css'      : [3, 5, 7, 9],
		\ 'test.go'       : [2, 5, 7],
		\ 'test.html'     : [2, 4, 8],
		\ 'test.js'       : [3, 5],
		\ 'test.markdown' : [4, 5, 9],
		\ 'test.sh'       : [2, 5],
	\ }
	" \ 'test.sql': [2, 5, 7],

	for [l:file, l:wantlines] in items(l:tests)
		let l:file = g:test_packdir . '/tests/' . l:file
		if !filereadable(l:file)
			return Errorf('unable to read "%s"', l:file)
		endif
		exe 'e ' . l:file

		" Should jump to last line if there are no more matches (also tests if
		" there are no matches after wantlines).
		" This is why test files should end with a blank line!
		let l:wantlines = add(l:wantlines, line('$'))

		normal! gg
		for l:want in l:wantlines
			" vint: -ProhibitCommandRelyOnUser
			normal ]]

			if l:want isnot line('.')
				call Errorf("wrong line for %s\nwant: line %d -> %s\ngot:  line %d -> %s",
							\ fnamemodify(l:file, ':t'),
							\ l:want, getline(l:want),
							\ line('.'), getline('.'))
			endif
		endfor
	endfor
endfun
