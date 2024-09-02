local M = {}

function M.on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  if client.supports_method("textDocument/completion") then
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  end
end

return M
