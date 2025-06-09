local M = {}

--- Prints a message, and adds the message to `message-history`.
---
--- @param msg string The message.
--- @param is_error? boolean If `true`, the message is treated as an error.
function M.echom(msg, is_error)
  vim.api.nvim_echo({ { msg } }, true, { err = is_error })
end

--- Creates an autocommand group `autocmd-groups`.
---
--- @param name string The name of the group.
--- @param clear? boolean Defaults to `true`. If `true`, clear existing commands
--- if the group already exists `autocmd-groups`.
--- @return integer # Autocommand id (number)
function M.augroup(name, clear)
  return vim.api.nvim_create_augroup("namnguyen_" .. name, { clear = clear or true })
end

--- Gets a string that defines a runner user command.
---
--- @param cmd string The runner command.
--- @return string # A string that defines a runner user command.
function M.runnercmd(cmd)
  return ("command! Run vs | term %s"):format(cmd)
end

return M
