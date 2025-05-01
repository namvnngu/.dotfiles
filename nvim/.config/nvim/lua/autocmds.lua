local function augroup(name)
  return vim.api.nvim_create_augroup("namnguyen_" .. name, { clear = true })
end

-- Trim spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("trim_spaces"),
  pattern = "*",
  callback = function()
    local patterns = {
      [[%s/\s\+$//e]],
      [[%s/\%^\n\+//]],
      [[%s/\(\n\n\)\n\+/\1/]],
      [[%s/\($\n\s*\)\+\%$//]],
    }
    local view = vim.fn.winsaveview()
    for _, v in pairs(patterns) do
      vim.api.nvim_exec2(
        string.format("keepjumps keeppatterns silent! %s", v),
        { output = false }
      )
    end
    vim.fn.winrestview(view)
  end,
})

-- Set scss filetype to sass
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("scss_to_sass"),
  pattern = "*.scss",
  command = "set filetype=sass",
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Big file
-- Reference: https://github.com/folke/snacks.nvim/blob/main/lua/snacks/bigfile.lua
local BIGFILE_SIZE_IN_BYTE = 1.5 * 1024 * 1024 -- 1.5MB
local BIGFILE_SIZE_LINE = 1000

vim.filetype.add({
  pattern = {
    [".*"] = {
      function(path, buf)
        if not path or not buf or vim.bo[buf].filetype == "bigfile" then
          return
        end
        if path ~= vim.api.nvim_buf_get_name(buf) then
          return
        end
        local size = vim.fn.getfsize(path)
        if size <= 0 then
          return
        end
        if size > BIGFILE_SIZE_IN_BYTE then
          return "bigfile"
        end
        local lines = vim.api.nvim_buf_line_count(buf)
        return (size - lines) / lines > BIGFILE_SIZE_LINE and "bigfile" or nil
      end,
    },
  },
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("bigfile"),
  pattern = "bigfile",
  callback = function(ev)
    vim.api.nvim_buf_call(ev.buf, function()
      if vim.fn.exists(":NoMatchParen") ~= 0 then
        vim.cmd([[NoMatchParen]])
      end
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(ev.buf) then
          vim.bo[ev.buf].syntax = vim.filetype.match({ buf = ev.buf }) or ""
        end
      end)
    end)
  end,
})

-- Stop treesitter
vim.api.nvim_create_autocmd({ "BufRead" }, {
  group = augroup("stop_treesitter"),
  pattern = "*",
  callback = function(ev)
    if vim.api.nvim_buf_is_valid(ev.buf) then
      vim.treesitter.stop(ev.buf)
    end
  end,
})

-- Bookmark the current location before jumping to the quickfix list
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
  group = augroup("bookmark_before_quickfix_list"),
  command = "norm mG",
})

-- Set textwidth on markdown
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = augroup("markdown_textwidth"),
  pattern = "*.md",
  command = "setlocal textwidth=80",
})
