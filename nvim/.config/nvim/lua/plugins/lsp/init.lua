return {
  {
    "neovim/nvim-lspconfig",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      inlay_hints = {
        enabled = false,
      },
      -- Global capabilities
      capabilities = {
        textDocument = {
          -- Reference: https://github.com/hrsh7th/cmp-nvim-lsp/blob/main/lua/cmp_nvim_lsp/init.lua#L42
          completion = {
            dynamicRegistration = false,
            completionItem = {
              snippetSupport = true,
              commitCharactersSupport = true,
              deprecatedSupport = true,
              preselectSupport = true,
              tagSupport = {
                valueSet = {
                  1, -- Deprecated
                },
              },
              insertReplaceSupport = false,
              resolveSupport = {
                properties = {
                  "documentation",
                  "detail",
                  "additionalTextEdits",
                  "sortText",
                  "filterText",
                  "insertText",
                  "textEdit",
                  "insertTextFormat",
                  "insertTextMode",
                },
              },
              insertTextModeSupport = {
                valueSet = {
                  1, -- asIs
                  2, -- adjustIndentation
                },
              },
              labelDetailsSupport = true,
            },
            contextSupport = true,
            insertTextMode = 1,
            completionList = {
              itemDefaults = {
                "commitCharacters",
                "editRange",
                "insertTextFormat",
                "insertTextMode",
                "data",
              },
            },
          },
        },
      },
      -- LSP server settings
      servers = {},
    },
    config = function(_, opts)
      require("utils.lsp").on_attach(function(client, bufnr)
        require("plugins.lsp.keymaps").on_attach()
        require("plugins.lsp.diagnostic").on_attach()
        require("plugins.lsp.hover").on_attach(client, bufnr)
        require("plugins.lsp.tagfunc").on_attach(client, bufnr)
        require("plugins.lsp.omnifunc").on_attach(client, bufnr)

        if opts.inlay_hints.enabled then
          require("plugins.lsp.inlayhint").on_attach(client, bufnr)
        end
      end)

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        opts.capabilities or {}
      )
      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, opts.servers[server] or {})
        require("lspconfig")[server].setup(server_opts)
      end

      require("mason-lspconfig").setup({
        ensure_installed = { "typos_lsp", "lua_ls", "tsserver", "eslint" },
        automatic_installation = true,
        handlers = { setup },
      })

      local installed_servers =
        require("mason-lspconfig").get_installed_servers()
      for _, server in ipairs(installed_servers) do
        setup(server)
      end
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
}
