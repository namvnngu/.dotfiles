local M = {}

M.key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

M.trim_string = function(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

M.split_string = function(s, delimiter)
  local result = {};
  for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, M.trim_string(match));
  end
  return result;
end


return M
