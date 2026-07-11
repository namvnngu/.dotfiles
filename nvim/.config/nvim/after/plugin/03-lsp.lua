local start_lsp = vim.lsp.start
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.start = function(...)
    local _, opts = unpack({ ... })
    if opts and opts.bufnr then
        if vim.b[opts.bufnr].fugitive_type then
            return
        end
    end
    start_lsp(...)
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf --- @type number
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client then
            local ms = vim.lsp.protocol.Methods

            -- DIAGNOSTIC
            vim.diagnostic.config({ severity_sort = true })

            -- HOVER
            if client:supports_method(ms.textDocument_documentHighlight) then
                local hlgroup = vim.api.nvim_create_augroup(
                    "nn_lsp_highlight_symbol",
                    { clear = true }
                )

                vim.api.nvim_clear_autocmds({ buffer = bufnr, group = hlgroup })

                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    group = hlgroup,
                    buffer = bufnr,
                    callback = vim.lsp.buf.document_highlight,
                })
                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    group = hlgroup,
                    buffer = bufnr,
                    callback = vim.lsp.buf.clear_references,
                })
            end

            -- FOLDING
            local winid = vim.api.nvim_get_current_win()
            if
                not vim.wo[winid][0].diff
                and client:supports_method(ms.textDocument_foldingRange)
            then
                vim.wo[winid][0].foldmethod = "expr"
                vim.wo[winid][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
            end

            -- SEMANTIC TOKENS
            client.server_capabilities.semanticTokensProvider = nil
            for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
                vim.api.nvim_set_hl(0, group, {})
            end

            -- COMPLETION
            -- if client:supports_method(ms.textDocument_completion) then
            --   vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
            -- end

            -- INLINE COLORS
            -- if client:supports_method(ms.textDocument_documentColor) then
            --   vim.lsp.document_color.enable(true, bufnr)
            -- end
        end
    end,
})

-- Reference: https://github.com/stevearc/conform.nvim/blob/619363c30309d29ffa631e67c8183f2a72caa373/lua/conform/util.lua#L16
local function is_executable(paths, default)
    for _, path in ipairs(paths) do
        local normpath = vim.fs.normalize(path)
        local is_absolute = vim.startswith(normpath, "/")

        if is_absolute and vim.fn.executable(normpath) == 1 then
            return true
        end

        local idx = normpath:find("/", 1, true)
        local dir, subpath

        if idx then
            dir = normpath:sub(1, idx - 1)
            subpath = normpath:sub(idx)
        else
            -- This is a bare relative-path executable
            dir = normpath
            subpath = ""
        end

        local results = vim.fs.find(
            dir,
            { upward = true, path = vim.fn.getcwd(), limit = math.huge }
        )
        for _, result in ipairs(results) do
            local fullpath = result .. subpath

            if vim.fn.executable(fullpath) == 1 then
                return true
            end
        end
    end

    if default and vim.fn.executable(default) == 1 then
        return true
    end

    return false
end

vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

if is_executable({}, "lua-language-server") then
    vim.lsp.config("lua_ls", {
        on_init = function(client)
            if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if
                    path ~= vim.fn.stdpath("config")
                    and (
                        vim.uv.fs_stat(path .. "/.luarc.json")
                        or vim.uv.fs_stat(path .. "/.luarc.jsonc")
                    )
                then
                    return
                end
            end

            client.config.settings.Lua =
                vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        version = "LuaJIT",
                        path = {
                            "lua/?.lua",
                            "lua/?/init.lua",
                        },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                })
        end,
        settings = {
            Lua = {},
        },
    })
    vim.lsp.enable("lua_ls")
end

if is_executable({}, "clangd") then
    vim.lsp.config("clangd", {
        capabilities = { offsetEncoding = { "utf-16" } },
        init_options = {
            fallbackFlags = { "-std=c++23" },
        },
    })
    vim.lsp.enable("clangd")
end

if is_executable({}, "typos-lsp") then
    vim.lsp.config("typos_lsp", {
        init_options = { diagnosticSeverity = "Hint" },
    })
    vim.lsp.enable("typos_lsp")
end

if is_executable({}, "csharp-ls") then
    vim.lsp.enable("csharp_ls")
    local status, csharpls_extended = pcall(require, "csharpls_extended")
    if status then
        csharpls_extended.buf_read_cmd_bind()
    end
end

if is_executable({}, "deno") then
    vim.lsp.enable("denols")
end

if is_executable({}, "tinymist") then
    vim.lsp.enable("tinymist")
end

if is_executable({}, "gopls") then
    vim.lsp.enable("gopls")
end

if is_executable({}, "rust-analyzer") then
    vim.lsp.enable("rust_analyzer")
end

if is_executable({}, "clojure-lsp") then
    vim.lsp.enable("clojure_lsp")
end

if
    is_executable(
        { "node_modules/.bin/typescript-language-server" },
        "typescript-language-server"
    ) and vim.fs.root(0, "package.json")
then
    vim.lsp.enable("ts_ls")
end

if
    is_executable(
        { "node_modules/.bin/vscode-eslint-language-server" },
        "vscode-eslint-language-server"
    )
then
    vim.lsp.enable("eslint")
end

if
    is_executable(
        { "node_modules/.bin/vscode-css-language-server" },
        "vscode-css-language-server"
    )
then
    vim.lsp.enable("cssls")
end

if
    is_executable(
        { "node_modules/.bin/vscode-html-language-server" },
        "vscode-html-language-server"
    )
then
    vim.lsp.enable("html")
end

if
    is_executable(
        { "node_modules/.bin/vscode-json-language-server" },
        "vscode-json-language-server"
    )
then
    vim.lsp.enable("jsonls")
end

if is_executable({ "node_modules/.bin/biome" }, "biome") then
    vim.lsp.enable("biome")
end

if is_executable({ "node_modules/.bin/oxlint" }, "oxlint") then
    vim.lsp.enable("oxlint")
end

if is_executable({ "node_modules/.bin/oxfmt" }, "oxfmt") then
    vim.lsp.enable("oxfmt")
end
