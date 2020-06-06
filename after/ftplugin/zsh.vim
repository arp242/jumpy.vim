" Function declaration
" if, for, while, until, case, foreach, repeat, select
call jumpy#map('^\(function \|[a-zA-Z_][[:alnum:]-]\+ *()[ \n]*{\)', '\v^\s*(if|for|while|until|case|foreach|repeat|select)')
