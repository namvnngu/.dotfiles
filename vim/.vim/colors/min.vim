" A minimal colorscheme for Vim by Nam
"
" Name:        min.vim
" Description: A minimal colorscheme with mainly black and white
" Version:     0.0.1-beta
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

let s:black   = { "gui": "#000000", "cterm": "0" }
let s:maroon  = { "gui": "#800000", "cterm": "1" }
let s:olive   = { "gui": "#808000", "cterm": "3" }
let s:silver  = { "gui": "#c0c0c0", "cterm": "7" }
let s:grey    = { "gui": "#808080", "cterm": "8" }
let s:red     = { "gui": "#ff0000", "cterm": "9" }
let s:lime    = { "gui": "#00ff00", "cterm": "10" }
let s:yellow  = { "gui": "#ffff00", "cterm": "11" }
let s:aqua    = { "gui": "#00ffff", "cterm": "14" }
let s:white   = { "gui": "#ffffff", "cterm": "15" }

let s:grey232 = { "gui": "#080808", "cterm": "232" }
let s:grey233 = { "gui": "#121212", "cterm": "233" }
let s:grey234 = { "gui": "#1c1c1c", "cterm": "234" }
let s:grey235 = { "gui": "#262626", "cterm": "235" }
let s:grey236 = { "gui": "#303030", "cterm": "236" }
let s:grey237 = { "gui": "#3a3a3a", "cterm": "237" }
let s:grey238 = { "gui": "#444444", "cterm": "238" }
let s:grey239 = { "gui": "#4e4e4e", "cterm": "239" }
let s:grey240 = { "gui": "#585858", "cterm": "240" }
let s:grey241 = { "gui": "#606060", "cterm": "241" }
let s:grey242 = { "gui": "#666666", "cterm": "242" }
let s:grey243 = { "gui": "#767676", "cterm": "243" }
let s:grey244 = { "gui": "#808080", "cterm": "244" }
let s:grey245 = { "gui": "#8a8a8a", "cterm": "245" }
let s:grey246 = { "gui": "#949494", "cterm": "246" }
let s:grey247 = { "gui": "#9e9e9e", "cterm": "247" }
let s:grey248 = { "gui": "#a8a8a8", "cterm": "248" }
let s:grey249 = { "gui": "#b2b2b2", "cterm": "249" }
let s:grey250 = { "gui": "#bcbcbc", "cterm": "250" }
let s:grey251 = { "gui": "#c6c6c6", "cterm": "251" }
let s:grey252 = { "gui": "#d0d0d0", "cterm": "252" }
let s:grey253 = { "gui": "#dadada", "cterm": "253" }
let s:grey254 = { "gui": "#e4e4e4", "cterm": "254" }
let s:grey255 = { "gui": "#eeeeee", "cterm": "255" }

" Utilities

"" Reference: https://github.com/noahfrederick/vim-hemisu/blob/master/colors/hemisu.vim#L90C1-L99C12
function! s:highlight(group, style)
  let l:variant = a:style[&background]
  execute "highlight" a:group
        \ "guifg="   (has_key(l:variant, "fg")  ? l:variant.fg.gui   : "NONE")
        \ "guibg="   (has_key(l:variant, "bg")  ? l:variant.bg.gui   : "NONE")
        \ "guisp="   (has_key(l:variant, "sp")  ? l:variant.sp.gui   : "NONE")
        \ "gui="     (has_key(l:variant, "gui") ? l:variant.gui      : "NONE")
        \ "ctermfg=" (has_key(l:variant, "fg")  ? l:variant.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(l:variant, "bg")  ? l:variant.bg.cterm : "NONE")
        \ "cterm="   (has_key(l:variant, "gui") ? l:variant.gui      : "NONE")
endfunction

let s:normal_fg = {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ }
let s:normal_fg_underline = {
      \ "light": { "fg": s:black, "gui": "underline" },
      \ "dark" : { "fg": s:white, "gui": "underline" },
      \ }
let s:normal_fg_bold = {
      \ "light": { "fg": s:black, "gui": "bold" },
      \ "dark" : { "fg": s:white, "gui": "bold" },
      \ }

let s:error_fg = {
      \ "light": { "fg": s:grey234 },
      \ "dark" : { "fg": s:grey234 },
      \ }
let s:error_fg_underline = {
      \ "light": { "fg": s:grey234, "gui": "underline" },
      \ "dark" : { "fg": s:grey234, "gui": "underline" },
      \ }
let s:warn_fg = {
      \ "light": { "fg": s:grey237 },
      \ "dark" : { "fg": s:grey237 },
      \ }
let s:warn_fg_underline = {
      \ "light": { "fg": s:grey237, "gui": "underline" },
      \ "dark" : { "fg": s:grey237, "gui": "underline" },
      \ }
