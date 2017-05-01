# Vim/NeoVim

Plugins:

- [vim-go](https://github.com/fatih/vim-go)
- [syntastic](https://github.com/vim-syntastic/syntastic) or [neomake](https://github.com/neomake/neomake)

Useful mappings:

```vimrc
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
```

With `go_auto_type_info` turned on Vim will show you type info (including function signatures) for the word under cursor.

There are a lot of things, not related to Golang, one can find [here](https://github.com/melekes/dotfiles/blob/master/config/nvim/init.vim).

Tutorials:

- [vim-go tutorial](https://github.com/fatih/vim-go-tutorial)
