[![This project is considered stable](https://img.shields.io/badge/Status-stable-green.svg)](https://arp242.net/status/stable)
[![Build Status](https://travis-ci.org/arp242/jumpy.vim.svg?branch=master)](https://travis-ci.org/arp242/jumpy.vim)
[![codecov](https://codecov.io/gh/arp242/jumpy.vim/branch/master/graph/badge.svg)](https://codecov.io/gh/arp242/jumpy.vim)

Filetype-specific mappings for `[[`, `]]`, `{`, and `}` to jump to the next or
previous section.

`[[` and `]]` jumps between declarations such as functions, classes, etc.

`{` and `}` jumps between sections, such as `if`, `for`, `while` statements.

Use `g:jumpy_map` to configure the mappings:

    let g:jumpy_map = [']]', '[[', '}', '{']                                 Defaults.
    let g:jumpy_map = ['<Leader>]', '<Leader>[', '<Leader>}', '<Leader>{']   Use Leader.
    let g:jumpy_map = [']]', ']]', '', '']                                   Map only [[ and ]]
    let g:jumpy_map = 0                                                      Don't map anything.

Use `g:jumpy_after` to run a command after after jumping:

    let g:jumpy_after = ''                             Default.
    let g:jumpy_after = 'zz'                           Center the screen.

Currently supported filetype with their patterns:

    Filetype     [[ and ]]                           { and }
    --------     ---------                           ------
    c            Function/typedef opening brace
    css          Selector
    diff         File                                Hunk
    git          Commit in git log
    gitconfig    Section
    go           Top-level declaration               if, for, and go statement
    gomod        Replace/require
    help         Help tag definition
    html         Common block elements
    javascript   Function declaration/expression
    lua          Function definition
    make         Target
    markdown     Header and horizontal rule
    php          Function, class, interface
    python       Function, method, class
    qf           Next/prev filename
    ruby         Function, class, or module
    sh           Function declaration
    sql          CREATE and BEGIN
    tex          Beginning of a section
    vcl          Function or backend.
    vim          Function/augroup definition         if, for, while, and try
    yaml         Top-level key

This overrides mappings for some filetypes in Vim's standard distribution for
consistency and usefulness (e.g. `ft=vim` behaves different when it can't find a
match, `ft=sql` only jumps to `BEGIN` and not `CREATE`, etc.)

Adding a new filetype
---------------------

1. Call `jumpy#map()` in `after/ftplugin/<ft>.vim`; the first line is a comment
   documenting the [[ and ]] behaviour, the second line is expected to document
   { and } behaviour.

2. Add a test in `autoload/jumpy_test.vim`; the key is a filename from
   `autoload/testdata/test.ext` and the value a list of line numbers you expect
   it to jump to. The plugin is tested with
   [testing.vim](https://github.com/arp242/testing.vim); running the full test
   suite should be as easy as `tvim test ./...`.

3. Use `./tbl` to create the table; the first line is used as the "what it
   matches" column.

Alternatively, you can use a `Filetype` autocmd in your local vimrc file:

    autocmd Filetype myft call jumpy#map('[[ ]] pattern', '{ } pattern')
