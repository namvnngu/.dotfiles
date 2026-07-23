if
    vim.fn.executable("node_modules/.bin/vscode-html-language-server")
    or vim.fn.executable("vscode-html-language-server")
then
    vim.lsp.enable("html")
end
