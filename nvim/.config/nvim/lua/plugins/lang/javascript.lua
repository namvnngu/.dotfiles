return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "javascript" })
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript = function(bufnr)
          return vim.fs.root(bufnr, { "biome.json", "biome.jsonc" })
              and { "biome" }
            or { "prettier" }
        end,
        javascriptreact = function(bufnr)
          return vim.fs.root(bufnr, { "biome.json", "biome.jsonc" })
              and { "biome" }
            or { "prettier" }
        end,
      },
    },
  },
}
