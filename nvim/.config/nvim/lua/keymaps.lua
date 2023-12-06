-- n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
-- i  Insert mode map. Defined using ':imap' or ':inoremap'.
-- v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
-- x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
-- s  Select mode map. Defined using ':smap' or ':snoremap'.
-- c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
-- o  Operator pending mode map. Defined using ':omap' or ':onoremap'.
-- t  Create a mapping that applies only in Terminal mode. Defined using ':tmap' or ':tnoremap'.

-- Move to window
vim.keymap.set("n", "<leader>h", "<C-w>h", { remap = true })
vim.keymap.set("n", "<leader>j", "<C-w>j", { remap = true })
vim.keymap.set("n", "<leader>k", "<C-w>k", { remap = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { remap = true })

-- Resize window
vim.keymap.set("n", "<Up>", ":resize +2<cr>")
vim.keymap.set("n", "<Down>", ":resize -2<cr>")
vim.keymap.set("n", "<Left>", ":vertical resize -2<cr>")
vim.keymap.set("n", "<Right>", ":vertical resize +2<cr>")

-- Yanking
vim.keymap.set("n", "<leader>ya", ":%y+<cr>")
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')
vim.keymap.set("n", "Y", "y$")

-- Buffers
vim.keymap.set("n", "<leader>bn", ":bnext<cr>")
vim.keymap.set("n", "<leader>bp", ":bprevious<cr>")
vim.keymap.set("n", "<leader>bd", ":bdelete<cr>")
vim.keymap.set("n", "<leader>ba", ":bufdo bd<cr>")
vim.keymap.set("n", "<leader>be", ":%bd|e#<cr>")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines
vim.keymap.set("n", "<leader>md", ":m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<leader>mu", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc>:m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
vim.keymap.set("n", "<esc>", ":noh<cr>", { desc = "Escape and clear hlsearch" })

-- Keeping it centered and stable
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Quickfix list
vim.keymap.set("n", "<C-j>", ":cnext<cr>zz")
vim.keymap.set("n", "<C-k>", ":cprev<cr>zz")

-- Location list
vim.keymap.set("n", "<leader>J", ":lnext<cr>zz")
vim.keymap.set("n", "<leader>K", ":lprev<cr>zz")

-- Keybindings for tab navigation with leader and number
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")

-- Toggle spelling checker
vim.keymap.set(
  "",
  "<F4>",
  ":setlocal spell! spelllang=en_us<cr>",
  { remap = true }
)

-- Replace currently selected text with default register without yanking it
vim.keymap.set("x", "<leader>p", '"_dP')

-- Delete without yanking
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<esc>")

-- Replace
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)

-- Make file executable
vim.keymap.set("n", "<leader>x", ":!chmod +x %<cr>", { silent = true })

-- Exit terminal mode
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])

-- Open URL
-- Reference: https://github.com/vim/vim/issues/4738#issuecomment-856925080
if package.config:sub(1, 1) == "\\" then
  require("utils.log").log(
    "I don't use Windows, so I don't know which command to open URL in terminal"
  )
elseif vim.fn.has("macunix") then
  vim.keymap.set(
    "n",
    "gx",
    ":execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>",
    { silent = true }
  )
else
  vim.keymap.set(
    "n",
    "gx",
    ":execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>",
    { silent = true }
  )
end

-- Avoid using arrow keys
-- vim.keymap.set("", "<Up>", "<NOP>")
-- vim.keymap.set("", "<Down>", "<NOP>")
-- vim.keymap.set("", "<Left>", "<NOP>")
-- vim.keymap.set("", "<Right>", "<NOP>")
