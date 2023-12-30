local M = {}

---@return string 'Linux, Darwin or Windows'
function M.get_os_name()
  return vim.loop.os_uname().sysname
end

return M
