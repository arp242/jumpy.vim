fun! Test_c() abort
	call jumpy#test('a.c', [
		\ [0, ''],
		\ [1, 'void f() {'],
		\ [0, '  if (x) { }'],
		\ [0, '}'],
		\ [0, ''],
		\ [0, 'void'],
		\ [0, 'f()'],
		\ [1, '{'],
		\ [0, '}'],
		\ [0, ''],
		\])
endfun
