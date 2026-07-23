local lsp_servers = {
    {
        name = "denols",
        executables = {
            "deno",
        },
    },
    {
        name = "ts_ls",
        root = "package.json",
        executables = {
            "node_modules/.bin/typescript-language-server",
            "typescript-language-server",
        },
    },
    {
        name = "eslint",
        executables = {
            "node_modules/.bin/vscode-eslint-language-server",
            "vscode-eslint-language-server",
        },
    },
    {
        name = "biome",
        executables = {
            "node_modules/.bin/biome",
            "biome",
        },
    },
    {
        name = "oxlint",
        executables = {
            "node_modules/.bin/oxlint",
            "oxlint",
        },
    },
    {
        name = "oxfmt",
        executables = {
            "node_modules/.bin/oxfmt",
            "oxfmt",
        },
    },
}
for _, server in ipairs(lsp_servers) do
    local ok = server.root and vim.fs.root(0, server.root) ~= nil or true

    ok = ok
        and vim.iter(server.executables):any(function(exe)
            return vim.fn.executable(exe) == 1
        end)

    if ok then
        vim.lsp.enable(server.name)
    end
end

local conform_status, conform = pcall(require, "conform")
if conform_status then
    conform.formatters_by_ft.typescript =
        { "oxfmt", "biome", "prettier", stop_after_first = true }
end
