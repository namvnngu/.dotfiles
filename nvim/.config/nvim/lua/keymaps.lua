-- Move to window
vim.keymap.set("n", "<Leader>h", "<C-W>h", { remap = true })
vim.keymap.set("n", "<Leader>j", "<C-W>j", { remap = true })
vim.keymap.set("n", "<Leader>k", "<C-W>k", { remap = true })
vim.keymap.set("n", "<Leader>l", "<C-W>l", { remap = true })

-- Yank the current file path
vim.keymap.set("n", "yp", "<Cmd>call setreg('+', expand('%:p'))<CR>")

-- Keep searching centered
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Keep half-window scrolling centered
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")

-- Navigate quickfix list and keep it centered
vim.keymap.set("n", "<C-J>", "<Cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-K>", "<Cmd>cprev<CR>zz")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Toggle spelling checker
vim.keymap.set("", "<F12>", "<Cmd>setlocal spell! spelllang=en_us<CR>", { remap = true })

-- Replace currently selected text with black hole register without yanking it
vim.keymap.set("v", "<Leader>p", '"_dP')

-- Replace word under cursor
vim.keymap.set("n", "<Leader>s", [[:%s/\<<C-R><C-W>\>/<C-R><C-W>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<Leader>x", "<Cmd>!chmod +x %<CR>")

-- Create or edit file
vim.keymap.set("n", "<Leader>e", ":e <C-R>=expand('%:p:h') . '/'<CR>")

-- Preview markdown
vim.keymap.set("n", "<Leader>mp", "<Cmd>!mdp '%'<CR>")

-- Make the current buffer a scratch buffer
vim.keymap.set("n", "<Leader>bs", "<Cmd>setlocal bt=nofile bh=wipe noswf<CR>")

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
