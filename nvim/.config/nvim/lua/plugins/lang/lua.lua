return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      enabled = true,
      -- You can also add plugins you always want to have loaded.
      -- Useful if the plugin has globals or types you want to use
      library = {
        vim.env.LAZY .. "/luvit-meta/library",
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
}
