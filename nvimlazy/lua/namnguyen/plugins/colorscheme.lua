return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      variant = "moon",
      disable_background = true,
      disable_float_background = true,
      disable_italics = true,
    },
  },
}
