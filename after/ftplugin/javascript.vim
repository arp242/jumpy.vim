" Function declaration/expression
"
" At any indentation level, and only named ones, for obvious reasons.
call jumpy#map('\v^\s*%(function\s*\w|%(var|let) \w*\s+\=\s+%(function\(|\(.{-}\)\s*\=\>\s*))')
