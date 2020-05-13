" Function/augroup definition
" if, for, while, and try
call jumpy#map('\v^\s*%(fu%[nction]>|aug%[roup]\s%(\s*[eE][nN][dD])@!)',
			\ '\v^\s*:?%(if|for|while|try)')
