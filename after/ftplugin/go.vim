" Top-level declaration or subtest
" if, for, switch, and go statement
call jumpy#map('\v%(^%(func|type|var|const|import|package)|^\s*[tb]\.Run\(.{}, func\([tb] \*testing\.[TB]\) \{)', '\v^\s+%(if|for|switch|go) ')
