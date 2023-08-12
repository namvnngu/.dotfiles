--- List all capabilities of the server associated with the current buffer
vim.api.nvim_create_user_command('LspCapabilities', function()
  local curBuf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_active_clients({ bufnr = curBuf })

  for _, client in pairs(clients) do
    if client.name ~= 'null-ls' then
      local capabilities = {}
      for capability_name, is_active in pairs(client.server_capabilities) do
        if is_active and capability_name:find('Provider') then
          table.insert(capabilities, '- ' .. capability_name)
        end
      end

      table.sort(capabilities)

      local msg = '# ' .. client.name .. '\n' .. table.concat(capabilities, '\n')
      vim.notify(msg, vim.log.levels.TRACE)
    end
  end
end, {})

-- I'm not sure why calling colorscheme in other files does not make document
-- highlighting work, so calling it again here is a workaround
vim.cmd.colorscheme('nightfox')

-- LSP Setups
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

local lspconfig = require('lspconfig')

local merge = require('utils.table').merge
local nnoremap = require('utils.keymap').nnoremap

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
nnoremap('<space>do', vim.diagnostic.open_float)
nnoremap('<space>dp', vim.diagnostic.goto_prev)
nnoremap('<space>dn', vim.diagnostic.goto_next)
nnoremap('<space>dl', vim.diagnostic.setloclist)
nnoremap('<space>dq', vim.diagnostic.setqflist)

local common_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  if client.server_capabilities.completionProvider then
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
  end
  if client.server_capabilities.definitionProvider then
    vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
  end

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = bufnr }
  nnoremap('gD', vim.lsp.buf.declaration, opts)
  nnoremap('gd', vim.lsp.buf.definition, opts)
  nnoremap('K', vim.lsp.buf.hover, opts)
  nnoremap('gi', vim.lsp.buf.implementation, opts)
  nnoremap('gK', vim.lsp.buf.signature_help, opts)
  nnoremap('<space>D', vim.lsp.buf.type_definition, opts)
  nnoremap('<space>rn', vim.lsp.buf.rename, opts)
  nnoremap('<space>ca', vim.lsp.buf.code_action, opts)
  nnoremap('gr', vim.lsp.buf.references, opts)
  nnoremap('<space>cl', vim.lsp.codelens.run, opts)
  nnoremap('<space>cr', vim.lsp.codelens.refresh, opts)
  nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  nnoremap('<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  nnoremap('<space>F', function()
    vim.lsp.buf.format({
      async = true,
      bufnr = bufnr,
      filter = function(formatting_client)
        return formatting_client.name == 'null-ls'
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
  local lsp_highlight_augroup = vim.api.nvim_create_augroup('LspHighlight', { clear = true })
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_clear_autocmds({ group = lsp_highlight_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
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

local common_setup = {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    format = { enable = true },
  },
}

local null_ls = require('null-ls')
null_ls.setup(merge(common_setup, {
  on_attach = common_on_attach,
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

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    common_on_attach(client, bufnr)
  end,
})

local installed_servers = require('mason-lspconfig').get_installed_servers()
for _, server in ipairs(installed_servers) do
  lspconfig[server].setup(common_setup)
end

lspconfig.tsserver.setup(merge(common_setup, {
  root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json'),
}))

lspconfig.denols.setup(merge(common_setup, {
  root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
}))

-- Workaround for "warning: multiple different client offset_encodings detected
-- for buffer, this is not supported yet".
--
-- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issuecomment-997226723
lspconfig.clangd.setup(merge(common_setup, {
  capabilities = { offsetEncoding = { 'utf-16' } },
}))
