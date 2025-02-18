local M = {}

function M.on_init(client)
  client.server_capabilities.semanticTokensProvider = nil

  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end
end

return M
