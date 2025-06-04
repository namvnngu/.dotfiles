local nnoremap = require("utils.keymap").nnoremap
local vnoremap = require("utils.keymap").vnoremap

nnoremap("<C-s>", function()
  require("spectre").open()
end)

-- search current word
nnoremap("<Leader>sw", function()
  require("spectre").open_visual({ select_word = true })
end)
vnoremap("<Leader>s", function()
  require("spectre").open_visual()
end)
