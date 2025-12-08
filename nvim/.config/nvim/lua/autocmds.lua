-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("nn_resize_splits", { clear = true }),
  command = "wincmd =",
})

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = vim.api.nvim_create_augroup("nn_highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Stop treesitter
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("nn_stop_treesitter", { clear = true }),
  callback = function(event)
    vim.treesitter.stop(event.buf)
  end,
})

-- Create intermediate directories on edit
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("nn_mkdir_on_edit", { clear = true }),
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if dir:match("^/") and vim.fn.isdirectory(dir) == 0 then
      local input = vim.fn.input(("'%s' does not exist. Create? [y/N] "):format(dir))
      if input:lower():match("^(y)?(ye)?(yes)?$") then
        vim.fn.mkdir(dir, "p")
      end
    end
  end,
})
