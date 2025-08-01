local M = {}

--- Prints a message.
---
--- @param msg string The message.
--- @param err? boolean If `true`, the message is treated as an error.
--- @param history? boolean Defaults to `true`. If `true`, add the message to `message-history`.
function M.echo(msg, err, history)
  vim.api.nvim_echo({ { msg } }, history or true, { err })
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
