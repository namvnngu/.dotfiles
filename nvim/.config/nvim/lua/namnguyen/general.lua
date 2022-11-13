vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.opt.autoread = true

vim.opt.backspace = "indent,eol,start"

vim.opt.guifont = "FiraCode Nerd Font:h13"
vim.opt.encoding = "UTF-8"

vim.opt.wrap = false
vim.opt.linebreak = true

-- vim.opt.mouse = a

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case insensitive
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true

vim.opt.wildmenu = true
vim.opt.wildmode = "longest,list,full"

vim.opt.path:append("**")

-- TAB SETTINGS: https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
-- This setting tells Vim how many columns a tab should be made up of in the editor view,
-- it takes care only of how tabs will be rendered and has no effect on the actual text.
vim.opt.tabstop = 4
-- This option to control how many columns text will be indented
-- when using indent operations (such as <<, >> or <TAB>) in normal or visual mode;
-- this also covers automatic C-style indentation.
vim.opt.shiftwidth = 4
-- When you enter the tab character, it is automatically replaced with spaces.
-- Insert the appropriate number of spaces when in insert mode.
vim.opt.expandtab = false
--- Setting this to a non-zero value other than tabstop will make the tab key (in insert mode)
--- to insert a combination of spaces (and possibly tabs) to simulate tab stops at this width.
vim.opt.softtabstop = 0

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true
vim.opt.hidden = true

vim.opt.belloff = "all"

vim.opt.clipboard:append("unnamedplus")

vim.opt.showmatch = true
vim.opt.showmode = true

vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don"t pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.cursorline = true

vim.opt.formatoptions:append("r")
vim.opt.formatoptions:remove("o")

vim.opt.foldenable = true
vim.opt.foldmethod = "manual"

vim.opt.lazyredraw = true

vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.showmode = false

-- Folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd("filetype plugin indent on")
