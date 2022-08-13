lua << EOF
require("nvim-tree").setup({
  view = {
    adaptive_size = true,
  }
})
EOF

nnoremap <C-n> :NvimTreeToggle<CR>
