local M = {}

---Merges map entries of `source` into `target`.
---@param source table<any, any>
---@param target table<any, any>
function M.merge(source, target)
  return vim.tbl_deep_extend('force', {}, source, target)
end

return M
