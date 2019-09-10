[![This project is considered stable](https://img.shields.io/badge/Status-stable-green.svg)](https://arp242.net/status/stable)
[![Build Status](https://travis-ci.org/arp242/jumpy.vim.svg?branch=master)](https://travis-ci.org/arp242/jumpy.vim)
[![codecov](https://codecov.io/gh/arp242/jumpy.vim/branch/master/graph/badge.svg)](https://codecov.io/gh/arp242/jumpy.vim)

Filetype-specific mappings for `[[` and `]]` to jump to the next or previous
section.

Use `g:jumpy_map` to configure the mappings:

    let g:jumpy_map = [']]', '[[']                     Defaults.
    let g:jumpy_map = ['<Leader>]', '<Leader>[']       Use Leader.
    let g:jumpy_map = 0                                Don't map anything.

Use `g:jumpy_after` to run a command after after jumping:

    let g:jumpy_after = ''                             Default.
    let g:jumpy_after = 'zz'                           Center the screen.

Currently supported filetype with their patterns:

    Filetype     What it matches                     Regexp
    --------     ---------------                     ------
    css          Selector                            ^[^ \t{}/]
    c            Function/typedef opening brace      \v%(^\{|^\s@!.*\{$)
    diff         File                                ^diff 
    git          Commit in git log                   ^commit 
    gomod        Replace/require                     \v^%(require|replace) 
    go           Top-level declaration               \v^%(func|type|var|const|import)
    help         Help tag definition                 \*[a-zA-Z0-9:_<> *-]\+\*
    html         Common block elements               \v\<%(head|body|style|script|div|ul|article|section|main|header|footer|h\d)[> ]
    javascript   Function declaration/expression     \v^\s*%(function\s*\w|%(var|let) \w*\s+\=\s+%(function\(|\(.{-}\)\s*\=\>\s*))
    lua          Function definition                 ^\s*function\>
    make         Target                              ^[a-zA-Z0-9 _-]\+:
    markdown     Header and horizontal rule          \v%(^\=\=\=|^---|^#{1,6})
    php          Function, class, interface          \v^\s*%(%(abstract\s+|final\s+|private\s+|public\s+|protected\s|static\s+)*function|%(abstract\s+|final\s+)*class|interface)>
    python       Function, method, class             \v^(class|\s*def|\s*async def)>
    qf           Next/prev filename                  \%#=1\v^([^\|]+).*\n\1@!\zs
    ruby         Function, class, or module          \v^\s*%(def|class|module)>
    sh           Function declaration                ^\w\+()[ \n]*{
    sql          CREATE and BEGIN                    \c\v^\s*%(create|begin)>
    tex          Beginning of a section              \v^\s*\\%(%(sub)*section|chapter|part|appendix|%(front|back|main)matter)>
    vim          Function/augroup definition         \v^\s*%(fu%[nction]>|aug%[roup]\s%(\s*[eE][nN][dD])@!)
    yaml         Top-level key                       ^\w\+:

This overrides mappings for some filetypes in Vim's standard distribution for
consistency and usefulness (e.g. `ft=vim` behaves different when it can't find a
match, `ft=sql` only jumps to `BEGIN` and not `CREATE`, etc.)

Adding a new filetype
---------------------

1. Call `jumpy#map()` in `after/ftplugin/<ft>.vim`.

2. Add a test in `autoload/jumpy_test.vim`; the key is a filename from
   `autoload/testdata/test.ext` and the value a list of line numbers you expect
   it to jump to. The plugin is tested with
   [testing.vim](https://github.com/arp242/testing.vim); running the full test
   suite should be as easy as `tvim test ./...`.

3. Use `./tbl` to create the table; the first line is used as the "what it
   matches" column.

Alternatively, you can use a `Filetype` autocmd in your local vimrc file:

    autocmd Filetype myft call jumpy#map('..pattern..')
