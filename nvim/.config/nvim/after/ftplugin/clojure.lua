if vim.fn.executable("clojure-lsp") then
    vim.lsp.enable("clojure_lsp")
end

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
    conform.formatters_by_ft.clojure = { "joker" }
end
