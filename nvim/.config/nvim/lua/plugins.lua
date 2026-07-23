local base = {
    "https://github.com/junegunn/fzf",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/tommcdo/vim-lion",
    "https://github.com/tpope/vim-dispatch",
    "https://github.com/tpope/vim-fugitive",
}

local lsp = {
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/j-hui/fidget.nvim",
}

local formatting = {
    "https://github.com/stevearc/conform.nvim",
}

local testing = {
    "https://github.com/mfussenegger/nvim-dap",
}

local database = {
    "https://github.com/tpope/vim-dadbod",
    "https://github.com/kristijanhusak/vim-dadbod-ui",
}

local csharp = {
    "https://github.com/GustavEikaas/easy-dotnet.nvim",
}

local config_status, config = pcall(require, "_config")
local plugins = vim.list_extend({}, base)

if config_status and config.plugins and config.plugins.toggles then
    vim.list_extend(
        plugins, --
        config.plugins.toggles.lsp and lsp or {}
    )
    vim.list_extend(
        plugins, --
        config.plugins.toggles.formatting and formatting or {}
    )
    vim.list_extend(
        plugins, --
        config.plugins.toggles.testing and testing or {}
    )
    vim.list_extend(
        plugins, --
        config.plugins.toggles.database and database or {}
    )
    vim.list_extend(
        plugins, --
        config.plugins.toggles.csharp and csharp or {}
    )
end

vim.pack.add(plugins)
