Filetype-specific mappings for `[[` and `]]` to jump to the next section.

Currently supported filetype with their patterns:
<!-- Note: generate with tbl script -->

    css             ^[^ \t{}/]
    go              \v^(func|type|var|const|import)
    html            \v\<(head|body|style|script|div|ul|article|section|main|header|footer|h\d)[> ]
    javascript      \v^\s*(function\s*\w|var \w*\s+\=\s+function\s*\()
    markdown        \v(^\=\=\=|^---|^#{1,6})
    sh              ^\w\+()[ \n]*{
    sql             \c\v^\s*(create|begin)>

Filetypes that have mappings in standard Vim distribution: php, python, ruby,
vim.

Adding a new filetype
---------------------

Call to `jumpy#map()` in `ftplugin/<ft>.vim`. The plugin is tested with
[testing.vim](https://github.com/arp242/testing.vim); running the full test
suite should be as easy as `tvim test ./...`.

You can also use a `Filetype` autocmd in your local vimrc file:

    autocmd Filetype myft call jumpy#map('..pattern..')
