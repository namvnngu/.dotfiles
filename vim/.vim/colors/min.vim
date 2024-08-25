" A minimal colorscheme for Vim by Nam.
"
" Name:        min.vim
" Description: A minimal colorscheme with mainly black and white
" Version:     0.0.1
" Maintainer:  Nam Nguyen (Viet Nam Nguyen)
" Github:      https://github.com/namvnngu
"

" Initial setup
highlight clear

if exists("syntax on")
  syntax reset
endif

let g:colors_name = "min"

" Colors

" Utilities

"" Reference: https://github.com/noahfrederick/vim-hemisu/blob/master/colors/hemisu.vim#L90C1-L99C12
function! s:highlight(group, style)
  let l:style = a:style[&background]
  execute "highlight" a:group
        \ "guifg="   (has_key(l:style, "fg")    ? l:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(l:style, "bg")    ? l:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(l:style, "sp")    ? l:style.sp.gui   : "NONE")
        \ "gui="     (has_key(l:style, "gui")   ? l:style.gui      : "NONE")
        \ "ctermfg=" (has_key(l:style, "fg")    ? l:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(l:style, "bg")    ? l:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(l:style, "cterm") ? l:style.cterm    : "NONE")
endfunction

" Built-in highlights
