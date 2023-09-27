return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",
          "cssls",
          "jsonls",
          "denols",
          "lua_ls",
          "clangd",
          "tsserver",
          "rust_analyzer",
        },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")

      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist)
      vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist)

      local common_on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        if client.server_capabilities.completionProvider then
          vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        if client.server_capabilities.definitionProvider then
          vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.codelens.refresh, opts)
        vim.keymap.set(
          "n",
          "<leader>wa",
          vim.lsp.buf.add_workspace_folder,
          opts
        )
        vim.keymap.set(
          "n",
          "<leader>wr",
          vim.lsp.buf.remove_workspace_folder,
          opts
        )
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>F", function()
          vim.lsp.buf.format({
            async = true,
            bufnr = bufnr,
            filter = function(formatting_client)
              return formatting_client.name == "null-ls"
            end,
          })
        end, opts)

        -- Format on save
        -- local lsp_formatting_augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
        -- if client.server_capabilities.documentFormattingProvider then
        --   vim.api.nvim_clear_autocmds({ group = lsp_formatting_augroup, buffer = bufnr })
        --   vim.api.nvim_create_autocmd('BufWritePre', {
        --     group = lsp_formatting_augroup,
        --     buffer = bufnr,
        --     callback = function()
        --       vim.lsp.buf.format({
        --         async = true,
        --         bufnr = bufnr,
        --         filter = function(formatting_client)
        --           return formatting_client.name == 'null-ls'
        --         end,
        --       })
        --     end,
        --   })
        -- end

        -- Highlight
        local lsp_highlight_augroup =
          vim.api.nvim_create_augroup("LspHighlight", { clear = true })
        if client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_clear_autocmds({
            group = lsp_highlight_augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = lsp_highlight_augroup,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            group = lsp_highlight_augroup,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end

      local common_setup = {
        on_attach = common_on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          format = { enable = true },
        },
      }

      local installed_servers =
        require("mason-lspconfig").get_installed_servers()
      for _, server in ipairs(installed_servers) do
        lspconfig[server].setup(common_setup)
      end

      lspconfig.tsserver.setup(vim.tbl_deep_extend("force", {}, common_setup, {
        root_dir = lspconfig.util.root_pattern(
          "package.json",
          "tsconfig.json",
          "jsconfig.json"
        ),
      }))

      lspconfig.denols.setup(vim.tbl_deep_extend("force", {}, common_setup, {
        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      }))

      -- Workaround for "warning: multiple different client offset_encodings detected
      -- for buffer, this is not supported yet".
      -- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issuecomment-997226723
      lspconfig.clangd.setup(vim.tbl_deep_extend("force", {}, common_setup, {
        capabilities = { offsetEncoding = { "utf-16" } },
      }))

      local null_ls = require("null-ls")
      null_ls.setup(vim.tbl_deep_extend("force", {}, common_setup, {
        sources = {
          -- Eslint
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.formatting.eslint_d,
          null_ls.builtins.diagnostics.eslint_d.with({
            condition = function(utils)
              return utils.root_has_file({
                ".eslintrc.js",
                ".eslintrc.cjs",
                ".eslintrc.yaml",
                ".eslintrc.yml",
                ".eslintrc.json",
              })
            end,
          }),

          -- Lua
          null_ls.builtins.formatting.stylua,

          -- Rust
          null_ls.builtins.formatting.rustfmt,

          -- Prettier
          null_ls.builtins.formatting.prettierd.with({
            filetypes = {
              "html",
              "scss",
              "sass",
              "css",
              "json",
              "yaml",
              "toml",
              "markdown",
            },
          }),

          -- C/C++
          null_ls.builtins.formatting.clang_format.with({
            disabled_filetypes = { "cs" },
          }),

          -- C#
          null_ls.builtins.formatting.csharpier,

          -- Go
          null_ls.builtins.formatting.goimports,

          -- Spelling
          null_ls.builtins.code_actions.cspell,
          null_ls.builtins.diagnostics.cspell.with({
            diagnostic_config = {
              virtual_text = false,
              severity_sort = true,
            },
            disabled_filetypes = { "NvimTree" },
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity["HINT"]
            end,
          }),
        },
      }))
    end,
  },

  { "williamboman/mason.nvim" },

  -- A tree like view for symbols
  { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline" },

  -- Lsp progress
  { "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach" },
}
