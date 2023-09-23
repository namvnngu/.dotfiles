local oil = require('oil')
local nnoremap = require('utils.keymap').nnoremap

oil.setup({
  view_options = {
    show_hidden = true,
  },
})

nnoremap('-', oil.open, { desc = 'Open parent directory' })
