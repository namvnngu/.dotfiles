require("nvim-tree").setup({
  view = {
    adaptive_size = true,
  }
})

local nnoremap = require("utils.keymap").nnoremap

nnoremap("<C-n>", "<cmd>NvimTreeToggle<CR>")
