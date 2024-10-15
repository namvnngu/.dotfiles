local M = {}

--- Notify debug message
---
--- @param msg string Content of the notification to show to the user.
--- @param opts table|nil Optional parameters. Unused by default.
function M.debug(msg, opts)
  vim.notify(msg, vim.log.levels.DEBUG, opts)
end

--- Notify error message
---
--- @param msg string Content of the notification to show to the user.
--- @param opts table|nil Optional parameters. Unused by default.
function M.error(msg, opts)
  vim.notify(msg, vim.log.levels.ERROR, opts)
end

--- Notify info message
---
--- @param msg string Content of the notification to show to the user.
--- @param opts table|nil Optional parameters. Unused by default.
function M.info(msg, opts)
  vim.notify(msg, vim.log.levels.INFO, opts)
end

--- Notify trace message
---
--- @param msg string Content of the notification to show to the user.
--- @param opts table|nil Optional parameters. Unused by default.
function M.trace(msg, opts)
  vim.notify(msg, vim.log.levels.TRACE, opts)
end

--- Notify warn message
---
--- @param msg string Content of the notification to show to the user.
--- @param opts table|nil Optional parameters. Unused by default.
function M.warn(msg, opts)
  vim.notify(msg, vim.log.levels.WARN, opts)
end

--- Notify off message
---
--- @param msg string Content of the notification to show to the user.
--- @param opts table|nil Optional parameters. Unused by default.
function M.off(msg, opts)
  vim.notify(msg, vim.log.levels.OFF, opts)
end

return M
