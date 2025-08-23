vim.cmd("syntax on")
vim.cmd("colorscheme wildcharm")
vim.cmd("filetype plugin indent on")

vim.g.mapleader = " "

vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.tabstop = 4

vim.o.background = vim.env.THEME_MODE
vim.o.breakindent = true
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.colorcolumn = "80"
vim.o.completeopt = "menu,menuone,popup,noselect"
vim.o.copyindent = true
vim.o.cursorline = true
vim.o.display = "lastline,truncate"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.grepprg = "rg --vimgrep"
vim.o.guicursor = ""
vim.o.ignorecase = true
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
vim.o.swapfile = false
vim.o.termguicolors = false
vim.o.undolevels = 10000
vim.o.virtualedit = "block"
vim.o.wildmode = "longest:full"
vim.o.wildoptions = "pum,tagfile"
vim.o.winminwidth = 5
vim.o.wrap = false
