Filetype-specific mappings for `[[` and `]]` to jump to the next section.

Currently supported filetype with their patterns:
<!-- Note: generate with tbl script -->

    Filetype     What it matches                     Regexp
    --------     ---------------                     ------
    c            Function/typedef opening brace      \v(^\{|^\s@!.*\{$)
    css          Selector                            ^[^ \t{}/]
    git          Commit in git log                   ^commit 
    go           Top-level declaration               \v^(func|type|var|const|import)
    html         Common block elements               \v\<(head|body|style|script|div|ul|article|section|main|header|footer|h\d)[> ]
    javascript   Function declaration/expression     \v^\s*(function\s*\w|var \w*\s+\=\s+function\s*\()
    make         Target                              ^[a-zA-Z0-9 _-]\+:
    markdown     Header and horizontal rule          \v(^\=\=\=|^---|^#{1,6})
    sh           Function declaration                ^\w\+()[ \n]*{
    sql          CREATE and BEGIN                    \c\v^\s*(create|begin)>
    vim          Function/augroup definition         \v(^\s*fu%[nction]>|aug%[roup] (end)@!)
    yaml         Top-level key                       ^\w\+:

This overrides the mappings for some filetypes in Vim's standard distribution
for consistency and usefulness (e.g. `ft=vim` behaves different when it can't
find a match, `ft=sql` only jumps to `BEGIN` and not `CREATE`, etc.)

Adding a new filetype
---------------------

Call to `jumpy#map()` in `ftplugin/<ft>.vim`. The plugin is tested with
[testing.vim](https://github.com/arp242/testing.vim); running the full test
suite should be as easy as `tvim test ./...`.

You can also use a `Filetype` autocmd in your local vimrc file:

    autocmd Filetype myft call jumpy#map('..pattern..')
