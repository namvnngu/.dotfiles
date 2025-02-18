local M = {}

function M.on_attach(client, bufnr)
  local ms = vim.lsp.protocol.Methods

  if client.supports_method(ms.textDocument_inlayHint) then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
end

return M
