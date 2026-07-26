local ok, conform = pcall(require, "conform")

if not ok then
    return
end

conform.setup()

vim.keymap.set("n", "<Leader>f", function()
    conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
