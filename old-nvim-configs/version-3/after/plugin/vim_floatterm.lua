local nnoremap = require("utils.keymap").nnoremap
local tnoremap = require("utils.keymap").tnoremap

vim.g["floaterm_position"] = "center"
vim.g["floaterm_width"]    = 0.5

nnoremap("<F7>", ":FloatermNew<CR>", { silent = true })
tnoremap("<F7>", [[ <C-\><C-n>:FloatermNew<CR> ]], { silent = true })

nnoremap("<F8>", ":FloatermKill<CR>", { silent = true })
tnoremap("<F8>", [[ <C-\><C-n>:FloatermKill<CR> ]], { silent = true })

nnoremap("<F9>", ":FloatermPrev<CR>", { silent = true })
tnoremap("<F9>", [[ <C-\><C-n>:FloatermPrev<CR> ]], { silent = true })

nnoremap("<F10>", ":FloatermNext<CR>", { silent = true })
tnoremap("<F10>", [[ <C-\><C-n>:FloatermNext<CR> ]], { silent = true })

nnoremap("<F12>", ":FloatermToggle<CR>", { silent = true })
tnoremap("<F12>", [[ <C-\><C-n>:FloatermToggle<CR> ]], { silent = true })

vim.cmd([[
    hi FloatermBorder guibg=none guifg=orange
    hi FloatermNC guibg=gray
  ]])
