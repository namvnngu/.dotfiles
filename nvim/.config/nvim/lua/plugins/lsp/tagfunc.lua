local M = {}

function M.on_attach(client, bufnr)
  local ms = vim.lsp.protocol.Methods

  if client.supports_method(ms.textDocument_definition) then
    vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
  end
end

return M
