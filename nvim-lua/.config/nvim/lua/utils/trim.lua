local M = {}

-- Reference: https://github.com/cappyzawa/trim.nvim
M.trim = function(patterns)
  local save = vim.fn.winsaveview()
  for _, v in pairs(patterns) do
    vim.api.nvim_exec(string.format("keepjumps keeppatterns silent! %s", v), false)
  end
  vim.fn.winrestview(save)
end

M.trim_trailing_whitespace = function()
  M.trim({
    [[%s/\s\+$//e]],
    [[%s/\%^\n\+//]],
    [[%s/\(\n\n\)\n\+/\1/]],
    [[%s/\($\n\s*\)\+\%$//]],
  })
end

return M
