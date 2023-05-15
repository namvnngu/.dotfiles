local telescope = require('telescope')
local nnoremap = require('utils.keymap').nnoremap

telescope.setup({
  defaults = {
    file_ignore_patterns = { 'node_modules' },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
    },
  },
})
telescope.load_extension('fzf')
telescope.load_extension('git_worktree')
telescope.load_extension('ui-select')
telescope.load_extension('projects')

nnoremap('<leader>ff', function()
  require('telescope.builtin').find_files()
end)
nnoremap('<C-p>', function()
  require('telescope.builtin').git_files()
end)
nnoremap('<leader>fbb', function()
  require('telescope.builtin').buffers()
end)
nnoremap('<leader>fht', function()
  require('telescope.builtin').help_tags()
end)
nnoremap('<leader>frr', function()
  require('telescope.builtin').lsp_references()
end)
nnoremap('<leader>fdd', function()
  require('telescope.builtin').lsp_definitions()
end)
nnoremap('<leader>ftd', function()
  require('telescope.builtin').lsp_type_definitions()
end)
nnoremap('<leader>fim', function()
  require('telescope.builtin').lsp_implementations()
end)
nnoremap('<leader>fda', function()
  require('telescope.builtin').diagnostics()
end)

nnoremap('<leader>fcc', function()
  require('telescope.builtin').git_bcommits()
end)
nnoremap('<leader>fstt', function()
  require('telescope.builtin').git_status()
end)

nnoremap('<leader>flg', function()
  require('telescope.builtin').live_grep()
end)
nnoremap('<leader>fgs', function()
  local trim = require('utils.string').trim
  local query = trim(vim.fn.input('Grep For > '))
  local root_dir = trim(vim.fn.input('Root Dir > '))
  require('telescope.builtin').grep_string({
    cwd = #root_dir ~= 0 and root_dir or require('telescope.utils').buffer_dir(),
    search = query,
    use_regex = true,
  })
end)
nnoremap('<leader>fgw', function()
  require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })
end)

nnoremap('<leader>fgt', function()
  require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap('<leader>fcgt', function()
  require('telescope').extensions.git_worktree.create_git_worktree()
end)

nnoremap('<leader>fpm', function()
  require('telescope').extensions.projects.projects()
end)
