fun! Test_go() abort
	call jumpy#test('a.go', [
		\ [0, ''],
		\ [1, 'func foo() { }'],
		\ [0, 'element { }'],
		\ [0, ''],
		\ [1, 'type x struct { }'],
		\ [0, ''],
		\ [1, 'type ('],
		\ [0, ''],
		\ [0, 'fun(func() { })'],
		\ [0, ''],
		\ [0, ''],
		\])
endfun
