vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme wildcharm")

vim.opt.breakindent = true
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.completeopt = "menu,menuone,popup,noselect,noinsert"
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.display:append("truncate")
vim.opt.expandtab = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.guicursor = ""
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.preserveindent = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smoothscroll = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.undolevels = 10000
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum,tagfile"
vim.opt.winminwidth = 5
vim.opt.wrap = false
