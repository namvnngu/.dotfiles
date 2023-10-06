vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.autoread = true -- enable re-reading file if it has been changed outside of neovim
vim.opt.backup = false -- disable making a backup file before overwriting a file
vim.opt.breakindent = true -- enable wrapping indent to match line start
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.cmdheight = 1 -- command line height
vim.opt.colorcolumn = "80" -- set position of the color column
vim.opt.complete = vim.opt.complete:append("kspell") -- use locale dictionary when "setlocal spell" is enabled
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.confirm = false -- confirm to save changes before exiting modified buffer
vim.opt.copyindent = true -- enable copying the previous indentation on autoindenting
vim.opt.cursorline = true -- enable highlighting the text line of the cursor
vim.opt.expandtab = true -- enable the use of space in tab
vim.opt.fileencoding = "utf-8" -- file content encoding for the buffer
vim.opt.fillchars = { eob = " " } -- disable `~` on nonexistent lines
vim.opt.foldcolumn = "0" -- disable the fold column
vim.opt.foldenable = true -- enable folding
vim.opt.foldlevel = 99 -- set high foldlevel
vim.opt.foldlevelstart = 99 -- start with all code unfolded
vim.opt.foldmethod = "indent" -- define the kind of folding used for the current window
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.history = 100 -- number of commands to remember in a history table
vim.opt.hlsearch = true -- enable highlight on searching
vim.opt.ignorecase = true -- enable case insensitive searching
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.incsearch = true -- enable showing where the pattern as keyword is typed
vim.opt.infercase = true -- enable inferring cases in keyword completion
vim.opt.laststatus = 3 -- global status line
vim.opt.linebreak = true -- enable wrapping lines at 'breakat'
vim.opt.list = true -- show some invisible characters
vim.opt.mouse = "a" -- enable mouse support
vim.opt.number = true -- print line number
vim.opt.preserveindent = true -- enable preserving indent structure as much as possible
vim.opt.pumblend = 10 -- popup blend
vim.opt.pumheight = 100 -- maximum number of entries in a popup
vim.opt.relativenumber = true -- relative line numbers
vim.opt.scrolloff = 8 -- number of lines to keep above and below the cursor
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shiftround = true -- round indent
vim.opt.shiftwidth = 2 -- number of space inserted for indentation
vim.opt.shortmess:append({ W = true, I = false, c = true })
vim.opt.showmode = true -- enable showing modes in command line
vim.opt.showtabline = 0 -- disable tab line (top bar)
vim.opt.sidescrolloff = 8 -- number of columns to keep at the sides of the cursor
vim.opt.signcolumn = "yes" -- always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- don't ignore case with capitals
vim.opt.smartindent = true -- insert indents automatically
vim.opt.splitbelow = true -- put new windows below current
vim.opt.splitright = true -- put new windows right of current
vim.opt.swapfile = false -- disable using swap file for the current buffer
vim.opt.tabstop = 2 -- number of space in a tab
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.opt.timeoutlen = 500
vim.opt.undofile = false -- disable persistent undo
vim.opt.undolevels = 10000
vim.opt.updatetime = 500 -- save swap file and trigger CursorHold
vim.opt.virtualedit = "block" -- allow going past end of line in visual block mode
vim.opt.wildmode = "longest:full,full" -- command-line completion mode
vim.opt.winminwidth = 5 -- minimum window width
vim.opt.wrap = false -- disable wrapping of lines longer than the width of window
vim.opt.writebackup = false -- disable making a backup before overwriting a file

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen" -- maintain code view when splitting
  vim.opt.shortmess:append({ C = true })
end

vim.cmd("filetype plugin indent on")

vim.o.background = "dark"

-- Enable linematch diff algorithm.
-- In the git diff case, the difference are more granular, which means that
-- when it comes to 'diffget' and 'diffput' operations, the conflict is
-- no longer treated as a single block, but instead lines stacked on top of
-- each other.
-- vim.opt.diffopt = vim.fn.has('nvim-0.9') == 1 and vim.opt.diffopt:append('linematch:60') or vim.opt.diffopt,
