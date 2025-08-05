-- n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
-- i  Insert mode map. Defined using ':imap' or ':inoremap'.
-- v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
-- x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
-- s  Select mode map. Defined using ':smap' or ':snoremap'.
-- c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
-- o  Operator pending mode map. Defined using ':omap' or ':onoremap'.
-- t  Create a mapping that applies only in Terminal mode. Defined using ':tmap' or ':tnoremap'.

-- Move to window
vim.keymap.set("n", "<Leader>h", "<C-W>h", { remap = true })
vim.keymap.set("n", "<Leader>j", "<C-W>j", { remap = true })
vim.keymap.set("n", "<Leader>k", "<C-W>k", { remap = true })
vim.keymap.set("n", "<Leader>l", "<C-W>l", { remap = true })

-- Yank the current file path
vim.keymap.set("n", "yp", ":call setreg('+', expand('%:p'))<CR>")

-- Navigate quickfix list
vim.keymap.set("n", "<C-J>", ":cnext<CR>zz")
vim.keymap.set("n", "<C-K>", ":cprev<CR>zz")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Toggle spelling checker
vim.keymap.set("", "<F12>", ":setlocal spell! spelllang=en_us<CR>", { remap = true })

-- Replace currently selected text with black hole register without yanking it
vim.keymap.set("v", "<Leader>p", '"_dP')

-- Replace word under cursor
vim.keymap.set("n", "<Leader>s", [[:%s/\<<C-R><C-W>\>/<C-R><C-W>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<Leader>x", ":!chmod +x %<CR>", { silent = true })

-- Create or edit file
vim.keymap.set("n", "<Leader>e", ":e <C-R>=expand('%:p:h') . '/'<CR>")

-- Fix the indentation of the entire file
vim.keymap.set("n", "<Leader>=", function()
  local view = vim.fn.winsaveview()
  vim.cmd("keepjumps keeppatterns silent! norm gg=G")
  vim.fn.winrestview(view)
end)

-- Format the entire file
vim.keymap.set("n", "<Leader>gq", function()
  local view = vim.fn.winsaveview()
  vim.cmd("keepjumps keeppatterns silent! norm gggqG")
  vim.fn.winrestview(view)
end)

-- Preview markdown
vim.keymap.set("n", "<Leader>mp", ":!mdp '%'<CR>")

-- Set the current buffer to become scratch
vim.keymap.set("n", "<Leader>bs", ":setlocal bt=nofile bh=wipe noswf<CR>")
