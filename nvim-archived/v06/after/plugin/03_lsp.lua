local utils = require("utils")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf --- @type number
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client then
      local ms = vim.lsp.protocol.Methods

      -- DIAGNOSTIC
      vim.diagnostic.config({ virtual_text = true })

      -- HOVER
      if client:supports_method(ms.textDocument_documentHighlight) then
        local hlgroup = utils.augroup("lsp_highlight_symbol", false)

        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = hlgroup })

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          group = hlgroup,
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          group = hlgroup,
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
      end

      -- FOLDING
      local winid = vim.api.nvim_get_current_win()
      if not vim.wo[winid][0].diff and client:supports_method(ms.textDocument_foldingRange) then
        vim.wo[winid][0].foldmethod = "expr"
        vim.wo[winid][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
      end

      -- SEMANTIC TOKENS
      client.server_capabilities.semanticTokensProvider = nil
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end

      -- COMPLETION
      -- if client:supports_method(ms.textDocument_completion) then
      --   vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
      -- end

      -- INLINE COLORS
      -- if client:supports_method(ms.textDocument_documentColor) then
      --   vim.lsp.document_color.enable(true, bufnr)
      -- end
    end
  end,
})

vim.lsp.config("*", {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

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

if vim.fn.executable("clangd") == 1 then
  vim.lsp.config("clangd", { capabilities = { offsetEncoding = { "utf-16" } } })
  vim.lsp.enable("clangd")
end

if vim.fn.executable("typos-lsp") == 1 then
  vim.lsp.config("typos_lsp", { init_options = { diagnosticSeverity = "Hint" } })
  vim.lsp.enable("typos_lsp")
end

if vim.fn.executable("vscode-eslint-language-server") == 1 then
  vim.lsp.enable("eslint")
end

if vim.fn.executable("biome") == 1 then
  vim.lsp.enable("biome")
end

if vim.fn.executable("typescript-language-server") == 1 then
  vim.lsp.config("ts_ls", { single_file_support = true })
  vim.lsp.enable("ts_ls")
end

if vim.fn.executable("deno") == 1 then
  vim.lsp.enable("denols")
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
