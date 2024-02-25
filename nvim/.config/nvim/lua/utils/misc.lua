local M = {}

-- Operate shallow copy
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

-- Create a debounced function that delays the given function
-- until after the stated wait time in milliseconds has passed
-- since the last time this debounced function was called.
---@param delay_in_ms number
---@param callback fun(...)
---@return fun(...)
function M.debounce(callback, delay_in_ms)
  local timer = vim.loop.new_timer()
  return function(...)
    local argv = { ... }
    timer:start(delay_in_ms, 0, function()
      timer:stop()
      vim.schedule_wrap(callback)(unpack(argv))
    end)
  end
end

return M
