local M = {}

function M.on_attach(client, buffer)
  local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
  if client.server_capabilities.inlayHintProvider and inlay_hint then
    if type(inlay_hint) == "function" then
      inlay_hint(buffer, true)
    elseif type(inlay_hint) == "table" and inlay_hint.enable then
      inlay_hint.enable(buffer, true)
    end
  end
end

return M
