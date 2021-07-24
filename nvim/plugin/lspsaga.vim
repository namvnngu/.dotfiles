lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}
code_action_keys = {
  quit = 'q',exec = '<CR>'
}
rename_action_keys = {
  quit = 'q',exec = '<CR>'
}
EOF

nnoremap <silent><C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent>gd :Lspsaga preview_definition<CR>
inoremap <silent>gs <Cmd>Lspsaga signature_help<CR>
nnoremap <silent>gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent><leader>gca :Lspsaga code_action<CR>
vnoremap <silent><leader>gca :<C-U>Lspsaga range_code_action<CR>
