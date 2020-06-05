" Top-level declaration
" if, for, switch, and go statement
call jumpy#map('\v^%(func|type|var|const|import|package)', '\v^\s+%(if|for|switch|go) ')
