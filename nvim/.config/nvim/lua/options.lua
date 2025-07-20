vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("syntax off")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme wildcharm")

if vim.env.TMUX then
  vim.o.background = vim.env.THEME_MODE
end

vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.tabstop = 4

vim.o.breakindent = true
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.o.colorcolumn = "80"
vim.o.completeopt = "menu,menuone,popup,noselect,noinsert"
vim.o.copyindent = true
vim.o.cursorline = true
vim.o.display = "lastline,truncate"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.guicursor = ""
vim.o.ignorecase = true
vim.o.linebreak = true
vim.o.number = true
vim.o.preserveindent = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftround = true
vim.o.showtabline = 0
vim.o.sidescrolloff = 2
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smoothscroll = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.undolevels = 10000
vim.o.virtualedit = "block"
vim.o.wildmode = "longest:full,full"
vim.o.wildoptions = "pum,tagfile"
vim.o.winminwidth = 5
vim.o.wrap = false
