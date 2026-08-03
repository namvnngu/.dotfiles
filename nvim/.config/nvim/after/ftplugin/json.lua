if
    vim.fn.executable("node_modules/.bin/vscode-json-language-server")
    or vim.fn.executable("vscode-json-language-server")
then
    vim.lsp.enable("jsonls")
end

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
    conform.formatters_by_ft.json =
        { "oxfmt", "prettier", stop_after_first = true }
end
