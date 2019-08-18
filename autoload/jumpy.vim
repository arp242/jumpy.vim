fun! jumpy#map(pattern) abort
	let l:map = get(g:, 'jumpy_map', [']]', '[['])
	if l:map is 0
		return
	endif

	let l:after = get(g:, 'jumpy_after', '')

	for l:mode in ['n', 'o', 'x']
		exe printf('%snoremap <buffer> <silent> %s :<C-u>call jumpy#jump("%s", "%s", "next")<CR>%s',
					\ l:mode, l:map[0], fnameescape(a:pattern), l:mode, l:after)
		exe printf('%snoremap <buffer> <silent> %s :<C-u>call jumpy#jump("%s", "%s", "prev")<CR>%s',
					\ l:mode, l:map[1], fnameescape(a:pattern), l:mode, l:after)
	endfor
endfun

fun! jumpy#jump(pattern, mode, dir) abort
	" Get motion count; done here as some commands later on will reset it.
	let l:count = v:count1

	" Set context mark so user can jump back with '' or ``.
	normal! m'

	" Start visual selection or re-select previously selected.
	if a:mode is# 'x'
		normal! gv
	endif

	let l:save = winsaveview()
	for l:i in range(l:count)
		let l:loc = search(a:pattern, 'Wz' . (a:dir is# 'prev' ? 'b' : ''))
		if l:loc > 0
			" Jump to first non-whitespace if cursor is on leading whitespace.
			if getline('.')[:col('.') - 1] =~# '^\s*$'
				normal! ^
			endif
			continue
		endif

		" Jump to top or bottom of file if we're at the first or last match.
		if l:i is l:count - 1
			exe 'keepjumps normal! ' . (a:dir is# 'next' ? 'G' : 'gg')
		else
			call winrestview(l:save)
		endif

		break
	endfor
endfun
