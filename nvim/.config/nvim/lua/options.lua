vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("syntax off")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme wildcharm")

vim.o.breakindent = true
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.o.colorcolumn = "80"
vim.o.completeopt = "menu,menuone,popup,noselect,noinsert"
vim.o.copyindent = true
vim.o.cursorline = true
vim.o.display = "lastline,truncate"
vim.o.expandtab = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.guicursor = ""
vim.o.ignorecase = true
vim.o.linebreak = true
vim.o.number = true
vim.o.preserveindent = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.showtabline = 0
vim.o.sidescrolloff = 2
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smoothscroll = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.undolevels = 10000
vim.o.virtualedit = "block"
vim.o.wildmode = "longest:full,full"
vim.o.wildoptions = "pum,tagfile"
vim.o.winminwidth = 5
vim.o.wrap = false
