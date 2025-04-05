--- Install plugins given urls.
---
--- @param config vim.lsp.Config? The LSP config.
--- @return vim.lsp.Config (table) The merged LSP config.
local function create_config(config)
  return vim.tbl_deep_extend("force", {
    --- @type fun(client: vim.lsp.Client, bufnr: integer)
    on_attach = function(client, bufnr)
      if config and config.on_attach then
        config.on_attach(client, bufnr)
      end

      local ms = vim.lsp.protocol.Methods

      if client then
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
          if client:supports_method(ms.textDocument_documentHighlight) then
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
          if client:supports_method(ms.textDocument_definition) then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
          end
        end

        -- OMNIFUNC
        do
          if client:supports_method(ms.textDocument_completion) then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
          end
        end

        -- FOLDING
        do
          local winid = vim.api.nvim_get_current_win()
          if
            not vim.wo[winid][0].diff
            and client:supports_method(ms.textDocument_foldingRange)
          then
            vim.wo[winid][0].foldmethod = "expr"
            vim.wo[winid][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
          end
        end

        -- SEMANTIC TOKENS
        do
          -- Disable default LSP semantic highlights
          client.server_capabilities.semanticTokensProvider = nil
          for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
            vim.api.nvim_set_hl(0, group, {})
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

if vim.fn.executable("clangd") == 1 then
  require("lspconfig").clangd.setup(create_config({
    capabilities = { offsetEncoding = { "utf-16" } },
  }))
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

      local lua_settings = client.config.settings.Lua

      client.config.settings.Lua = vim.tbl_deep_extend(
        "force",
        type(lua_settings) == "table" and lua_settings or {},
        {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = vim.list_extend(
              vim.api.nvim_get_runtime_file("", true),
              { "${3rd}/luv/library" }
            ),
          },
        }
      )
    end,
    settings = {
      Lua = {},
    },
  }))
end

if vim.fn.executable("typos-lsp") == 1 then
  require("lspconfig").typos_lsp.setup(create_config({
    init_options = { diagnosticSeverity = "Hint" },
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

if vim.fn.executable("csharp-ls") == 1 then
  require("lspconfig").csharp_ls.setup(create_config())

  local status, csharpls_extended = pcall(require, "csharpls_extended")
  if status then
    csharpls_extended.buf_read_cmd_bind()
  end
end

if vim.fn.executable("vscode-css-language-server") == 1 then
  require("lspconfig").cssls.setup(create_config())
end

if vim.fn.executable("vscode-html-language-server") == 1 then
  require("lspconfig").html.setup(create_config())
end
