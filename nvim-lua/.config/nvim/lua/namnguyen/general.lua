vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.opt.autoread = true

vim.opt.backspace = 'indent,eol,start'

vim.opt.guifont = 'FiraCode Nerd Font:h13'
vim.opt.encoding = 'UTF-8'

vim.opt.nospell = true

vim.opt.wrap = false
vim.opt.linebreak = true

-- vim.opt.mouse = a

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case insensitive
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,list,full'

vim.opt.path:append('**')

-- This setting tells Vim how many columns a tab should be made up of in the editor view,
-- it takes care only of how tabs will be rendered and has no effect on the actual text.
vim.opt.tabstop = 4
-- This option to control how many columns text will be indented
-- when using indent operations (such as <<, >> or <TAB>) in normal or visual mode;
-- this also covers automatic C-style indentation.
vim.opt.shiftwidth = 4
-- When you enter the tab character, it is automatically replaced with spaces.
-- Insert the appropriate number of spaces when in insert mode.
vim.opt.expandtab = true


vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = 80
vim.opt.scrolloff = 8

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hidden = true

vim.opt.noerrorbells = true
vim.opt.belloff = 'all'
vim.opt.novisualbell = true

vim.opt.clipboard:append('unnamedplus')

vim.opt.showmatch = true
vim.opt.showmode = true

vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append('c')

vim.opt.cursorline = true

vim.opt.formatoptions:append('r')
vim.opt.formatoptions:remove('o')

vim.opt.foldenable = true
vim.opt.foldmethod = 'manual'

vim.opt.lazyredraw = true

vim.opt.completeopt = 'menu,menuone,noselect'

vim.cmd('filetype plugin indent on')
