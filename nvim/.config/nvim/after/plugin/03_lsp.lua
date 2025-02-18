--- @class LspConfig : lspconfig.Config
---@diagnostic disable-next-line: duplicate-doc-field
--- @field cmd? string

--- Install plugins given urls.
---
--- @param config LspConfig? The lsp config.
--- @return LspConfig (table) The merged lsp config.
local function create_config(config)
  return vim.tbl_deep_extend("force", {
    --- @type fun(client: vim.lsp.Client, initialize_result: lsp.InitializeResult)
    on_init = function(client, initialize_result)
      if config and config.on_init then
        config.on_init(client, initialize_result)
      end

      -- Disable default lsp highlights
      client.server_capabilities.semanticTokensProvider = nil
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end
    end,
    --- @type fun(client: vim.lsp.Client, bufnr: integer)
    on_attach = function(client, bufnr)
      if config and config.on_attach then
        config.on_attach(client, bufnr)
      end

      local ms = vim.lsp.protocol.Methods

      if client then
        -- KEYMAPS
        do
          -- See :h lsp-defaults
          -- NOTE: Inspect require("vim._defaults") to check if the below mappings are
          -- included in the stable Neovim. If yes, then remove the below mappings.
          -- Reference: https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_defaults.lua#L154
          vim.keymap.set("n", "grn", function()
            vim.lsp.buf.rename()
          end, { desc = "vim.lsp.buf.rename()" })

          vim.keymap.set({ "n", "x" }, "gra", function()
            vim.lsp.buf.code_action()
          end, { desc = "vim.lsp.buf.code_action()" })

          vim.keymap.set("n", "grr", function()
            vim.lsp.buf.references()
          end, { desc = "vim.lsp.buf.references()" })

          vim.keymap.set("n", "gri", function()
            vim.lsp.buf.implementation()
          end, { desc = "vim.lsp.buf.implementation()" })

          vim.keymap.set("n", "gO", function()
            vim.lsp.buf.document_symbol()
          end, { desc = "vim.lsp.buf.document_symbol()" })

          vim.keymap.set({ "i", "s" }, "<C-S>", function()
            vim.lsp.buf.signature_help()
          end, { desc = "vim.lsp.buf.signature_help()" })
        end

        -- DIAGNOSTIC
        do
          local SEVERITY_LABELS = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
          }

          --- @param diagnostic vim.Diagnostic The diagnostic
          --- @return string diagnostic_message A diagnostic message
          local function format_diagnostic_message(diagnostic)
            local severity_label = SEVERITY_LABELS[diagnostic.severity]

            if not severity_label then
              require("utils.notify").warn(
                string.format(
                  "Unknown diagnostic severity, %s.",
                  diagnostic.severity
                )
              )
            end

            return string.format(
              "[%s] %s",
              severity_label or "UNKNOWN",
              diagnostic.message
            )
          end

          vim.diagnostic.config({
            float = { format = format_diagnostic_message },
            virtual_text = { format = format_diagnostic_message },
          })
        end

        -- HOVER
        do
          local highlight_augroup = vim.api.nvim_create_augroup(
            "LspDocumentHighlight",
            { clear = true }
          )
          local clear_highlight_augroup = vim.api.nvim_create_augroup(
            "LspClearDocumentHighlight",
            { clear = true }
          )
          if client.supports_method(ms.textDocument_documentHighlight) then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              group = highlight_augroup,
              buffer = bufnr,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              group = clear_highlight_augroup,
              buffer = bufnr,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end

        -- TAGFUNC
        do
          if client.supports_method(ms.textDocument_definition) then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
          end
        end

        -- OMNIFUNC
        do
          if client.supports_method(ms.textDocument_completion) then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
          end
        end
      end
    end,
    capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      -- Reference: https://github.com/hrsh7th/cmp-nvim-lsp/blob/main/lua/cmp_nvim_lsp/init.lua#L42
      {
        textDocument = {
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
              insertReplaceSupport = false, -- This has to be off to avoid nvim runtime error
              resolveSupport = {
                properties = {
                  "documentation",
                  "additionalTextEdits",
                  "insertTextFormat",
                  "insertTextMode",
                  "command",
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
      }
    ),
  }, config or {})
end

if vim.fn.executable("lua-language-server") == 1 then
  require("lspconfig").lua_ls.setup(create_config({
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath("config")
          and (
            vim.uv.fs_stat(path .. "/.luarc.json")
            or vim.uv.fs_stat(path .. "/.luarc.jsonc")
          )
        then
          return
        end
      end

      client.config.settings.Lua =
        vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = vim.list_extend(
              vim.api.nvim_get_runtime_file("", true),
              {
                "${3rd}/luv/library",
              }
            ),
          },
        })
    end,
    settings = {
      Lua = {},
    },
  }))
end

if vim.fn.executable("typos-lsp") == 1 then
  require("lspconfig").typos_lsp.setup(create_config({
    init_options = {
      diagnosticSeverity = "Hint",
    },
  }))
end

if vim.fn.executable("vscode-eslint-language-server") == 1 then
  require("lspconfig").eslint.setup(create_config())
end

if vim.fn.executable("biome") == 1 then
  require("lspconfig").biome.setup(create_config())
end

if vim.fn.executable("typescript-language-server") == 1 then
  require("lspconfig").ts_ls.setup(create_config({
    single_file_support = true,
    root_dir = require("lspconfig").util.root_pattern(
      "package.json",
      "tsconfig.json",
      "jsconfig.json"
    ),
  }))
end

if vim.fn.executable("deno") == 1 then
  require("lspconfig").deno_ls.setup(create_config({
    root_dir = require("lspconfig").util.root_pattern(
      "deno.json",
      "deno.jsonc"
    ),
  }))
end
