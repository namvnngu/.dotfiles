local lsp_servers = {
    {
        name = "denols",
        bins = {
            "deno",
        },
    },
    {
        name = "ts_ls",
        root = { "package.json" },
        bins = function()
            local tsc = "node_modules/.bin/tsc"
            if vim.fn.executable(tsc) == 0 then
                return nil
            end

            local version = vim.version.parse(vim.fn.system({
                tsc,
                "--version",
            }))
            if version == nil or version.major >= 7 then
                return nil
            end

            return {
                "node_modules/.bin/typescript-language-server",
                "typescript-language-server",
            }
        end,
    },
    {
        name = "tsc",
        root = { "package.json" },
        bins = function()
            local tsc = "node_modules/.bin/tsc"
            if vim.fn.executable(tsc) == 0 then
                return nil
            end

            local version = vim.version.parse(vim.fn.system({
                tsc,
                "--version",
            }))
            if version == nil or version.major < 7 then
                return nil
            end

            return {
                "node_modules/.bin/tsc",
                "tsc",
            }
        end,
    },
    {
        name = "eslint",
        bins = {
            "node_modules/.bin/vscode-eslint-language-server",
            "vscode-eslint-language-server",
        },
    },
    {
        name = "biome",
        bins = {
            "node_modules/.bin/biome",
            "biome",
        },
    },
    {
        name = "oxlint",
        bins = {
            "node_modules/.bin/oxlint",
            "oxlint",
        },
    },
    {
        name = "oxfmt",
        bins = {
            "node_modules/.bin/oxfmt",
            "oxfmt",
        },
    },
}
for _, server in ipairs(lsp_servers) do
    local ok = server.root and vim.fs.root(0, server.root) ~= nil or true

    local bins = type(server.bins) == "function" and server.bins()
        or server.bins
    ok = ok
            and bins
            and vim.iter(bins):any(function(bin)
                return vim.fn.executable(bin) == 1
            end)
        or false

    if ok and server.config then
        vim.lsp.config(server.name, server.config)
    end
    if ok then
        vim.lsp.enable(server.name)
    end
end

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
    conform.formatters_by_ft.typescript =
        { "oxfmt", "biome", "prettier", stop_after_first = true }
end
