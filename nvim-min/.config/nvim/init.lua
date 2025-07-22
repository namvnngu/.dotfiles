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
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "80"
vim.o.cursorline = true
vim.o.guicursor = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.splitbelow = true
vim.o.splitright = true

--------------------------------------------------------------------------------
-- KEY MAPPINGS                                                               --
--------------------------------------------------------------------------------

-- Move to window
vim.keymap.set("n", "<Leader>h", "<C-W>h", { remap = true })
vim.keymap.set("n", "<Leader>j", "<C-W>j", { remap = true })
vim.keymap.set("n", "<Leader>k", "<C-W>k", { remap = true })
vim.keymap.set("n", "<Leader>l", "<C-W>l", { remap = true })

-- Create or edit file
vim.keymap.set("n", "<Leader>e", ":e <C-R>=expand('%:p:h') . '/'<CR>")

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

-- Trim spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("trim_spaces"),
  callback = function()
    local patterns = {
      [[%s/\s\+$//e]],
      [[%s/\%^\n\+//]],
      [[%s/\(\n\n\)\n\+/\1/]],
      [[%s/\($\n\s*\)\+\%$//]],
    }
    local view = vim.fn.winsaveview()
    for _, v in pairs(patterns) do
      vim.api.nvim_exec2(string.format("keepjumps keeppatterns silent! %s", v), { output = false })
    end
    vim.fn.winrestview(view)
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
