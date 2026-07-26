vim.b.dispatch = "python3 %"
vim.b.start = "python3 %"

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
    conform.formatters_by_ft.python = { "ruff_format" }
end
