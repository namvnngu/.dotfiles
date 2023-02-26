local M = {}

M.trim = function(arg)
  return string.gsub(arg, '%s+', '')
end

return M
