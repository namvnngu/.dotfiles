require('nvim-tree').setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    adaptive_size = true,
  },
})

local nnoremap = require('utils.keymap').nnoremap

nnoremap('<C-n>', '<cmd>NvimTreeToggle<CR>')
nnoremap('<leader>n', '<cmd>NvimTreeFindFileToggle<CR>')
