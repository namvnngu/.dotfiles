vim.opt.viewoptions:remove('curdir') -- disable saving current directory with views
vim.opt.shortmess:append({ s = true, I = true }) -- disable startup message
vim.opt.backspace:append({ 'nostop' }) -- don't stop backspace at insert
vim.opt.complete:append("kspell") -- use locale dictionary when "setlocal spell" is enabled

if vim.fn.has('nvim-0.9') == 1 then
  vim.opt.diffopt:append('linematch:60') -- enable linematch diff algorithm
end

vim.cmd('filetype plugin indent on')

local options = {
  opt = {
    breakindent = true, -- enable or disable to wrap indent to match line start
    clipboard = 'unnamedplus', -- connection to the system clipboard
    cmdheight = 2, -- command line height
    completeopt = { 'menu', 'menuone', 'noselect' }, -- options for insert mode completion
    copyindent = true, -- enable or disable to copy the previous indentation on autoindenting
    cursorline = true, -- enable or disable to highlight the text line of the cursor
    expandtab = true, -- enable or disable the use of space in tab
    fileencoding = 'utf-8', -- file content encoding for the buffer
    fillchars = { eob = ' ' }, -- disable `~` on nonexistent lines
    foldenable = true, -- enable or disable fold for nvim-ufo
    foldlevel = 99, -- set high foldlevel for nvim-ufo
    foldlevelstart = 99, -- start with all code unfolded
    foldcolumn = vim.fn.has('nvim-0.9') == 1 and '1' or nil, -- show foldcolumn in nvim 0.9
    history = 100, -- number of commands to remember in a history table
    ignorecase = true, -- enable or disable case insensitive searching
    infercase = true, -- enable or disable to infer cases in keyword completion
    laststatus = 3, -- global status line
    linebreak = true, -- enable or disable to wrap lines at 'breakat'
    mouse = 'a', -- enable or disable mouse support
    number = true, -- enable or disable to show line number
    preserveindent = true, -- enable or disable preserve indent structure as much as possible
    pumheight = 100, -- height of the pop up menu
    relativenumber = true, -- enable or disable to show relative numberline
    scrolloff = 8, -- number of lines to keep above and below the cursor
    shiftwidth = 2, -- number of space inserted for indentation
    showmode = false, -- enable or disable to show modes in command line
    showtabline = 2, -- always display tab line
    sidescrolloff = 8, -- number of columns to keep at the sides of the cursor
    signcolumn = 'yes', -- always show the sign column
    smartcase = true, -- enable or disable case sensitive searching
    smartindent = true, -- enable or disable smarter autoindentation
    splitbelow = true, -- enable or disable to split a new window below the current one
    splitkeep = vim.fn.has('nvim-0.9') == 1 and 'screen' or nil, -- maintain code view when splitting
    splitright = true, -- enable or disable to split a new window at the right of the current one
    tabstop = 2, -- number of space in a tab
    termguicolors = true, -- enable or disable 24-bit RGB color in the TUI
    timeoutlen = 500, -- shorten key timeout length a little bit
    undofile = false, -- enable or disable persistent undo
    updatetime = 50, -- length of time to wait before triggering the plugin
    virtualedit = 'block', -- allow going past end of line in visual block mode
    wrap = false, -- enable or disable wrapping of lines longer than the width of window
    writebackup = false, -- enable or disable making a backup before overwriting a file
    autoread = true, -- enable or disable re-read file if it has been changed outside of neovim
    hlsearch = true, -- enable or disable highlight on searching
    incsearch = true, -- enable or disable to show where the pattern as keyword is typed
    colorcolumn = '80', -- set position of the color column
    swapfile = false, -- enable or disable to use swap file for the current buffer
    backup = false, -- enable or disable to make a backup file before overwriting a file
  },
  g = {
    mapleader = ' ', -- set leader key
    loaded_netrw = 1, -- disable netrw at the very start for nvim-tree
    loaded_netrwPlugin = 1, -- disable netrw at the very start for nvim-tree
  },
  t = { bufs = vim.api.nvim_list_bufs() }, -- initialize buffers for the current tab
}

for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end
