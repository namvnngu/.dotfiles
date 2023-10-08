local M = {}

function M.on_attach(client, buffer)
 local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
  if client.server_capabilities.inlayHintProvider and inlay_hint then
    inlay_hint(buffer, true)
  end
end

return M
