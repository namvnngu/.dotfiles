local lsp_installer = require("nvim-lsp-installer")
-- local nvim_config = require 'lspconfig'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function common_on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "<Leader>vD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "<Leader>vd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "<Leader>vk", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<Leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<Leader>vsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<Leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<Leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap(
    "n",
    "<Leader>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  buf_set_keymap("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<Leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<Leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<Leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap(
    "n",
    "<Leader>vsd",
    "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
    opts
  )
  buf_set_keymap("n", "<Leader>vp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<Leader>vn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<Leader>vll", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec(
      [[
      augroup Format
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
      augroup END
    ]],
      false
    )
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = common_on_attach,
    settings = {
      format = { enable = true },
    },
    capabilities = require("cmp_nvim_lsp").update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
  }

  if server.name == "eslint" then
    opts.on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = true
      common_on_attach(client, bufnr)
    end
  end

  if server.name == "ts_ls" then
    opts.on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      common_on_attach(client, bufnr)
    end
  end

  if server.name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
      },
    }
  end

  server:setup(opts)
end)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

-- Automatically update diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  })

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
