fun! Test_sh() abort
	call jumpy#test('a.sh', [
		\ [0, ''],
		\ [1, 'foo() {'],
		\ [0, ':'],
		\ [0, '}'],
		\ [1, 'foo()'],
		\ [0, '{'],
		\ [0, 'grep "()"'],
		\ [0, '}'],
		\ [0, ''],
		\])
endfun
