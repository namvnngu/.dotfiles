local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_extensions = require('telescope').extensions
local nnoremap = require('utils.keymap').nnoremap

telescope.setup({
  defaults = {
    file_ignore_patterns = { 'node_modules' },
    preview = false,
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
    },
  },
})
telescope.load_extension('fzf')
telescope.load_extension('git_worktree')

nnoremap('<C-p>', telescope_builtin.git_files)
nnoremap('<leader>ff', telescope_builtin.find_files)

nnoremap('<leader>fbb', telescope_builtin.buffers)
nnoremap('<leader>fht', telescope_builtin.help_tags)

nnoremap('<leader>frr', telescope_builtin.lsp_references)
nnoremap('<leader>fdd', telescope_builtin.lsp_definitions)
nnoremap('<leader>ftd', telescope_builtin.lsp_type_definitions)
nnoremap('<leader>fim', telescope_builtin.lsp_implementations)
nnoremap('<leader>fda', telescope_builtin.diagnostics)

nnoremap('<leader>fst', telescope_builtin.git_status)

nnoremap('<leader>flg', telescope_builtin.live_grep)
nnoremap('<leader>fgw', function()
  telescope_builtin.grep_string({ search = vim.fn.expand('<cword>') })
end)
nnoremap('<leader>fgs', function()
  local trim = require('utils.string').trim
  local query = trim(vim.fn.input('Grep For > '))
  local root_dir = trim(vim.fn.input('Root Dir > '))
  telescope_builtin.grep_string({
    cwd = #root_dir ~= 0 and root_dir or require('telescope.utils').buffer_dir(),
    search = query,
    use_regex = true,
  })
end)

nnoremap('<leader>fgt', telescope_extensions.git_worktree.git_worktrees)
nnoremap('<leader>fcgt', telescope_extensions.git_worktree.create_git_worktree)
