fun! Test_css() abort
	call jumpy#test('a.css', [
		\ [0, ''],
		\ [0, '/* Comment */'],
		\ [1, 'element { }'],
		\ [0, ''],
		\ [1, '.class { }'],
		\ [0, ''],
		\ [1, '#id { }'],
		\ [0, ''],
		\ [1, '@media { }'],
		\])
endfun
