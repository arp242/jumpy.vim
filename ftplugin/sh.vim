" Function declaration
"
" Note we don't support 'function foo() {' bash-ism; it's identical to 'foo() {'
" and there's no reason for it to exist.
" TODO: also add top-level if/for/case?
call jumpy#map('^\w\+()[ \n]*{')
