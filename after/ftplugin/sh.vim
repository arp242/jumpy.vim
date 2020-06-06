" POSIX function declaration
" if, for, while, until, case
call jumpy#map('^[a-zA-Z_]\w\+ *()[ \n]*{', '\v^\s*(if|for|while|until|case)')
