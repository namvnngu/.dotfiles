local M = {}

-- Get the path of the current file
---@return string|nil
function M.get_filepath()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == "" then
    return nil
  end
  if filepath:match("^term://") then
    return nil
  end
  return filepath
end

-- Get the current filename
---@return string|nil
function M.get_filename()
  local filepath = M.get_filepath()
  return filepath and vim.fn.fnamemodify(filepath, ":t")
end

-- Get the current line number
---@return number
function M.get_line_number()
  return vim.api.nvim_win_get_cursor(0)[1]
end

-- Get the extension of the current file
---@return string
function M.get_file_ext()
  return vim.fn.expand("%:e")
end

return M
