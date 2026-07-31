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
        config = {
            cmd = function(dispatchers, config)
                local version = string.match(
                    vim.trim(vim.fn.system("pnpm tsc --version")),
                    "^Version (%d+%.%d+%.%d+)$"
                )
                if string.find(version, "7%.%d+%.%d+") then
                    return vim.lsp.rpc.start(
                        { "pnpm", "tsc", "--lsp", "--stdio" },
                        dispatchers
                    )
                end

                local cmd = "typescript-language-server"
                if (config or {}).root_dir then
                    local local_cmd = vim.fs.joinpath(
                        config.root_dir,
                        "node_modules/.bin",
                        cmd
                    )
                    if vim.fn.executable(local_cmd) == 1 then
                        cmd = local_cmd
                    end
                end
                return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
            end,
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
