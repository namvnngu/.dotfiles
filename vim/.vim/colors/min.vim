" A minimal colorscheme for Vim by Nam.
"
" Name:        min.vim
" Description: A minimal colorscheme with mainly black and white
" Version:     0.0.1
" Maintainer:  Nam Nguyen (Viet Nam Nguyen)
" Github:      https://github.com/namvnngu
"

highlight clear

if exists("syntax on")
  syntax reset
endif

let g:colors_name = "min"

" Colors

" Utilities

"" Source: https://github.com/noahfrederick/vim-hemisu
function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" UI Highlights

" General Syntax Highlights
