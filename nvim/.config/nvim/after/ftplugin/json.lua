if
    vim.fn.executable("node_modules/.bin/vscode-json-language-server")
    or vim.fn.executable("vscode-json-language-server")
then
    vim.lsp.enable("jsonls")
end

local conform_status, conform = pcall(require, "conform")
if conform_status then
    conform.formatters_by_ft.json =
        { "oxfmt", "preitter", stop_after_first = true }
end
