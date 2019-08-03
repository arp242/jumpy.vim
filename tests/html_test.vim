fun! Test_html() abort
	call jumpy#test('a.html', [
		\ [0, ''],
		\ [1, '<h1>foo</h1>'],
		\ [0, 'element { }'],
		\ [0, ''],
		\ [1, '<h1 class="h1">.class { }</h1>'],
		\ [0, ''],
		\])
endfun
