vim.b.dispatch = "mdp '%'"
vim.b.start = "mdp '%'"

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
    conform.formatters_by_ft.markdown =
        { "oxfmt", "prettier", stop_after_first = true }
end
