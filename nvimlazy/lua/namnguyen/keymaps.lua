-- n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
-- i  Insert mode map. Defined using ':imap' or ':inoremap'.
-- v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
-- x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
-- s  Select mode map. Defined using ':smap' or ':snoremap'.
-- c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
-- o  Operator pending mode map. Defined using ':omap' or ':onoremap'.
-- t  Create a mapping that applies only in Terminal mode. Defined using ':tmap' or ':tnoremap'.

-- Move to window
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Go to left window', remap = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = 'Go to lower window', remap = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = 'Go to upper window', remap = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Go to right window', remap = true })

-- Resize window
vim.keymap.set('n', '<Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Yanking
vim.keymap.set('n', '<leader>ya', '<cmd>%y+<cr>')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+y$', { desc = 'Yank til the end' })
vim.keymap.set('n', 'Y', 'y$')

-- Buffers
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd<cr>')
vim.keymap.set('n', '<leader>be', '<cmd>%bd|e#<cr>')

-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move lines
vim.keymap.set('n', '<leader>md', '<cmd>m .+1<cr>==', { desc = 'Move down' })
vim.keymap.set('n', '<leader>mu', '<cmd>m .-2<cr>==', { desc = 'Move up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- Clear search with <esc>
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- New file
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- Keeping it centered and stable
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Quickfix list
vim.keymap.set('n', '<C-k>', '<cmd>cnext<cr>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<cr>zz')

-- Location list
vim.keymap.set('n', '<leader>K', '<cmd>lnext<cr>zz')
vim.keymap.set('n', '<leader>J', '<cmd>lprev<cr>zz')

-- Keybindings for tab navigation with leader and number
vim.keymap.set('', '<leader>1', '1gt')
vim.keymap.set('', '<leader>2', '2gt')
vim.keymap.set('', '<leader>3', '3gt')
vim.keymap.set('', '<leader>4', '4gt')
vim.keymap.set('', '<leader>5', '5gt')
vim.keymap.set('', '<leader>6', '6gt')
vim.keymap.set('', '<leader>7', '7gt')
vim.keymap.set('', '<leader>8', '8gt')
vim.keymap.set('', '<leader>9', '9gt')

-- Toggle spelling checker
vim.keymap.set('', '<F4>', '<cmd>setlocal spell! spelllang=en_us<cr>', { remap = true })

-- Replace currently selected text with default register without yanking it
vim.keymap.set('x', '<leader>p', '"_dP')

-- Delete without yanking
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<esc>')

-- Replace
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set('', '<leader>x', '<cmd>!chmod +x %<cr>', { silent = true })

-- Exit terminal mode
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])

-- Quite all
vim.keymap.set('n', '<leader>qq', '<cmd>q<cr>')

-- Avoid using arrow keys
-- vim.keymap.set("", "<Up>", "<NOP>")
-- vim.keymap.set("", "<Down>", "<NOP>")
-- vim.keymap.set("", "<Left>", "<NOP>")
-- vim.keymap.set("", "<Right>", "<NOP>")
