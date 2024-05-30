local M = {}

function M.on_attach(client, bufnr)
  local lsp_highlight_augroup =
    vim.api.nvim_create_augroup("LspHighlight", { clear = true })
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_clear_autocmds({
      group = lsp_highlight_augroup,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = lsp_highlight_augroup,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = lsp_highlight_augroup,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

return M
