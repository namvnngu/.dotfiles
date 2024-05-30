local M = {}

function M.on_attach(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
end

return M
