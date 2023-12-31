local M = {}

---Operate shallow copy
---@generic T
---@param original T
---@return T
function M.shallow_copy(original)
  local orig_type = type(original)
  local copy
  if orig_type == "table" then
    copy = {}
    for orig_key, orig_value in pairs(original) do
      copy[orig_key] = orig_value
    end
  else -- number, string, boolean, etc
    copy = original
  end
  return copy
end

return M
