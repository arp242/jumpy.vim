" Function declaration/expression
"
" At any indentation level, and only named ones, for obvious reasons.
" Will also match things like:
"
" function foo()
"     var bar = function() {
"     }
" }
"
" No good way around this; function delarations we *do* want to jump to don't
" need to start at column 0.
call jumpy#map('\v^\s*%(function\s*\w|%(var|let) \w*\s+\=\s+%(function\(|\(.{-}\)\s*\=\>\s*))', '')
