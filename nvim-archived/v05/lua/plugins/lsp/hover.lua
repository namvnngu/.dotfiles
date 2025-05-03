local M = {}

local highlight_augroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
local clear_highlight_augroup =
  vim.api.nvim_create_augroup("LspClearDocumentHighlight", { clear = true })

function M.on_attach(client, bufnr)
  local ms = vim.lsp.protocol.Methods

  if client.supports_method(ms.textDocument_documentHighlight) then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = highlight_augroup,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = clear_highlight_augroup,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

return M
