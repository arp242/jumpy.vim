" Function/typedef opening brace
" if, for, switch, while, and do statement
"
" C is hard as there is no 'function' keyword or the like.
"
" This checks for:
"
" - { at the end of the line but NO whitespace at the start
" - { at the start of the line.
"
" Seems to work surprisingly well on my C codebases.
"
" Alternate idea: /\v^(typedef|enum|struct)@!\w
call jumpy#map('\v%(^\{|^\s@!.*\{$)', '\v^\s%(if|for|switch|while|do)')
