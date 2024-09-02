local M = {}

function M.on_attach()
  local SEVERITY_LABELS = {
    [vim.diagnostic.severity.INFO] = "I",
    [vim.diagnostic.severity.HINT] = "H",
    [vim.diagnostic.severity.WARN] = "W",
    [vim.diagnostic.severity.ERROR] = "E",
  }
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local severity_label = SEVERITY_LABELS[diagnostic.severity]

        if not severity_label then
          require("utils.log").run(
            string.format(
              "Unknown diagnostic severity, %s.",
              diagnostic.severity
            )
          )
        end

        return string.format(
          "[%s] %s",
          severity_label or "UNKNOWN",
          diagnostic.message
        )
      end,
    },
  })
end

return M
