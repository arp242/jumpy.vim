Filetype-specific mappings for `[[` and `]]` to jump to the next section.

Currently supported filetype with their patterns:
<!-- Note: generate with tbl script -->

    Filetype        What it matches                          Regexp
    --------        ---------------                          ------
    c               Function and typedef opening braces      \v(^\{|^\s@!.*\{$)
    css             Selectors                                ^[^ \t{}/]
    go              Top-level declarations                   \v^(func|type|var|const|import)
    html            Common block elements                    \v\<(head|body|style|script|div|ul|article|section|main|header|footer|h\d)[> ]
    javascript      Function declarations and expressions    \v^\s*(function\s*\w|var \w*\s+\=\s+function\s*\()
    make            Targets                                  ^[a-zA-Z0-9 _-]\+:
    markdown        Headers and horizontal rules             \v(^\=\=\=|^---|^#{1,6})
    sh              Function declarations.                   ^\w\+()[ \n]*{
    sql             CREATE and BEGIN                         \c\v^\s*(create|begin)>
    vim             Function and augroup definitions         \v(^\s*fu%[nction]>|aug%[roup] (end)@!)
    yaml            Top-level keys                           ^\w\+:

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
