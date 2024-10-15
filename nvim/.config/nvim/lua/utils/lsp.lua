local M = {}

--- @param on_attach fun(client:vim.lsp.Client, bufnr)
--- @param name? string
function M.on_attach(on_attach, name)
  return vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf --- @type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and (not name or client.name == name) then
        return on_attach(client, bufnr)
      end
    end,
  })
end

return M
