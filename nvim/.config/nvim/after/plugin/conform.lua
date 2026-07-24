local status, conform = pcall(require, "conform")

if not status then
    return
end

conform.setup()

vim.keymap.set("n", "<Leader>f", function()
    conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
