local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local noremap = require("utils.keymap").noremap

harpoon.setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 20,
  },
})

noremap("<Leader>a", mark.add_file)
noremap("<Leader>`", ui.toggle_quick_menu)
noremap("<Leader>a1", function()
  ui.nav_file(1)
end)
noremap("<Leader>a2", function()
  ui.nav_file(2)
end)
noremap("<Leader>a3", function()
  ui.nav_file(3)
end)
noremap("<Leader>a4", function()
  ui.nav_file(4)
end)
