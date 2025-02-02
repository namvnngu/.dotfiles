return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    opts = { servers = {} },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {
          capabilities = require("plugins.lsp.capabilities"),
          on_init = function(client)
            require("plugins.lsp.semantic_tokens").on_init(client)
          end,
          on_attach = function(client, bufnr)
            require("plugins.lsp.keymaps").on_attach()
            require("plugins.lsp.diagnostic").on_attach()
            require("plugins.lsp.hover").on_attach(client, bufnr)
            require("plugins.lsp.tagfunc").on_attach(client, bufnr)
            require("plugins.lsp.omnifunc").on_attach(client, bufnr)
          end,
        }, config or {}))
      end
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
}
