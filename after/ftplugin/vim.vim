" Function, command, and augroup
" if, for, while, and try
call jumpy#map('\v^\s*%(fu%[nction]>|%(export )?def>|com%[mand]>|aug%[roup]\s%(\s*[eE][nN][dD])@!)',
			\ '\v^\s*:?%(if|for|while|try)')
