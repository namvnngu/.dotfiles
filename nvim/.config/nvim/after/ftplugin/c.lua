vim.b.dispatch = "cc -std=c99 -o %:p:r % && %:p:r"
vim.b.start = "cc -std=c99 -o %:p:r % && %:p:r"

if vim.fn.executable("clangd") then
    vim.lsp.config("clangd", {
        capabilities = { offsetEncoding = { "utf-16" } },
        init_options = {
            fallbackFlags = { "-std=c99" },
        },
    })
    vim.lsp.enable("clangd")
end

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
    conform.formatters_by_ft.c = { "clang_format" }
end
