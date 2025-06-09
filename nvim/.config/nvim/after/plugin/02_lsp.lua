local utils = require("utils")

vim.lsp.config("*", {
  --- @type fun(client: vim.lsp.Client, bufnr: integer)
  on_attach = function(client, bufnr)
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
            utils.echom(("Unknown diagnostic severity, %s."):format(diagnostic.severity), true)
          end

          return ("[%s] %s"):format(severity_label or "UNKNOWN", diagnostic.message)
        end

        vim.diagnostic.config({
          float = { format = format_diagnostic_message },
          virtual_text = { format = format_diagnostic_message },
        })
      end

      -- HOVER
      do
        local highlight_augroup =
          vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
        local clear_highlight_augroup =
          vim.api.nvim_create_augroup("LspClearDocumentHighlight", { clear = true })
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
        if not vim.wo[winid][0].diff and client:supports_method(ms.textDocument_foldingRange) then
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

      -- INLINE COLORS
      -- do
      --   if client:supports_method(ms.textDocument_documentColor) then
      --     vim.lsp.document_color.enable(true, bufnr)
      --   end
      -- end
    end
  end,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

if vim.fn.executable("clangd") == 1 then
  vim.lsp.config("clangd", {
    capabilities = { offsetEncoding = { "utf-16" } },
  })
  vim.lsp.enable("clangd")
end

if vim.fn.executable("lua-language-server") == 1 then
  vim.lsp.config("lua_ls", {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath("config")
          and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
        then
          return
        end
      end

      ---@diagnostic disable-next-line: param-type-mismatch
      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          version = "LuaJIT",
          path = {
            "lua/?.lua",
            "lua/?/init.lua",
          },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.list_extend(vim.api.nvim_get_runtime_file("", true), {
            "${3rd}/luv/library",
            "${3rd}/busted/library",
          }),
        },
      })
    end,
    settings = {
      Lua = {},
    },
  })
  vim.lsp.enable("lua_ls")
end

if vim.fn.executable("typos-lsp") == 1 then
  vim.lsp.config("typos_lsp", {
    init_options = { diagnosticSeverity = "Hint" },
  })
  vim.lsp.enable("typos_lsp")
end

if vim.fn.executable("vscode-eslint-language-server") == 1 then
  vim.lsp.enable("eslint")
end

if vim.fn.executable("biome") == 1 then
  vim.lsp.enable("biome")
end

if vim.fn.executable("typescript-language-server") == 1 then
  vim.lsp.config("ts_ls", {
    single_file_support = true,
    root_dir = require("lspconfig").util.root_pattern(
      "package.json",
      "tsconfig.json",
      "jsconfig.json"
    ),
  })
  vim.lsp.enable("ts_ls")
end

if vim.fn.executable("deno") == 1 then
  vim.lsp.config("deno_ls", {
    root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
  })
  vim.lsp.enable("deno_ls")
end

if vim.fn.executable("csharp-ls") == 1 then
  vim.lsp.enable("csharp_ls")

  local status, csharpls_extended = pcall(require, "csharpls_extended")
  if status then
    csharpls_extended.buf_read_cmd_bind()
  end
end

if vim.fn.executable("vscode-css-language-server") == 1 then
  vim.lsp.enable("cssls")
end

if vim.fn.executable("vscode-html-language-server") == 1 then
  vim.lsp.enable("html")
end

if vim.fn.executable("tinymist") == 1 then
  vim.lsp.enable("tinymist")
end

if vim.fn.executable("gopls") == 1 then
  vim.lsp.enable("gopls")
end

-- if vim.fn.executable("zk") == 1 then
--   vim.lsp.enable("zk")
-- end
