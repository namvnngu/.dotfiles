local nnoremap = require("utils.keymap").nnoremap
local vnoremap = require("utils.keymap").vnoremap

nnoremap("<leader>S", function()
  require("spectre").open()
end)

-- search current word
nnoremap("<leader>sw", function()
  require("spectre").open_visual({ select_word = true })
end)
vnoremap("<leader>s", function()
  require("spectre").open_visual()
end)
