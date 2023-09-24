local nnoremap = require('utils.keymap').nnoremap
local vnoremap = require('utils.keymap').vnoremap
local noremap = require('utils.keymap').noremap
local xnoremap = require('utils.keymap').xnoremap
local inoremap = require('utils.keymap').inoremap
local tnoremap = require('utils.keymap').tnoremap
local map = require('utils.keymap').map

nnoremap('<leader>h', ':wincmd h<CR>')
nnoremap('<leader>j', ':wincmd j<CR>')
nnoremap('<leader>k', ':wincmd k<CR>')
nnoremap('<leader>l', ':wincmd l<CR>')

nnoremap('<Up>', ':resize -2<CR>')
nnoremap('<Down>', ':resize +2<CR>')
nnoremap('<Right>', ':vertical resize +2<CR>')
nnoremap('<Left>', ':vertical resize -2<CR>')

nnoremap('<leader>qq', ':q<CR>')

nnoremap('<leader>ya', ':%y+<CR>')
nnoremap('<leader>y', '"+y')
vnoremap('<leader>y', '"+y')
-- Yank til the end
nnoremap('<leader>Y', '"+y$')
nnoremap('Y', 'y$')

nnoremap('<leader>bn', ':bnext<CR>')
nnoremap('<leader>bp', ':bprevious<CR>')
nnoremap('<leader>bd', ':bdelete<CR>')
nnoremap('<leader>ba', ':bufdo bd<CR>')
nnoremap('<leader>be', ':%bd|e#<CR>')

vnoremap('J', ":m '>+1<CR>gv=gv")
vnoremap('K', ":m '<-2<CR>gv=gv")

-- Keeping it centered and stable
nnoremap('J', 'mzJ`z')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')

-- Quickfix list
nnoremap('<C-k>', ':cnext<CR>zz')
nnoremap('<C-j>', ':cprev<CR>zz')

-- Location list
nnoremap('<leader>K', ':lnext<CR>zz')
nnoremap('<leader>J', ':lprev<CR>zz')

-- Keybindings for tab navigation with leader and number
noremap('<leader>1', '1gt')
noremap('<leader>2', '2gt')
noremap('<leader>3', '3gt')
noremap('<leader>4', '4gt')
noremap('<leader>5', '5gt')
noremap('<leader>6', '6gt')
noremap('<leader>7', '7gt')
noremap('<leader>8', '8gt')
noremap('<leader>9', '9gt')

-- Toggle spelling checker
map('<F4>', ':setlocal spell! spelllang=en_us<CR>')

-- Replace currently selected text with default register without yanking it
xnoremap('<leader>p', '"_dP')

-- Delete without yanking
nnoremap('<leader>d', '"_d')
vnoremap('<leader>d', '"_d')

-- This is going to get me cancelled
inoremap('<C-c>', '<Esc>')

-- Replace
nnoremap('<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
noremap('<leader>x', ':!chmod +x %<CR>', { silent = true })

-- Exit terminal mode
tnoremap('<Esc>', [[<C-\><C-n>]])

-- Better indenting
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Avoid using arrow keys
-- noremap("<Up>", "<NOP>")
-- noremap("<Down>", "<NOP>")
-- noremap("<Left>", "<NOP>")
-- noremap("<Right>", "<NOP>")
