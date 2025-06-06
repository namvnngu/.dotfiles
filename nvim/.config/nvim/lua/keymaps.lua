-- n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
-- i  Insert mode map. Defined using ':imap' or ':inoremap'.
-- v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
-- x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
-- s  Select mode map. Defined using ':smap' or ':snoremap'.
-- c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
-- o  Operator pending mode map. Defined using ':omap' or ':onoremap'.
-- t  Create a mapping that applies only in Terminal mode. Defined using ':tmap' or ':tnoremap'.

-- Avoid using arrow keys
vim.keymap.set("", "<Up>", "<NOP>")
vim.keymap.set("", "<Down>", "<NOP>")
vim.keymap.set("", "<Left>", "<NOP>")
vim.keymap.set("", "<Right>", "<NOP>")

-- Move to window
vim.keymap.set("n", "<Leader>h", "<C-W>h", { remap = true })
vim.keymap.set("n", "<Leader>j", "<C-W>j", { remap = true })
vim.keymap.set("n", "<Leader>k", "<C-W>k", { remap = true })
vim.keymap.set("n", "<Leader>l", "<C-W>l", { remap = true })

-- Yanking
vim.keymap.set("n", "<Leader>ya", ":%y+<CR>")
vim.keymap.set("n", "<Leader>y", '"+y')
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("n", "<Leader>Y", '"+y$')
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "yp", ":exec setreg('+', expand('%:p'))<CR>")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up" })

--Clear highlighting search
vim.keymap.set(
  "n",
  "<C-L>",
  ":nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>",
  { silent = true }
)

-- Set a new undo point before joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Keep it centered and stable
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")
vim.keymap.set("n", "<C-F>", "<C-F>zz")
vim.keymap.set("n", "<C-B>", "<C-B>zz")

-- Quickfix list
vim.keymap.set("n", "<C-J>", ":cnext<CR>zz")
vim.keymap.set("n", "<C-K>", ":cprev<CR>zz")

-- Location list
vim.keymap.set("n", "<Leader>J", ":lnext<CR>zz")
vim.keymap.set("n", "<Leader>K", ":lprev<CR>zz")

-- Toggle spelling checker
vim.keymap.set("", "<F12>", ":setlocal spell! spelllang=en_us<CR>", { remap = true })

-- Replace currently selected text with black hole register without yanking it
vim.keymap.set("x", "<Leader>p", '"_dP')

-- Delete without yanking
vim.keymap.set("n", "<Leader>d", '"_d')
vim.keymap.set("v", "<Leader>d", '"_d')

-- Cancel
vim.keymap.set("i", "<C-C>", "<Esc>")

-- Replace word under cursor
vim.keymap.set("n", "<Leader>s", [[:%s/\<<C-R><C-W>\>/<C-R><C-W>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<Leader>x", ":!chmod +x %<CR>", { silent = true })

-- Create or edit file
vim.keymap.set("n", "<Leader>e", ":e <C-R>=expand('%:p:h') . '/'<CR>")

-- Open a file name under cursor in a new vertical split
vim.keymap.set("n", "<Leader><C-W>F", ":vertical wincmd F<CR>")

-- Exit terminal
vim.keymap.set("t", "<C-D>", [[<C-\><C-N>:q!<CR>]])

-- Fix the indentation of the entire file
vim.keymap.set("n", "<Leader>=", function()
  local view = vim.fn.winsaveview()
  vim.api.nvim_exec2("keepjumps keeppatterns silent! norm gg=G", { output = false })
  vim.fn.winrestview(view)
end)

-- Format the entire file
vim.keymap.set("n", "<Leader>gq", function()
  local view = vim.fn.winsaveview()
  vim.api.nvim_exec2("keepjumps keeppatterns silent! norm gggqG", { output = false })
  vim.fn.winrestview(view)
end)

-- Preview markdown
vim.keymap.set("n", "<Leader>mp", ":!mdp '%'<CR>")
