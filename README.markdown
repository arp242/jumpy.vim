[![This project is considered stable](https://img.shields.io/badge/Status-stable-green.svg)](https://arp242.net/status/stable)
[![Build Status](https://travis-ci.org/arp242/jumpy.vim.svg?branch=master)](https://travis-ci.org/arp242/jumpy.vim)
[![codecov](https://codecov.io/gh/arp242/jumpy.vim/branch/master/graph/badge.svg)](https://codecov.io/gh/arp242/jumpy.vim)

Filetype-specific mappings for `[[`, `]]`, `g[`, and `g]` to jump to the next or
previous section.

`[[` and `]]` jumps between declarations such as functions, classes, etc.

`g[` and `g]` jumps between sections, such as `if`, `for`, `while` statements.

Use `g:jumpy_map` to configure the mappings:

    let g:jumpy_map = [']]', '[[', 'g]', 'g[']                               Defaults.
    let g:jumpy_map = ['<Leader>]', '<Leader>[', '<Leader>}', '<Leader>{']   Use Leader.
    let g:jumpy_map = [']]', ']]', '', '']                                   Map only [[ and ]]
    let g:jumpy_map = 0                                                      Don't map anything.

Use `g:jumpy_after` to run a command after after jumping:

    let g:jumpy_after = ''                             Default.
    let g:jumpy_after = 'zz'                           Center the screen.

Currently supported filetype with their patterns:

    Filetype     [[ and ]]                           g[ and g]
    --------     ---------                           ---------
    c            Function/typedef opening brace
    crystal      Method, class, or module
    css          Selector
    diff         File                                Hunk
    git          Commit in git log
    gitconfig    Section
    go           Top-level declaration               if, for, switch, and go statement
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
    ruby         Method, class, or module
    sh           POSIX function declaration          if, for, while, until, case
    sql          CREATE and BEGIN
    tex          Beginning of a section
    vcl          Function or backend
    vim          Function/augroup definition         if, for, while, and try
    yaml         Top-level key
    zsh          Function declaration                if, for, while, until, case, foreach, repeat, select

This overrides mappings for some filetypes in Vim's standard distribution for
consistency and usefulness (e.g. `ft=vim` behaves different when it can't find a
match, `ft=sql` only jumps to `BEGIN` and not `CREATE`, etc.)

Adding a new filetype
---------------------

1. Add `after/ftplugin/<ft>.vim`; the first line should be a a comment
   documenting the [[ and ]] behaviour, and the second line a comment
   documenting g[ and g].

2. Call `jumpy#map('[[ ]] pattern', 'g[ g] pattern')`.

3. Add a test in `autoload/jumpy_test.vim`; the key is a filename from
   `autoload/testdata/test.ext` and the value a list of line numbers you expect
   it to jump to. The plugin is tested with
   [testing.vim](https://github.com/arp242/testing.vim); running the full test
   suite should be as easy as `tvim test ./...`.

4. Use `./tbl` to create the table.

Alternatively, you can use a `Filetype` autocmd in your local vimrc file:

    autocmd Filetype myft call jumpy#map('[[ ]] pattern', 'g[ g] pattern')
