local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
  },
})
telescope.load_extension("fzy_native")
telescope.load_extension("git_worktree")

vim.keymap.set("n", "<Leader>fff", function()
  require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<Leader>fbb", function()
  require("telescope.builtin").buffers()
end)
vim.keymap.set("n", "<Leader>fht", function()
  require("telescope.builtin").help_tags()
end)
vim.keymap.set("n", "<Leader>frr", function()
  require("telescope.builtin").lsp_references()
end)
vim.keymap.set("n", "<Leader>fdd", function()
  require("telescope.builtin").lsp_definitions()
end)
vim.keymap.set("n", "<Leader>ftd", function()
  require("telescope.builtin").lsp_type_definitions()
end)
vim.keymap.set("n", "<Leader>fim", function()
  require("telescope.builtin").lsp_implementations()
end)
vim.keymap.set("n", "<Leader>fda", function()
  require("telescope.builtin").diagnostics()
end)

vim.keymap.set("n", "<Leader>fcc", function()
  require("telescope.builtin").git_bcommits()
end)
vim.keymap.set("n", "<Leader>fstt", function()
  require("telescope.builtin").git_status()
end)
vim.keymap.set("n", "<C-p>", function()
  require("telescope.builtin").git_files()
end)

vim.keymap.set("n", "<Leader>flg", function()
  require("telescope.builtin").live_grep()
end)
vim.keymap.set("n", "<Leader>fgs", function()
  require("telescope.builtin").grep_string({
    search = vim.fn.input("Grep For > "),
  })
end)
vim.keymap.set("n", "<Leader>fgw", function()
  require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end)

vim.keymap.set("n", "<Leader>fgt", function()
  require("telescope").extensions.git_worktree.git_worktrees()
end)
vim.keymap.set("n", "<Leader>fcgt", function()
  require("telescope").extensions.git_worktree.create_git_worktree()
end)
