require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'gopls',
    'denols',
    'lua_ls',
    'tsserver',
    'rust_analyzer',
  },
  automatic_installation = true,
})

local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')
local nnoremap = require('utils.keymap').nnoremap
local merge = require('utils.table').merge

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { silent = true }
nnoremap('<leader>vsd', vim.diagnostic.open_float, opts)
nnoremap('<leader>vp', vim.diagnostic.goto_prev, opts)
nnoremap('<leader>vn', vim.diagnostic.goto_next, opts)
nnoremap('<leader>vll', vim.diagnostic.setloclist, opts)

-- Automatically update diagnostics
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = '●' },
  severity_sort = true,
})

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Formating
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end

local lsp_formatting_augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
local lsp_highlight_augroup = vim.api.nvim_create_augroup('LspHighlight', { clear = true })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local common_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { silent = true, buffer = bufnr }
  nnoremap('<leader>vD', vim.lsp.buf.declaration, bufopts)
  nnoremap('<leader>vd', vim.lsp.buf.definition, bufopts)
  nnoremap('<leader>vk', vim.lsp.buf.hover, bufopts)
  nnoremap('<leader>vi', vim.lsp.buf.implementation, bufopts)
  nnoremap('<leader>vsh', vim.lsp.buf.signature_help, bufopts)
  nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  nnoremap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  nnoremap('<leader>D', vim.lsp.buf.type_definition, bufopts)
  nnoremap('<leader>vrn', vim.lsp.buf.rename, bufopts)
  nnoremap('<leader>vca', vim.lsp.buf.code_action, bufopts)
  nnoremap('<leader>vrr', vim.lsp.buf.references, bufopts)
  nnoremap('<leader>f', function()
    lsp_formatting(bufnr)
  end, bufopts)

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_clear_autocmds({ group = lsp_formatting_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = lsp_formatting_augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_clear_autocmds({ group = lsp_highlight_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('CursorHold', {
      group = lsp_highlight_augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = lsp_highlight_augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end
end

-- LSP Setups
local common_setup = {
  on_attach = common_on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    format = { enable = true },
  },
}

null_ls.setup(merge(common_setup, {
  sources = {
    -- Eslint
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    -- Lua
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.cspell,
    -- Rust
    null_ls.builtins.formatting.rustfmt,
    -- Writing
    -- null_ls.builtins.diagnostics.cspell.with({
    -- 	diagnostic_config = {
    -- 		virtual_text = false,
    -- 		severity_sort = true,
    -- 	},
    -- 	disabled_filetypes = { "NvimTree" },
    -- 	diagnostics_postprocess = function(diagnostic)
    -- 		diagnostic.severity = vim.diagnostic.severity["HINT"]
    -- 	end,
    -- }),
  },
}))

nvim_lsp.tsserver.setup(merge(common_setup, {
  root_dir = nvim_lsp.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json'),
}))

nvim_lsp.denols.setup(merge(common_setup, {
  root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc'),
}))

nvim_lsp.lua_ls.setup(common_setup)

nvim_lsp.rust_analyzer.setup(common_setup)

nvim_lsp.gopls.setup(common_setup)
