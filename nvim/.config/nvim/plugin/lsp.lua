local lsp_installer = require'nvim-lsp-installer'
local nvim_config = require'lspconfig'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function common_on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<leader>vD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>vd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>vk', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>vi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>vsh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>vrr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>vsd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>vp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>vn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>vll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
      augroup Format
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
      augroup END
    ]], false)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Diagnosticls languager server
local diagnostic_filetypes = {
  'javascript',
  'javascriptreact',
  'json',
  'typescript',
  'typescriptreact',
  'css',
  'less',
  'scss',
  'sass',
  'markdown',
  'html'
}
local diagnostic_init_options = {
  linters = {
    eslint = {
      command = 'eslint_d',
      rootPatterns = {".eslintrc.js", "package.json"},
      debounce = 100,
      args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
      sourceName = 'eslint_d',
      parseJson = {
        errorsRoot = '[0].messages',
        line = 'line',
        column = 'column',
        endLine = 'endLine',
        endColumn = 'endColumn',
        message = '[eslint] ${message} [${ruleId}]',
        security = 'severity'
      },
      securities = {
        [2] = 'error',
        [1] = 'warning'
      }
    },
  },
  filetypes = {
    javascript = 'eslint',
    javascriptreact = 'eslint',
    typescript = 'eslint',
    typescriptreact = 'eslint',
  },
  formatters = {
    eslint_d = {
      command = 'eslint_d',
      args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
      rootPatterns = { '.git' },
    },
    prettier = {
      command = 'prettier',
      args = { '--stdin-filepath', '%filename' }
    }
  },
  formatFiletypes = {
    javascript = 'eslint_d',
    javascriptreact = 'eslint_d',
    typescript = 'eslint_d',
    typescriptreact = 'eslint_d',
    css = 'prettier',
    json = 'prettier',
    scss = 'prettier',
    sass = 'prettier',
    less = 'prettier',
    json = 'prettier',
    markdown = 'prettier',
    html = 'prettier'
  }
}

lsp_installer.on_server_ready(function (server)
  local opts = {
    on_attach = common_on_attach,
  }

  if server.name == "eslint" then
    opts.on_attach = function (client, bufnr)
      -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
      -- the resolved capabilities of the eslint server ourselves!
      client.resolved_capabilities.document_formatting = true
      common_on_attach(client, bufnr)
    end
    opts.settings = {
      format = { enable = true }, -- this will enable formatting
    }
  end

  server:setup(opts)
end)
