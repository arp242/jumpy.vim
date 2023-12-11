Mappings for `[[`, `]]`, `g[`, and `g]` to jump to the next or previous section.

`[[` and `]]` jumps between declarations such as functions, classes, etc.

`g[` and `g]` jumps between sections, such as `if`, `for`, `while` statements.

Use `g:jumpy_map` to configure the mappings:

    let g:jumpy_map = [']]', '[[', 'g]', 'g[']                               Default
    let g:jumpy_map = ['<Leader>]', '<Leader>[', '<Leader>}', '<Leader>{']   Use Leader
    let g:jumpy_map = [']]', ']]', '', '']                                   Map only [[ and ]]
    let g:jumpy_map = 0                                                      Don't map anything

Use `g:jumpy_after` to run a command after after jumping:

    let g:jumpy_after = ''                             Default
    let g:jumpy_after = 'zz'                           Centre the screen

Currently supported filetypes are listed below; if there isn't a pattern defined
for a filetype it will match the first non-indented line that starts with a
letter for `[[` and `]]` as a fallback (this trick was ~stolen~ copied [from
here][fb]).

[fb]: https://vi.stackexchange.com/a/37890/51

    Filetype     [[ and ]]                           g[ and g]
    --------     ---------                           ---------
    awk          Start of pattern-action
    c            Function/typedef opening brace      if, for, switch, while, and do statement
    crystal      Method, class, or module
    cs           Class, class method
    css          Selector
    diff         File                                Hunk
    dosini       Section
    git          Commit in git log
    gitconfig    Section
    go           Top-level declaration               if, for, switch, and go statement
    gomod        Replace/require
    graphql      GraphQL structure.
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
    toml         Table
    vcl          Function or backend
    vim          Function, command, and augroup      if, for, while, and try
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

4. Use `./tbl` to create the table to update the README.

Alternatively, you can use a `Filetype` autocmd in your vimrc file:

    autocmd Filetype myft call jumpy#map('[[ ]] pattern', 'g[ g] pattern')
