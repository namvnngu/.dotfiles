local nnoremap = require('utils.keymap').nnoremap
local vnoremap = require('utils.keymap').vnoremap
local noremap = require('utils.keymap').noremap
local xnoremap = require('utils.keymap').xnoremap
local inoremap = require('utils.keymap').inoremap
local tnoremap = require('utils.keymap').tnoremap
local map = require('utils.keymap').map

-- Move to window
nnoremap('<leader>h', '<cmd>wincmd h<cr>')
nnoremap('<leader>j', '<cmd>wincmd j<cr>')
nnoremap('<leader>k', '<cmd>wincmd k<cr>')
nnoremap('<leader>l', '<cmd>wincmd l<cr>')

-- Resize window
nnoremap('<Up>', '<cmd>resize -2<cr>')
nnoremap('<Down>', '<cmd>resize +2<cr>')
nnoremap('<Right>', '<cmd>vertical resize +2<cr>')
nnoremap('<Left>', '<cmd>vertical resize -2<cr>')

-- Yanking
nnoremap('<leader>ya', '<cmd>%y+<cr>')
nnoremap('<leader>y', '"+y')
vnoremap('<leader>y', '"+y')
nnoremap('<leader>Y', '"+y$', { desc = 'Yank til the end' })
nnoremap('Y', 'y$')

-- Buffers
nnoremap('<leader>bn', '<cmd>bnext<cr>')
nnoremap('<leader>bp', '<cmd>bprevious<cr>')
nnoremap('<leader>bd', '<cmd>bdelete<cr>')
nnoremap('<leader>ba', '<cmd>bufdo bd<cr>')
nnoremap('<leader>be', '<cmd>%bd|e#<cr>')

-- Better indenting
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- Move lines
nnoremap('<leader>md', '<cmd>m .+1<cr>==')
nnoremap('<leader>mu', '<cmd>m .-2<cr>==')
inoremap('<A-j>', '<esc><cmd>m .+1<cr>==gi')
inoremap('<A-k>', '<esc><cmd>m .-2<cr>==gi')
vnoremap('J', ":m '>+1<cr>gv=gv")
vnoremap('K', ":m '<-2<cr>gv=gv")

-- Clear search with <esc>
nnoremap('<esc>', '<cmd>noh<cr><esc>')
inoremap('<esc>', '<cmd>noh<cr><esc>')

-- New file
nnoremap('<leader>fn', '<cmd>enew<cr>')

-- Keeping it centered and stable
nnoremap('J', 'mzJ`z')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')

-- Quickfix list
nnoremap('<C-k>', '<cmd>cnext<cr>zz')
nnoremap('<C-j>', '<cmd>cprev<cr>zz')

-- Location list
nnoremap('<leader>K', '<cmd>lnext<cr>zz')
nnoremap('<leader>J', '<cmd>lprev<cr>zz')

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
map('<F4>', '<cmd>setlocal spell! spelllang=en_us<cr>')

-- Replace currently selected text with default register without yanking it
xnoremap('<leader>p', '"_dP')

-- Delete without yanking
nnoremap('<leader>d', '"_d')
vnoremap('<leader>d', '"_d')

-- This is going to get me cancelled
inoremap('<C-c>', '<esc>')

-- Replace
nnoremap('<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
noremap('<leader>x', '<cmd>!chmod +x %<cr>', { silent = true })

-- Exit terminal mode
tnoremap('<esc>', [[<C-\><C-n>]])

-- Quite all
nnoremap('<leader>qq', '<cmd>q<cr>')

-- Avoid using arrow keys
-- noremap("<Up>", "<NOP>")
-- noremap("<Down>", "<NOP>")
-- noremap("<Left>", "<NOP>")
-- noremap("<Right>", "<NOP>")
