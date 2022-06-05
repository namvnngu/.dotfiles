lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules" },
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
  },
}
require('telescope').load_extension('fzy_native')
EOF

nnoremap <leader>fgs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>fff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fbb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fgw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fht :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>frr :lua require('telescope.builtin').lsp_references()<CR>
nnoremap <leader>fdd :lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap <leader>ftd :lua require('telescope.builtin').lsp_type_definitions()<CR>
nnoremap <leader>flg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fim :lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap <leader>fda :lua require('telescope.builtin').diagnostics()<CR>
nnoremap <leader>fcc :lua require('telescope.builtin').git_bcommits()<CR>
nnoremap <leader>fstt :lua require('telescope.builtin').git_status()<CR>

