local plugins = {
    "https://github.com/junegunn/fzf",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/tommcdo/vim-lion",
    "https://github.com/tpope/vim-dispatch",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/tpope/vim-projectionist",
}

local optional = {
    lsp = {
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/j-hui/fidget.nvim",
    },
    format = {
        "https://github.com/stevearc/conform.nvim",
    },
    debug = {
        "https://github.com/mfussenegger/nvim-dap",
    },
    database = {
        "https://github.com/tpope/vim-dadbod",
        "https://github.com/kristijanhusak/vim-dadbod-ui",
    },
    repl = {
        "https://github.com/Olical/conjure",
    },
    clojure = {
        "https://github.com/tpope/vim-fireplace",
        "https://github.com/tpope/vim-salve",
    },
    csharp = {
        "https://github.com/GustavEikaas/easy-dotnet.nvim",
    },
    java = {
        "https://github.com/nvim-java/nvim-java",
    },
}

local config_ok, config = pcall(require, "_config")
local function apply_optional_plugins(name, group)
    local plugin = config.plugins[name]
    if not plugin or not plugin.enabled then
        return
    end

    vim.list_extend(plugins, group)

    for gkey, gvalue in pairs(plugin.gvars or {}) do
        vim.g[gkey] = gvalue
    end
end

if config_ok and config.plugins then
    for name, group in pairs(optional) do
        apply_optional_plugins(name, group)
    end
end

vim.pack.add(plugins)
