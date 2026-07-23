if
    vim.fn.executable("node_modules/.bin/vscode-css-language-server")
    or vim.fn.executable("vscode-css-language-server")
then
    vim.lsp.enable("cssls")
end
