local M = {}

function M.trim(arg)
  return string.gsub(arg, '%s+', '')
end

return M
