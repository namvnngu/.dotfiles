local utils = require("utils")

-- Trim spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = utils.augroup("trim_spaces"),
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[
      keepjumps keeppatterns silent! %s/\s\+$//e
      keepjumps keeppatterns silent! %s/\%^\n\+//
      keepjumps keeppatterns silent! %s/\(\n\n\)\n\+/\1/
      keepjumps keeppatterns silent! %s/\($\n\s*\)\+\%$//
    ]])
    vim.fn.winrestview(view)
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = utils.augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = utils.augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Big file
local BIGFILE_SIZE_IN_BYTE = 1.5 * 1024 * 1024 -- 1.5MB
local BIGFILE_SIZE_LINES = 10000

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = utils.augroup("bigfile"),
  callback = function(event)
    local bufnr = event.buf

    local lines = vim.api.nvim_buf_line_count(bufnr)
    if lines < BIGFILE_SIZE_LINES then
      return
    end

    local path = vim.api.nvim_buf_get_name(bufnr)
    local size = vim.fn.getfsize(path)
    if size < BIGFILE_SIZE_IN_BYTE then
      return
    end

    vim.cmd("NoMatchParen")
    vim.cmd("syntax off")
    vim.cmd("syntax clear")
  end,
})

-- Stop treesitter
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = utils.augroup("stop_treesitter"),
  callback = function(event)
    vim.treesitter.stop(event.buf)
  end,
})

-- Bookmark the current location before jumping to the quickfix list
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
  group = utils.augroup("mark_postqf"),
  command = "norm mG",
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
