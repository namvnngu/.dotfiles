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
vim.keymap.set("n", "<Up>", ":resize +2<CR>")
vim.keymap.set("n", "<Down>", ":resize -2<CR>")
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>")

-- Yanking
vim.keymap.set("n", "<leader>ya", ":%y+<CR>")
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')
vim.keymap.set("n", "Y", "y$")

-- Buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
vim.keymap.set("n", "<leader>ba", ":bufdo bd<CR>")
vim.keymap.set("n", "<leader>be", ":%bd|e#<CR>")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines
vim.keymap.set("n", "<leader>md", ":m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("n", "<leader>mu", ":m .-2<CR>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up" })

-- Clear search with <Esc>
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Escape and clear hlsearch" })

-- Keeping it centered and stable
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Quickfix list
vim.keymap.set("n", "<C-j>", ":cnext<CR>zz")
vim.keymap.set("n", "<C-k>", ":cprev<CR>zz")

-- Location list
vim.keymap.set("n", "<leader>J", ":lnext<CR>zz")
vim.keymap.set("n", "<leader>K", ":lprev<CR>zz")

-- Toggle spelling checker
vim.keymap.set(
  "",
  "<F4>",
  ":setlocal spell! spelllang=en_us<CR>",
  { remap = true }
)

-- Replace currently selected text with default register without yanking it
vim.keymap.set("x", "<leader>p", '"_dP')

-- Delete without yanking
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Replace
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)

-- Make file executable
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>", { silent = true })

-- Exit terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- Copy the current file's path
vim.keymap.set("n", "yp", function()
  local filepath = require("utils.file").get_filepath()
  if not filepath then
    return
  end
  require("utils.system").to_clipboard(filepath)
  require("utils.notify").info("Copied to clipboard: " .. filepath)
end)

-- Open URL
-- Reference: https://github.com/vim/vim/issues/4738#issuecomment-856925080
vim.keymap.set("n", "gx", function()
  require("utils.system").launch_url(
    vim.fn.shellescape(vim.fn.expand("<cWORD>"), 1)
  )
end)

-- Avoid using arrow keys
-- vim.keymap.set("", "<Up>", "<NOP>")
-- vim.keymap.set("", "<Down>", "<NOP>")
-- vim.keymap.set("", "<Left>", "<NOP>")
-- vim.keymap.set("", "<Right>", "<NOP>")
