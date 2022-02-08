set background=dark " Setting dark mode
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
hi! Normal ctermbg=NONE guibg=NONE
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Gruvbox
let g:gruvbox_contrast_dark='hard'
autocmd vimenter * ++nested colorscheme gruvbox

" Catppuccino
" lua << EOF
" local catppuccino = require("catppuccino")
" catppuccino.setup({
"   colorscheme = "neon_latte",
"   transparency = true,
" })
" catppuccino.load()
" EOF

" Palenight Colortheme
"colorscheme palenight
"let g:lightline = { 'colorscheme': 'palenight' }
"let g:airline_theme = "palenight"
"let g:palenight_terminal_italics=1

" Rose-pine
"lua << EOF
  "vim.g.rose_pine_variant = 'moon'
"EOF
"colorscheme rose-pine
"highlight ColorColumn ctermbg=0 guibg=#656180

" Nebulous
" lua << EOF
" require("nebulous").setup {
"   variant = "night",
"   disable = {
"     background = true,
"     endOfBuffer = false,
"   },
"   italic = {
"     comments   = false,
"     keywords   = true,
"     functions  = false,
"     variables  = true,
"   },
"   custom_colors = { -- this table can hold any group of colors with their respective values
"     LineNr = { fg = "#5BBBDA", bg = "NONE", style = "NONE" },
"     CursorLineNr = { fg = "#E1CD6C", bg = "NONE", style = "NONE" },

"     -- it is possible to specify only the element to be changed
"     TelescopePreviewBorder = { fg = "#A13413" },
"     LspDiagnosticsDefaultError = { bg = "#E11313" },
"     TSTagDelimiter = { style = "bold,italic" },
"   }
" }
" EOF
