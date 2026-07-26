local plugins = {
    "https://github.com/junegunn/fzf",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/tommcdo/vim-lion",
    "https://github.com/tpope/vim-dispatch",
    "https://github.com/tpope/vim-fugitive",
}

local optional = {
    lsp = {
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/j-hui/fidget.nvim",
    },
    formatting = {
        "https://github.com/stevearc/conform.nvim",
    },
    testing = {
        "https://github.com/mfussenegger/nvim-dap",
    },
    database = {
        "https://github.com/tpope/vim-dadbod",
        "https://github.com/kristijanhusak/vim-dadbod-ui",
    },
    csharp = {
        "https://github.com/GustavEikaas/easy-dotnet.nvim",
    },
}

local config_ok, config = pcall(require, "_config")

if config_ok and config.plugins then
    for name, group in pairs(optional) do
        local plugin = config.plugins[name]
        if plugin and plugin.enabled then
            vim.list_extend(plugins, group)
        end
    end
end

vim.pack.add(plugins)
