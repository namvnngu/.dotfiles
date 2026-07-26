vim.b.dispatch = "c++ -std=c++23 -o %:p:r % && %:p:r"
vim.b.start = "c++ -std=c++23 -o %:p:r % && %:p:r"

if vim.fn.executable("clangd") then
    vim.lsp.config("clangd", {
        capabilities = { offsetEncoding = { "utf-16" } },
        init_options = {
            fallbackFlags = { "-std=c++23" },
        },
    })
    vim.lsp.enable("clangd")
end

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
    conform.formatters_by_ft.cpp = { "clang_format" }
end