let s:info_fg = {
      \ "light": { "fg": s:grey241 },
      \ "dark" : { "fg": s:grey241 },
      \ }
let s:info_fg_underline = {
      \ "light": { "fg": s:grey241, "gui": "underline" },
      \ "dark" : { "fg": s:grey241, "gui": "underline" },
      \ }
let s:hint_fg = {
      \ "light": { "fg": s:grey244 },
      \ "dark" : { "fg": s:grey244 },
      \ }
let s:hint_fg_underline = {
      \ "light": { "fg": s:grey244, "gui": "underline" },
      \ "dark" : { "fg": s:grey244, "gui": "underline" },
      \ }
let s:ok_fg = {
      \ "light": { "fg": s:grey247 },
      \ "dark" : { "fg": s:grey247 },
      \ }
let s:ok_fg_underline = {
      \ "light": { "fg": s:grey247, "gui": "underline" },
      \ "dark" : { "fg": s:grey247, "gui": "underline" },
      \ }

" Builtin syntax group names, see *group-name*

call s:highlight("Comment", {
      \ "light": { "fg": s:grey246 },
      \ "dark" : { "fg": s:grey },
      \ })

call s:highlight("Constant", s:normal_fg)
highlight! link String    Constant
highlight! link Character Constant
highlight! link Number    Constant
highlight! link Boolean   Constant
highlight! link Float     Constant

highlight! link Identifier Constant
highlight! link Function   Constant

highlight! link Statement   Constant
highlight! link Conditional Constant
highlight! link Repeat      Constant
highlight! link Label       Constant
highlight! link Operator    Constant
highlight! link Keyword     Constant
highlight! link Exception   Constant

highlight! link PreProc   Constant
highlight! link Include   Constant
highlight! link Define    Constant
highlight! link Macro     Constant
highlight! link PreCondit Constant

highlight! link Type         Constant
highlight! link StorageClass Constant
highlight! link Structure    Constant
highlight! link Typedef      Constant

highlight! link Special        Constant
highlight! link SpecialChar    Constant
highlight! link Tag            Constant
highlight! link Delimiter      Constant
highlight! link SpecialComment Constant
highlight! link Debug          Constant

call s:highlight("Underlined", s:normal_fg_underline)

highlight! link Ignore Constant

call s:highlight("Error", s:error_fg)

call s:highlight("Todo", s:normal_fg_bold)

call s:highlight("Added", {
      \ "light": { "fg": s:black, "bg": s:lime },
      \ "dark" : { "fg": s:black, "bg": s:lime },
      \ })
call s:highlight("Changed", {
      \ "light": { "fg": s:black, "bg": s:aqua },
      \ "dark" : { "fg": s:black, "bg": s:aqua },
      \ })
call s:highlight("Removed", {
      \ "light": { "fg": s:white, "bg": s:red },
      \ "dark" : { "fg": s:white, "bg": s:red },
      \ })

" Builtin highlight groups, see *highlight-groups*

call s:highlight("ColorColumn", {
      \ "light": { "bg": s:grey253 },
      \ "dark" : { "bg": s:silver },
      \ })

call s:highlight("Conceal", {
      \ "light": { "fg": s:grey },
      \ "dark" : { "fg": s:grey },
      \ })

call s:highlight("CurSearch", {
      \ "light": { "fg": s:black, "bg": s:grey250 },
      \ "dark" : { "fg": s:white, "bg": s:grey250 },
      \ })

call s:highlight("Cursor", {
      \ "light": { "fg": s:white, "bg": s:black },
      \ "dark" : { "fg": s:black, "bg": s:white },
      \ })
highlight! link lCursor Cursor

highlight! link CursorIM Cursor

call s:highlight("CursorColumn", {
      \ "light": { "bg": s:grey254 },
      \ "dark" : { "bg": s:grey239 },
      \ })

call s:highlight("CursorLine", {
      \ "light": { "bg": s:grey254 },
      \ "dark" : { "bg": s:grey239 },
      \ })

call s:highlight("Directory", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

highlight! link DiffAdd Added

call s:highlight("DiffChange", {
      \ "light": { "fg": s:black, "bg": s:grey250 },
      \ "dark" : { "fg": s:white, "bg": s:olive },
      \ })

highlight! link DiffDelete Removed

highlight! link DiffText Changed

call s:highlight("EndOfBuffer", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })

highlight! link TermCursor Cursor

