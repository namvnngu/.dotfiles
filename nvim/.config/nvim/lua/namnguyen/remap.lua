local nnoremap = require("utils.keymap").nnoremap
local vnoremap = require("utils.keymap").vnoremap
local noremap = require("utils.keymap").noremap
local xnoremap = require("utils.keymap").xnoremap
local inoremap = require("utils.keymap").inoremap
local map = require("utils.keymap").map

nnoremap("<leader>h", "<cmd>wincmd h<CR>")
nnoremap("<leader>j", "<cmd>wincmd j<CR>")
nnoremap("<leader>k", "<cmd>wincmd k<CR>")
nnoremap("<leader>l", "<cmd>wincmd l<CR>")

nnoremap("<Up>", "<cmd>resize -2<CR>")
nnoremap("<Down>", "<cmd>resize +2<CR>")
nnoremap("<Right>", "<cmd>vertical resize +2<CR>")
nnoremap("<Left>", "<cmd>vertical resize -2<CR>")

nnoremap("<leader>qq", "<cmd>q<CR>")

nnoremap("<leader>ay", "<cmd>%y+<CR>")

nnoremap("<leader>bn", "<cmd>bnext<CR>")
nnoremap("<leader>bp", "<cmd>bprevious<CR>")
nnoremap("<leader>bd", "<cmd>bdelete<CR>")

vnoremap("J", "<cmd>m '>+1<CR>gv=gv")
vnoremap("K", "<cmd>m '<-2<CR>gv=gv")

-- Yank til the end
nnoremap("Y", "y$")

-- Keeping it centered and stable
nnoremap("J", "mzJ`z")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Quicklist
nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
nnoremap("<leader>K", "<cmd>lnext<CR>zz")
nnoremap("<leader>J", "<cmd>lprev<CR>zz")

-- Keybindings for tab navigation with leader and number
noremap("<leader>1", "1gt")
noremap("<leader>2", "2gt")
noremap("<leader>3", "3gt")
noremap("<leader>4", "4gt")
noremap("<leader>5", "5gt")
noremap("<leader>6", "6gt")
noremap("<leader>7", "7gt")
noremap("<leader>8", "8gt")
noremap("<leader>9", "9gt")

-- Toggle spelling checker
map("<F4>", "<cmd>setlocal spell! spelllang=en_us<CR>")

-- Replace currently selected text with default register without yanking it
xnoremap("<leader>p", '"_dP')

-- Delete without yanking
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

-- Replace
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
noremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Avoid using arrow keys
-- noremap("<Up>", "<NOP>")
-- noremap("<Down>", "<NOP>")
-- noremap("<Left>", "<NOP>")
-- noremap("<Right>", "<NOP>")
