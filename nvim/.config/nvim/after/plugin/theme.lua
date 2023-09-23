local theme_setups = {
  ['rose-pine'] = {
    variant = 'moon',
    disable_background = true,
    disable_float_background = true,
    disable_italics = true,
  },
  gruvbox = {
    italic = {
      strings = false,
      comments = false,
      operators = false,
      folds = false,
    },
    transparent_mode = true,
  },
  tokyonight = {
    style = 'moon',
    transparent = true,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
    },
  },
  catppuccin = {
    flavour = 'mocha',
    transparent_background = true,
    no_italic = true,
  },
  nightfox = {
    options = {
      transparent = true,
    },
  },
}

local theme = 'rose-pine'
local setup = theme_setups[theme]

if setup then
  vim.o.background = 'dark'
  require(theme).setup(setup)
  vim.cmd.colorscheme(theme)
end
