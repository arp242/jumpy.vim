fun! Test_jumpy() abort
	let l:tests = {
		\ 'Makefile':      [4, 7],
		\ 'go.mod.gomod':  [5, 7],
		\ 'test.c':        [3, 12, 15],
		\ 'test.css':      [3, 5, 7, 9],
		\ 'test.diff':     [2, 10],
		\ 'test.go':       [2, 5, 7],
		\ 'test.help':     [2, 4],
		\ 'test.html':     [2, 4, 8],
		\ 'test.js':       [3, 5, 9, 11],
		\ 'test.lua':      [2, 5],
		\ 'test.markdown': [4, 5, 9],
		\ 'test.php':      [4, 5, 8, 11, 15, 18, 20],
		\ 'test.py':       [2, 4, 5, 8, 9],
		\ 'test.qf':       [2, 3, 6, 7, 8],
		\ 'test.rb':       [2, 5, 6, 7],
		\ 'test.sh':       [2, 5],
		\ 'test.sql':      [2, 5, 7],
		\ 'test.tex':      [3, 5, 6, 8, 12, 13, 14, 17, 19],
		\ 'test.vim':      [2, 6, 16, 21, 26],
		\ 'test.yaml':     [2, 5],
	\ }

	for [l:file, l:wantlines] in items(l:tests)
		let l:file = g:test_packdir . '/autoload/testdata/' . l:file
		if !filereadable(l:file)
			return Errorf('unable to read "%s"', l:file)
		endif
		exe 'e ' . l:file
		if &filetype is# ''
			let &filetype = fnamemodify(l:file, ':e')
		endif

		" Should jump to last line if there are no more matches (also tests if
		" there are no matches after wantlines).
		" This is why test files should end with a blank line!
		let l:wantlines = add(l:wantlines, line('$'))
		normal! gg
		for l:want in l:wantlines
			" vint: -ProhibitCommandRelyOnUser
			normal ]]

			if l:want isnot line('.')
				call Errorf("wrong line for %s ]]\nwant: line %d -> %s\ngot:  line %d -> %s",
							\ fnamemodify(l:file, ':t'),
							\ l:want, getline(l:want),
							\ line('.'), getline('.'))
			endif
		endfor

		" Test going backwards
		let l:wantlines = [1] + l:wantlines[:-2]
		call reverse(l:wantlines)
		normal! G
		for l:want in l:wantlines
			" vint: -ProhibitCommandRelyOnUser
			normal [[

			if l:want isnot line('.')
				call Errorf("wrong line for %s [[\nwant: line %d -> %s\ngot:  line %d -> %s",
							\ fnamemodify(l:file, ':t'),
							\ l:want, getline(l:want),
							\ line('.'), getline('.'))
			endif
		endfor
	endfor
endfun
