# Notes

## Handle theme mode in `tmux`

- Vim

```vim
let &background = $THEME_MODE
```

- Neovim

```lua
vim.o.background = vim.env.THEME_MODE
```
