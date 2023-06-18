local harpoon = require('harpoon')
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local noremap = require('utils.keymap').noremap

harpoon.setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 20,
  },
})

noremap('<leader>a', mark.add_file)
noremap('<leader>`', ui.toggle_quick_menu)
noremap("<leader>a1", function() ui.nav_file(1) end)
noremap("<leader>a2", function() ui.nav_file(2) end)
noremap("<leader>a3", function() ui.nav_file(3) end)
noremap("<leader>a4", function() ui.nav_file(4) end)
