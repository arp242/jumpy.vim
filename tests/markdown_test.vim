fun! Test_markdown() abort
	call jumpy#test('a.markdown', [
		\ [0, ''],
		\ [0, 'Hello, world!'],
		\ [0, 'Much text!'],
		\ [1, '#Header'],
		\ [1, '## Second!'],
		\ [0, ''],
		\ [0, '.id { }'],
		\ [0, ''],
		\ [1, '---'],
		\])
endfun
