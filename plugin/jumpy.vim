augroup jumpy.vim
	au!
	au FileType *
		\  if stridx(maparg('[['), 'jumpy#jump') == -1
		\|     call jumpy#map('^[[:alpha:]$_]', '')
		\| endif
augroup end
