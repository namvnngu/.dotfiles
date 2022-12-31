local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local noremap = require('utils.keymap').noremap

noremap('<leader>ha', mark.add_file)
noremap('<leader>ho', ui.toggle_quick_menu)

noremap('<leader>h1', function()
  ui.nav_file(1)
end)
noremap('<leader>h2', function()
  ui.nav_file(2)
end)
noremap('<leader>h3', function()
  ui.nav_file(3)
end)
noremap('<leader>h4', function()
  ui.nav_file(4)
end)
