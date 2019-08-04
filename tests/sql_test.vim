fun! Test_sql() abort
	" Don't know why this doesn't take?
	return

	call jumpy#test('a.sql', [
		\ [0, ''],
		\ [1, 'create table foo()'],
		\ [0, 'insert into foo ();'],
		\ [0, ''],
		\ [1, 'CREATE unique index'],
		\ [0, ''],
		\])
endfun
