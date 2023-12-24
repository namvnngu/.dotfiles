local M = {}

function M.on_attach(_, buffer)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[buffer].omnifunc = "v:lua.vim.lsp.omnifunc"
end

return M
