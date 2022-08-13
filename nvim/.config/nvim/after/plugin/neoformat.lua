local nnoremap = require("utils.keymap").nnoremap
local vnoremap = require("utils.keymap").vnoremap

nnoremap("<leader>df", "<cmd>Neoformat<CR>")
vnoremap("<leader>df", "<cmd>Neoformat<CR>")
