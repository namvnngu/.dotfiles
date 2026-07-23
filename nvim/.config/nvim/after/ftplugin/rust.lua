if vim.fn.executable("rust-analyzer") then
    vim.lsp.enable("rust_analyzer")
end


local conform_status, conform = pcall(require, "conform")
if conform_status then
    conform.formatters_by_ft.rust = { "rustfmt" }
end
