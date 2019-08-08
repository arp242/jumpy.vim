" Function declarations and expressions
"
" At any indentation level, and only named ones, for obvious reasons.
call jumpy#map('\v^\s*(function\s*\w|var \w*\s+\=\s+function\s*\()')
