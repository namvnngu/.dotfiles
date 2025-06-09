local M = {}

--- Prints a message, and adds the message to `message-history`.
---
--- @param msg string The message.
--- @param is_error? boolean If `true`, the message is treated as an error.
function M.echom(msg, is_error)
  vim.api.nvim_echo({ { msg } }, true, { err = is_error })
end

return M
