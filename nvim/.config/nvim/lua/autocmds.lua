local utils = require("utils")

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = utils.augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Stop treesitter
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = utils.augroup("stop_treesitter"),
  callback = function(event)
    vim.treesitter.stop(event.buf)
  end,
})

-- Create intermediate directories on edit
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = utils.augroup("mkdir_on_edit"),
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
