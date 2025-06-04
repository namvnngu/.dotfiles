local nnoremap = require("utils.keymap").nnoremap
local vnoremap = require("utils.keymap").vnoremap
local noremap = require("utils.keymap").noremap
local xnoremap = require("utils.keymap").xnoremap
local inoremap = require("utils.keymap").inoremap
local tnoremap = require("utils.keymap").tnoremap
local map = require("utils.keymap").map

-- Move to window
nnoremap("<Leader>h", ":wincmd h<cr>")
nnoremap("<Leader>j", ":wincmd j<cr>")
nnoremap("<Leader>k", ":wincmd k<cr>")
nnoremap("<Leader>l", ":wincmd l<cr>")

-- Resize window
nnoremap("<Up>", ":resize -2<cr>")
nnoremap("<Down>", ":resize +2<cr>")
nnoremap("<Right>", ":vertical resize +2<cr>")
nnoremap("<Left>", ":vertical resize -2<cr>")

-- Yanking
nnoremap("<Leader>ya", ":%y+<cr>")
nnoremap("<Leader>y", '"+y')
vnoremap("<Leader>y", '"+y')
nnoremap("<Leader>Y", '"+y$', { desc = "Yank til the end" })
nnoremap("Y", "y$")

-- Buffers
nnoremap("<Leader>bn", ":bnext<cr>")
nnoremap("<Leader>bp", ":bprevious<cr>")
nnoremap("<Leader>bd", ":bdelete<cr>")
nnoremap("<Leader>ba", ":bufdo bd<cr>")
nnoremap("<Leader>be", ":%bd|e#<cr>")

-- Better indenting
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Move lines
nnoremap("<Leader>md", ":m .+1<cr>==")
nnoremap("<Leader>mu", ":m .-2<cr>==")
inoremap("<A-j>", "<esc>:m .+1<cr>==gi")
inoremap("<A-k>", "<esc>:m .-2<cr>==gi")
vnoremap("J", ":m '>+1<cr>gv=gv")
vnoremap("K", ":m '<-2<cr>gv=gv")

-- Clear search with <esc>
nnoremap("<esc>", ":noh<cr>")

-- Keeping it centered and stable
nnoremap("J", "mzJ`z")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Quickfix list
nnoremap("<C-k>", ":cnext<cr>zz")
nnoremap("<C-j>", ":cprev<cr>zz")

-- Location list
nnoremap("<Leader>K", ":lnext<cr>zz")
nnoremap("<Leader>J", ":lprev<cr>zz")

-- Keybindings for tab navigation with leader and number
noremap("<Leader>1", "1gt")
noremap("<Leader>2", "2gt")
noremap("<Leader>3", "3gt")
noremap("<Leader>4", "4gt")
noremap("<Leader>5", "5gt")
noremap("<Leader>6", "6gt")
noremap("<Leader>7", "7gt")
noremap("<Leader>8", "8gt")
noremap("<Leader>9", "9gt")

-- Toggle spelling checker
map("<F4>", ":setlocal spell! spelllang=en_us<cr>")

-- Replace currently selected text with default register without yanking it
xnoremap("<Leader>p", '"_dP')

-- Delete without yanking
nnoremap("<Leader>d", '"_d')
vnoremap("<Leader>d", '"_d')

-- This is going to get me cancelled
inoremap("<C-c>", "<esc>")

-- Replace
nnoremap("<Leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
noremap("<Leader>x", ":!chmod +x %<cr>", { silent = true })

-- Exit terminal mode
tnoremap("<esc>", [[<C-\><C-n>]])

-- Avoid using arrow keys
-- noremap("<Up>", "<NOP>")
-- noremap("<Down>", "<NOP>")
-- noremap("<Left>", "<NOP>")
-- noremap("<Right>", "<NOP>")
