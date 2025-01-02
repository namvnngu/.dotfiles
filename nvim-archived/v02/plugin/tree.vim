lua << EOF
require'nvim-tree'.setup()
EOF

let g:nvim_tree_width = 40

" a list of groups can be found at `:help nvim_tree_highlight`
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
