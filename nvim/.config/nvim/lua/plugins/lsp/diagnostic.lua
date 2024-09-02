local M = {}

function M.on_attach()
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local severity_labels = {
          [vim.diagnostic.severity.INFO] = "I",
          [vim.diagnostic.severity.HINT] = "H",
          [vim.diagnostic.severity.WARN] = "W",
          [vim.diagnostic.severity.ERROR] = "E",
        }
        return string.format(
          "[%s] %s",
          severity_labels[diagnostic.severity] or "unknown",
          diagnostic.message
        )
      end,
    },
  })
end

return M
