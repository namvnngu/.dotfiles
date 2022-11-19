vim.cmd([[
  " set background=light

  " let g:gruvbox_contrast_dark='medium'
  " let g:gruvbox_contrast_light='medium'
  " let g:gruvbox_transparent_bg=0
  " colorscheme gruvbox

  " let g:tokyonight_transparent=1
  " let g:tokyonight_transparent_sidebar=1
  " colorscheme tokyonight

  hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
  hi! Normal ctermbg=NONE guibg=NONE
]])

-- require("github-theme").setup({
-- 	theme_style = "dark_default",
-- 	transparent = true,
-- 	sidebars = { "qf", "vista_kind", "terminal", "packer" },
-- })
--

vim.cmd.colorscheme("catppuccin")
require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
})
