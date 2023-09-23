local M = {}

---@return string|nil
function M.get_filepath()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == '' then
    return nil
  end
  if filepath:match('^term://') then
    return nil
  end
  return filepath
end

---@return number
function M.get_line_number()
  return vim.api.nvim_win_get_cursor(0)[1]
end

--@return number of tabs and tabstop in string
function M.get_tabs_len_in_string(s)
  local _, tab_count = s:gsub('\t', '')
  return tab_count, vim.api.nvim_buf_get_option(0, 'tabstop')
end

function M.get_line_length()
  local cur_line = vim.api.nvim_get_current_line()
  local tc, ts = M.get_tabs_len_in_string(cur_line)
  return string.len(cur_line) + (tc * (ts - 1))
end

function M.get_file_ext()
  return vim.fn.expand('%:e')
end

function M.get_filetype()
  return vim.bo.filetype
end

return M
