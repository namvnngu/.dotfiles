return {
  {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    dependencies = { "williamboman/mason.nvim" },
    keys = {
      {
        "<leader>F",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "n",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {},
    },
  },
}
