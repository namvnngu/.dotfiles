require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'gopls',
    'cssls',
    'denols',
    'lua_ls',
    'tsserver',
    'clangd',
    'rust_analyzer',
  },
  automatic_installation = true,
})

local nnoremap = require('utils.keymap').nnoremap

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { silent = true }
nnoremap('<space>do', vim.diagnostic.open_float, opts)
nnoremap('<space>dp', vim.diagnostic.goto_prev, opts)
nnoremap('<space>dn', vim.diagnostic.goto_next, opts)
nnoremap('<space>ds', vim.diagnostic.setloclist, opts)

-- Formatting
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local common_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { silent = true, buffer = bufnr }
  nnoremap('gD', vim.lsp.buf.declaration, bufopts)
  nnoremap('gd', vim.lsp.buf.definition, bufopts)
  nnoremap('K', vim.lsp.buf.hover, bufopts)
  nnoremap('gi', vim.lsp.buf.implementation, bufopts)
  nnoremap('<space>K', vim.lsp.buf.signature_help, bufopts)
  nnoremap('<space>D', vim.lsp.buf.type_definition, bufopts)
  nnoremap('<space>rn', vim.lsp.buf.rename, bufopts)
  nnoremap('<space>ca', vim.lsp.buf.code_action, bufopts)
  nnoremap('gr', vim.lsp.buf.references, bufopts)
  nnoremap('<space>cl', vim.lsp.codelens.run, bufopts)
  nnoremap('<space>cr', vim.lsp.codelens.refresh, bufopts)
  nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  nnoremap('<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  nnoremap('F', function()
    lsp_formatting(bufnr)
  end, bufopts)

  -- Format on save
  -- local lsp_formatting_augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_clear_autocmds({ group = lsp_formatting_augroup, buffer = bufnr })
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     group = lsp_formatting_augroup,
  --     buffer = bufnr,
  --     callback = function()
  --       lsp_formatting(bufnr)
  --     end,
  --   })
  -- end

  -- Highlight
  local lsp_highlight_augroup = vim.api.nvim_create_augroup('LspHighlight', { clear = true })
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_clear_autocmds({ group = lsp_highlight_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('CursorHold', {
      group = lsp_highlight_augroup,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = lsp_highlight_augroup,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- LSP Setups
local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')
local merge = require('utils.table').merge

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
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({
          '.eslintrc.js',
          '.eslintrc.cjs',
          '.eslintrc.yaml',
          '.eslintrc.yml',
          '.eslintrc.json',
        })
      end,
    }),

    -- Lua
    null_ls.builtins.formatting.stylua,

    -- Rust
    null_ls.builtins.formatting.rustfmt,

    -- Prettier
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { 'html', 'scss', 'sass', 'css', 'json', 'yaml', 'toml', 'markdown' },
    }),

    -- C/C++
    null_ls.builtins.formatting.clang_format.with({
      disabled_filetypes = { 'cs' },
    }),

    -- C#
    null_ls.builtins.formatting.csharpier,

    -- Go
    null_ls.builtins.formatting.goimports,

    -- Spelling
    null_ls.builtins.code_actions.cspell,
    -- null_ls.builtins.diagnostics.cspell.with({
    --   diagnostic_config = {
    --     virtual_text = false,
    --     severity_sort = true,
    --   },
    --   disabled_filetypes = { 'NvimTree' },
    --   diagnostics_postprocess = function(diagnostic)
    --     diagnostic.severity = vim.diagnostic.severity['HINT']
    --   end,
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

nvim_lsp.svelte.setup(common_setup)

nvim_lsp.cssls.setup(common_setup)

nvim_lsp.clangd.setup(common_setup)

nvim_lsp.csharp_ls.setup(common_setup)
