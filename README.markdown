Filetype-specific mappings for `[[` and `]]` to jump to the next section.

Adding a new filetype: add a call to `jumpy#map()` in `ftplugin/<ft>.vim.
Currently supported filetype with their patterns:

Currently supported filetypes:
<!-- Note: generate with tbl script -->

    css             ^[^ \t{}/] 
    go              \v^(func|type|var|const|import) 
    html            \v\<(head|body|style|script|div|ul|article|section|main|header|footer|h\d)[> ] 
    javascript      \v^\s*(function\(|var \w*\s+\=\s+function\() 
    markdown        \v(^\=\=\=|^---|^#{1,6}) 
