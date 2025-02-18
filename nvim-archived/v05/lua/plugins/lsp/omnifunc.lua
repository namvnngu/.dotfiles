local M = {}

function M.on_attach(client, bufnr)
  local ms = vim.lsp.protocol.Methods

  if client.supports_method(ms.textDocument_completion) then
    -- Enable completion triggered by <C-X><C-O>
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  end
end

return M
