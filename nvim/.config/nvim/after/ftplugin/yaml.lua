local conform_status, conform = pcall(require, "conform")
if conform_status then
    conform.formatters_by_ft.yaml =
        { "oxfmt", "prettier", stop_after_first = true }
end
