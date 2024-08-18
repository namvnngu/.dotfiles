local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.coding" },
    { import = "plugins.editor" },
    { import = "plugins.lang" },
    { import = "plugins.ui" },
  },
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = {} },
  checker = { enabled = false }, -- automatically check for plugin updates
  change_detection = { enabled = false }, -- automatically check for config file changes and reload the ui
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    icons = {
      cmd = "",
      config = "",
      event = "",
      favorite = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      lazy = "",
      loaded = "",
      not_loaded = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      list = {
        "",
        "",
        "",
        "",
      },
    },
  },
})
