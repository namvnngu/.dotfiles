local oil = require('oil')
local nnoremap = require('utils.keymap').nnoremap

oil.setup()

nnoremap('-', oil.open, { desc = 'Open parent directory' })
