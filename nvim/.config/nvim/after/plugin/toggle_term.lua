local nnoremap = require('utils.keymap').nnoremap
local tnoremap = require('utils.keymap').tnoremap

require('toggleterm').setup({
  direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float'
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
})

nnoremap('<F12>', '<Cmd>ToggleTerm<CR>')

local toggle_term_keymaps_augroup = vim.api.nvim_create_augroup('ToggleTermKeymaps', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  group = toggle_term_keymaps_augroup,
  pattern = 'term://*',
  callback = function()
    local opts = { buffer = 0 }
    tnoremap('<ESC>', [[<C-\><C-n>]], opts)
    tnoremap('<F12>', [[<cmd>ToggleTerm<CR>]], opts)
  end,
})
