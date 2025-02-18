local M = {}

local SEVERITY_LABELS = {
  [vim.diagnostic.severity.ERROR] = "E",
  [vim.diagnostic.severity.WARN] = "W",
  [vim.diagnostic.severity.INFO] = "I",
  [vim.diagnostic.severity.HINT] = "H",
}

--- @param diagnostic vim.Diagnostic The diagnostic
--- @return string diagnostic_message A diagnostic message
local function format_diagnostic_message(diagnostic)
  local severity_label = SEVERITY_LABELS[diagnostic.severity]

  if not severity_label then
    require("utils.notify").warn(
      string.format("Unknown diagnostic severity, %s.", diagnostic.severity)
    )
  end

  return string.format(
    "[%s] %s",
    severity_label or "UNKNOWN",
    diagnostic.message
  )
end

function M.on_attach()
  vim.diagnostic.config({
    float = { format = format_diagnostic_message },
    virtual_text = { format = format_diagnostic_message },
  })
end

return M
