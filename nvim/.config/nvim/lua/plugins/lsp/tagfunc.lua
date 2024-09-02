local M = {}

function M.on_attach(client, bufnr)
  if client.supports_method("textDocument/definition") then
    vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
  end
end

return M
