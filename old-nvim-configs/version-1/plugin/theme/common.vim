set background=dark " Setting dark mode
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
hi! Normal ctermbg=NONE guibg=NONE
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