call s:highlight("TermCursorNC", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("ErrorMsg", s:error_fg)

call s:highlight("WinSeparator", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("Folded", {
      \ "light": { "fg": s:grey, "bg": s:silver },
      \ "dark" : { "fg": s:grey, "bg": s:silver },
      \ })

call s:highlight("FoldColumn", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })

highlight! link SignColumn FoldColumn

call s:highlight("IncSearch", {
      \ "light": { "fg": s:white, "bg": s:grey232 },
      \ "dark" : { "fg": s:black, "bg": s:grey255 },
      \ })

call s:highlight("Substitute", {
      \ "light": { "fg": s:white, "bg": s:grey240 },
      \ "dark" : { "fg": s:white, "bg": s:grey240 },
      \ })

call s:highlight("LineNr", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })
highlight! link LineNrAbove LineNr
highlight! link LineNrBelow LineNr

call s:highlight("CursorLineNr", {
      \ "light": { "fg": s:black, "gui": "bold" },
      \ "dark" : { "fg": s:white, "gui": "bold" },
      \ })

call s:highlight("CursorLineFold", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })
highlight! link CursorLineSign CursorLineFold

call s:highlight("MatchParen", {
      \ "light": { "fg": s:black, "bg": s:grey },
      \ "dark" : { "fg": s:white, "bg": s:grey },
      \ })

call s:highlight("ModeMsg", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("MsgArea", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("MsgSeparator", {
      \ "light": { "fg": s:grey, "bg": s:black },
      \ "dark" : { "fg": s:grey, "bg": s:white },
      \ })

call s:highlight("MoreMsg", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("NonText", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })

call s:highlight("Normal", {
      \ "light": { "fg": s:black, "bg": s:white },
      \ "dark" : { "fg": s:white, "bg": s:black },
      \ })

highlight! link NormalFloat Normal

highlight! link FloatBorder Normal

highlight! link FloatTitle Normal

highlight! link FloatFooter Normal

highlight! link NormalNC Normal

call s:highlight("Pmenu", {
      \ "light": { "fg": s:black, "bg": s:silver },
      \ "dark" : { "fg": s:black, "bg": s:silver },
      \ })

call s:highlight("PmenuSel", {
      \ "light": { "fg": s:black, "bg": s:grey },
      \ "dark" : { "fg": s:black, "bg": s:grey },
      \ })

call s:highlight("Question", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("QuickFixLine", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("Search", {
      \ "light": { "fg": s:white, "bg": s:grey240 },
      \ "dark" : { "fg": s:white, "bg": s:grey240 },
      \ })

call s:highlight("SnippetTabstop", {
      \ "light": { "fg": s:black, "bg": s:grey },
      \ "dark" : { "fg": s:black, "bg": s:grey },
      \ })

call s:highlight("SpecialKey", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })

call s:highlight("SpellBad", {
      \ "light": { "fg": s:black, "gui": "underline" },
      \ "dark" : { "fg": s:white, "gui": "underline" },
      \ })

highlight! link SpellCap SpellBad

highlight! link SpellLocal SpellBad

highlight! link SpellRare SpellBad

call s:highlight("StatusLine", {
      \ "light": { "fg": s:white, "bg": s:black },
      \ "dark" : { "fg": s:black, "bg": s:white },
      \ })

call s:highlight("StatusLineNC", {
      \ "light": { "fg": s:black, "bg": s:silver },
      \ "dark" : { "fg": s:black, "bg": s:silver },
      \ })

call s:highlight("TabLine", {
      \ "light": { "fg": s:black, "bg": s:silver },
      \ "dark" : { "fg": s:black, "bg": s:silver },
      \ })

call s:highlight("TabLineSel", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("Title", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("Visual", {
      \ "light": { "bg": s:grey254 },
      \ "dark" : { "bg": s:grey239 },
      \ })

call s:highlight("WarningMsg", s:warn_fg)

call s:highlight("Whitespace", {
      \ "light": { "fg": s:grey },
      \ "dark" : { "fg": s:grey },
      \ })

call s:highlight("WinBar", {
      \ "light": { "fg": s:grey },
      \ "dark" : { "fg": s:grey },
      \ })

call s:highlight("WinBarNC", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })

" LSP diagnostic highlights, see *diagnostic-highlights*

call s:highlight("DiagnosticError", s:error_fg)
call s:highlight("DiagnosticWarn", s:warn_fg)
call s:highlight("DiagnosticInfo", s:info_fg)
call s:highlight("DiagnosticHint", s:hint_fg)
call s:highlight("DiagnosticOk", s:ok_fg)
call s:highlight("DiagnosticUnderlineError", s:error_fg_underline)
call s:highlight("DiagnosticUnderlineWarn", s:warn_fg_underline)
call s:highlight("DiagnosticUnderlineInfo", s:info_fg_underline)
call s:highlight("DiagnosticUnderlineHint", s:hint_fg_underline)
call s:highlight("DiagnosticUnderlineOk", s:ok_fg_underline)
call s:highlight("DiagnosticDeprecated", {
      \ "light": { "fg": s:grey244, "gui": "strikethrough" },
      \ "dark" : { "fg": s:grey244, "gui": "strikethrough" },
      \ })
