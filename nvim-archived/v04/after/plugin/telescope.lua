local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_extensions = require("telescope").extensions
local nnoremap = require("utils.keymap").nnoremap

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
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
telescope.load_extension("fzf")
telescope.load_extension("git_worktree")

nnoremap("<C-p>", telescope_builtin.git_files)
nnoremap("<Leader>ff", telescope_builtin.find_files)

nnoremap("<Leader>fbb", telescope_builtin.buffers)
nnoremap("<Leader>fht", telescope_builtin.help_tags)

nnoremap("<Leader>frr", telescope_builtin.lsp_references)
nnoremap("<Leader>fdd", telescope_builtin.lsp_definitions)
nnoremap("<Leader>ftd", telescope_builtin.lsp_type_definitions)
nnoremap("<Leader>fim", telescope_builtin.lsp_implementations)
nnoremap("<Leader>fda", telescope_builtin.diagnostics)

nnoremap("<Leader>fst", telescope_builtin.git_status)

nnoremap("<Leader>flg", telescope_builtin.live_grep)
nnoremap("<Leader>fgw", function()
  telescope_builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)
nnoremap("<Leader>fgs", function()
  local query = vim.trim(vim.fn.input("Grep For > "))
  local root_dir = vim.trim(vim.fn.input("Root Dir > "))
  telescope_builtin.grep_string({
    cwd = #root_dir ~= 0 and root_dir or require("telescope.utils").buffer_dir(),
    search = query,
    use_regex = true,
  })
end)

nnoremap("<Leader>fgt", telescope_extensions.git_worktree.git_worktrees)
nnoremap("<Leader>fcgt", telescope_extensions.git_worktree.create_git_worktree)
