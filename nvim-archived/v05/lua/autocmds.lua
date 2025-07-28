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
    local save = vim.fn.winsaveview()
    for _, v in pairs(patterns) do
      vim.cmd(string.format("keepjumps keeppatterns silent! %s", v))
    end
    vim.fn.winrestview(save)
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
local BIGFILE_SIZE_IN_BYTE = 1024 * 1024 * 1.5 -- 1.5 MB
vim.filetype.add({
  pattern = {
    [".*"] = {
      function(path, buf)
        return vim.bo[buf]
            and vim.bo[buf].filetype ~= "bigfile"
            and path
            and vim.fn.getfsize(path) > BIGFILE_SIZE_IN_BYTE
            and "bigfile"
          or nil
      end,
    },
  },
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("bigfile"),
  pattern = "bigfile",
  callback = function(ev)
    vim.api.nvim_buf_call(ev.buf, function()
      vim.cmd("NoMatchParen")
      vim.schedule(function()
        vim.bo[ev.buf].syntax = vim.filetype.match({ buf = ev.buf }) or ""
      end)
    end)
  end,
})
