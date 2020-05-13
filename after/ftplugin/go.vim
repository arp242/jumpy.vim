" Top-level declaration
" if, for, and go statement
call jumpy#map('\v^%(func|type|var|const|import|package)', '\v^\s+%(if|for|go) ')
