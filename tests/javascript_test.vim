fun! Test_javascript() abort
	call jumpy#test('a.js', [
		\ [0, ''],
		\ [0, 'var a = functionList();'],
		\ [1, 'function x() { }'],
		\ [0, ''],
		\ [1, 'var x = function() { }'],
		\ [0, ''],
		\ [0, 'cb(function() { })'],
		\ [0, ''],
		\])
endfun
