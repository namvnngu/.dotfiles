--------------------------------------------------------------------------------
-- OPTIONS                                                                    --
--------------------------------------------------------------------------------

vim.cmd("syntax off")
vim.cmd("colorscheme wildcharm")

vim.g.mapleader = " "

vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.tabstop = 4

vim.o.background = vim.env.THEME_MODE
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.colorcolumn = "80"
vim.o.completeopt = "menu,menuone,popup,noselect"
vim.o.cursorline = true
vim.o.grepprg = "rg --vimgrep"
vim.o.guicursor = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.swapfile = false
vim.o.termguicolors = false
vim.o.wrap = false

--------------------------------------------------------------------------------
-- KEY MAPPINGS                                                               --
--------------------------------------------------------------------------------

-- Move to window
vim.keymap.set("n", "<Leader>h", "<C-W>h", { remap = true })
vim.keymap.set("n", "<Leader>j", "<C-W>j", { remap = true })
vim.keymap.set("n", "<Leader>k", "<C-W>k", { remap = true })
vim.keymap.set("n", "<Leader>l", "<C-W>l", { remap = true })

-- Yank the current file path
vim.keymap.set("n", "yp", ":call setreg('+', expand('%:p'))<CR>")

-- Replace currently selected text with black hole register without yanking it
vim.keymap.set("v", "<Leader>p", '"_dP')

-- Replace word under cursor
vim.keymap.set("n", "<Leader>s", [[:%s/\<<C-R><C-W>\>/<C-R><C-W>/gI<Left><Left><Left>]])

-- Create or edit file
vim.keymap.set("n", "<Leader>e", ":e <C-R>=expand('%:p:h') . '/'<CR>")

-- Set the current buffer to become scratch
vim.keymap.set("n", "<Leader>bs", ":setlocal bt=nofile bh=wipe noswf<CR>")

-- Open file explorer
vim.keymap.set("n", "-", ":Ex<CR>")

--------------------------------------------------------------------------------
-- ABBREVIATIONS                                                              --
--------------------------------------------------------------------------------

vim.keymap.set(
  "ia",
  "me::",
  vim.fn.strftime(
    "Author: Nam Nguyen <vnngucs@outlook.com><CR>"
      .. "Description:<CR>"
      .. "License: The Unlicense<CR>"
      .. "Date created: %B %d, %Y<CR>"
      .. "Date modified: %B %d, %Y"
  )
)

--------------------------------------------------------------------------------
-- AUTOCOMMANDS                                                               --
--------------------------------------------------------------------------------

local function augroup(name, clear)
  return vim.api.nvim_create_augroup("namnguyen_" .. name, { clear = clear or true })
end

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  command = "wincmd =",
})

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Stop treesitter
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("stop_treesitter"),
  callback = function(event)
    vim.treesitter.stop(event.buf)
  end,
})

-- Create intermediate directories on edit
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("mkdir_on_edit"),
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if dir:match("^/") and vim.fn.isdirectory(dir) == 0 then
      local input = vim.fn.input(("'%s' does not exist. Create? [y/N] "):format(dir))
      if input:lower():match("^(y)?(ye)?(yes)?$") then
        vim.fn.mkdir(dir, "p")
      end
    end
  end,
})

--------------------------------------------------------------------------------
-- COMMANDS                                                                   --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- PLUGINS                                                                    --
--------------------------------------------------------------------------------

local plugin_root_path = vim.fn.stdpath("data") .. "/site/pack/plugins/start"

local function extract_plugin_name(plugin_url_or_path)
  return vim.fn.fnamemodify(plugin_url_or_path, ":t")
end

local function create_plugin_path(plugin_name)
  return vim.fn.expand(("%s/%s"):format(plugin_root_path, plugin_name))
end

vim.api.nvim_create_user_command("Pls", function()
  local plugin_paths = vim.fn.globpath(plugin_root_path, "*", false, true)
  for _, plugin_path in pairs(plugin_paths) do
    vim.print(extract_plugin_name(plugin_path))
  end
end, { desc = "Uninstall all plugins" })

vim.api.nvim_create_user_command("Pi", function(opts)
  local force = opts.bang
  local plugin_url = opts.args
  local plugin_name = extract_plugin_name(plugin_url)
  local plugin_path = create_plugin_path(plugin_name)

  if force or vim.fn.isdirectory(plugin_path) == 0 then
    vim.print(("Installing %s..."):format(plugin_name))
    vim.fn.system({ "rm", "-rf", plugin_path })
    vim.fn.system({ "git", "clone", "--depth=1", "--filter=blob:none", plugin_url, plugin_path })
    vim.print(("Installed %s!"):format(plugin_name))
  end
end, { nargs = 1, bang = true, desc = "Install a plugin given a URL" })

vim.api.nvim_create_user_command("Pu", function(opts)
  local plugin_name = opts.args
  local plugin_path = create_plugin_path(plugin_name)
  if vim.fn.isdirectory(plugin_path) == 1 then
    vim.fn.system({ "rm", "-rf", plugin_path })
    vim.print(("Uninstalled %s!"):format(plugin_name))
  end
end, {
  nargs = 1,
  complete = function()
    local plugin_paths = vim.fn.globpath(plugin_root_path, "*", false, true)
    local plugin_names = {}
    for _, plugin_path in pairs(plugin_paths) do
      table.insert(plugin_names, extract_plugin_name(plugin_path))
    end
    return plugin_names
  end,
  desc = "Uninstall a plugin given suggested plugin names",
})

vim.api.nvim_create_user_command("Pua", function()
  vim.fn.system({ "rm", "-rf", plugin_root_path })
  vim.print("Uninstalled all plugins!")
end, { desc = "Uninstall all plugins" })

vim.cmd([[
  Pi https://github.com/tpope/vim-fugitive
  Pi https://github.com/junegunn/fzf
  Pi https://github.com/tommcdo/vim-lion
]])
