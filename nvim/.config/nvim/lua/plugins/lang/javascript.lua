return {
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
