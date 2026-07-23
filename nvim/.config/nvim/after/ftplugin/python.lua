vim.b.dispatch = "python3 %"
vim.b.start = "python3 %"

local conform_status, conform = pcall(require, "conform")
if conform_status then
    conform.formatters_by_ft.python = { "ruff_format" }
end
