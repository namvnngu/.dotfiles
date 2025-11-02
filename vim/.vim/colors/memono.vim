" Name:          Memono
" Description:   Simple and less colorful, forked from 'wildcharm'.
" Author:        Nam Nguyen <vnngucs@outlook.com>
" License:       The Unlicense
" Date Created:  November 02, 2025
" Date Modified: November 02, 2025 

hi clear
let g:colors_name = 'memono'

" Custom
hi! link Directory Identifier
hi! link Float Constant
hi! link Function Constant
hi! link Number Constant
hi! link PreProc Identifier
hi! link Special Identifier
hi! link Statement Identifier
hi! link String Constant
hi! link Type Identifier

" Wild Charm
hi! link CurSearch IncSearch
hi! link CursorLineFold FoldColumn
hi! link CursorLineSign FoldColumn
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link MessageWindow PMenu
hi! link PopupNotification Normal
hi! link PreInsert NonText
hi! link StatusLineTerm Statusline
hi! link StatusLineTermNC StatuslineNC
hi! link TabPanel Normal
hi! link TabPanelFill Normal
hi! link Terminal Normal

if &background == 'dark'
  " Custom
  hi Constant        guifg=#ffffff guibg=NONE    guisp=NONE    gui=NONE         ctermfg=15   ctermbg=NONE cterm=NONE         term=NONE
  hi Identifier      guifg=#ffffff guibg=NONE    guisp=NONE    gui=bold         ctermfg=15   ctermbg=NONE cterm=bold         term=bold
  hi Normal          guifg=#ffffff guibg=#000000 guisp=NONE    gui=NONE         ctermfg=15   ctermbg=0    cterm=NONE         term=NONE

  " Wild Charm
  hi Added           guifg=#00af5f guibg=NONE    guisp=NONE    gui=NONE         ctermfg=35   ctermbg=NONE cterm=NONE         term=NONE
  hi Changed         guifg=#0087d7 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=32   ctermbg=NONE cterm=NONE         term=NONE
  hi ColorColumn     guifg=NONE    guibg=#303030 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=236  cterm=NONE         term=reverse
  hi Comment         guifg=#767676 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=243  ctermbg=NONE cterm=NONE         term=bold
  hi Conceal         guifg=#585858 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=240  ctermbg=NONE cterm=NONE         term=NONE
  hi CursorColumn    guifg=NONE    guibg=#262626 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=235  cterm=NONE         term=NONE
  hi CursorLine      guifg=NONE    guibg=#262626 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=235  cterm=NONE         term=underline
  hi CursorLineNr    guifg=#ffffff guibg=NONE    guisp=NONE    gui=bold         ctermfg=231  ctermbg=NONE cterm=bold         term=bold
  hi DiffAdd         guifg=NONE    guibg=#273923 guisp=NONE    gui=NONE         ctermfg=252  ctermbg=22   cterm=NONE         term=reverse
  hi DiffChange      guifg=NONE    guibg=#2f2f2f guisp=NONE    gui=NONE         ctermfg=252  ctermbg=236  cterm=NONE         term=NONE
  hi DiffDelete      guifg=#767676 guibg=#2f1f1a guisp=NONE    gui=NONE         ctermfg=243  ctermbg=52   cterm=NONE         term=reverse
  hi DiffText        guifg=NONE    guibg=#0f4f4f guisp=NONE    gui=NONE         ctermfg=252  ctermbg=23   cterm=NONE         term=reverse
  hi EndOfBuffer     guifg=#585858 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=240  ctermbg=NONE cterm=NONE         term=NONE
  hi Error           guifg=#d7005f guibg=#ffffff guisp=NONE    gui=reverse      ctermfg=161  ctermbg=231  cterm=reverse      term=bold,reverse
  hi ErrorMsg        guifg=#d7005f guibg=#ffffff guisp=NONE    gui=reverse      ctermfg=161  ctermbg=231  cterm=reverse      term=bold,reverse
  hi FoldColumn      guifg=#585858 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=240  ctermbg=NONE cterm=NONE         term=NONE
  hi Folded          guifg=#767676 guibg=#303030 guisp=NONE    gui=NONE         ctermfg=243  ctermbg=236  cterm=NONE         term=NONE
  hi Ignore          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=NONE cterm=NONE         term=NONE
  hi IncSearch       guifg=NONE    guibg=#5f431f guisp=NONE    gui=NONE         ctermfg=214  ctermbg=16   cterm=reverse      term=bold,reverse,underline
  hi LineNr          guifg=#585858 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=240  ctermbg=NONE cterm=NONE         term=NONE
  hi MatchParen      guifg=#ff00af guibg=NONE    guisp=NONE    gui=bold         ctermfg=199  ctermbg=NONE cterm=bold         term=bold,underline
  hi ModeMsg         guifg=NONE    guibg=NONE    guisp=NONE    gui=bold         ctermfg=NONE ctermbg=NONE cterm=bold         term=bold
  hi MoreMsg         guifg=#00d75f guibg=NONE    guisp=NONE    gui=NONE         ctermfg=41   ctermbg=NONE cterm=NONE         term=NONE
  hi NonText         guifg=#585858 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=240  ctermbg=NONE cterm=NONE         term=NONE
  hi Pmenu           guifg=NONE    guibg=#303030 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=236  cterm=NONE         term=reverse
  hi PmenuBorder     guifg=#767676 guibg=#303030 guisp=NONE    gui=NONE         ctermfg=243  ctermbg=236  cterm=NONE         term=NONE
  hi PmenuExtra      guifg=#767676 guibg=#303030 guisp=NONE    gui=NONE         ctermfg=243  ctermbg=236  cterm=NONE         term=NONE
  hi PmenuExtraSel   guifg=#767676 guibg=#585858 guisp=NONE    gui=NONE         ctermfg=243  ctermbg=240  cterm=NONE         term=NONE
  hi PmenuKind       guifg=#ff5f87 guibg=#303030 guisp=NONE    gui=NONE         ctermfg=204  ctermbg=236  cterm=NONE         term=NONE
  hi PmenuKindSel    guifg=#ff5f87 guibg=#585858 guisp=NONE    gui=NONE         ctermfg=204  ctermbg=240  cterm=NONE         term=NONE
  hi PmenuMatch      guifg=#d787d7 guibg=#303030 guisp=NONE    gui=NONE         ctermfg=176  ctermbg=236  cterm=NONE         term=NONE
  hi PmenuMatchSel   guifg=#d787d7 guibg=#585858 guisp=NONE    gui=NONE         ctermfg=176  ctermbg=240  cterm=NONE         term=NONE
  hi PmenuSbar       guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=NONE cterm=NONE         term=reverse
  hi PmenuSel        guifg=NONE    guibg=#585858 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=240  cterm=NONE         term=bold
  hi PmenuShadow     guifg=#767676 guibg=#121212 guisp=NONE    gui=NONE         ctermfg=243  ctermbg=233  cterm=NONE         term=NONE
  hi PmenuThumb      guifg=NONE    guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=252  cterm=NONE         term=NONE
  hi Question        guifg=#ff87ff guibg=NONE    guisp=NONE    gui=NONE         ctermfg=213  ctermbg=NONE cterm=NONE         term=standout
  hi QuickFixLine    guifg=NONE    guibg=#4f2f4f guisp=NONE    gui=NONE         ctermfg=252  ctermbg=53   cterm=NONE         term=NONE
  hi Removed         guifg=#d7005f guibg=NONE    guisp=NONE    gui=NONE         ctermfg=161  ctermbg=NONE cterm=NONE         term=NONE
  hi Search          guifg=NONE    guibg=#3a4a3a guisp=NONE    gui=NONE         ctermfg=41   ctermbg=16   cterm=reverse      term=reverse
  hi SignColumn      guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=NONE cterm=NONE         term=reverse
  hi SpecialKey      guifg=#585858 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=240  ctermbg=NONE cterm=NONE         term=bold
  hi SpellBad        guifg=NONE    guibg=NONE    guisp=#ff5f87 gui=undercurl    ctermfg=161  ctermbg=NONE cterm=underline    term=underline
  hi SpellCap        guifg=NONE    guibg=NONE    guisp=#00afaf gui=undercurl    ctermfg=37   ctermbg=NONE cterm=underline    term=underline
  hi SpellLocal      guifg=NONE    guibg=NONE    guisp=#00af5f gui=undercurl    ctermfg=41   ctermbg=NONE cterm=underline    term=underline
  hi SpellRare       guifg=NONE    guibg=NONE    guisp=#ff87ff gui=undercurl    ctermfg=213  ctermbg=NONE cterm=underline    term=underline
  hi StatusLine      guifg=#9e9e9e guibg=#000000 guisp=NONE    gui=bold,reverse ctermfg=247  ctermbg=16   cterm=bold,reverse term=bold,reverse
  hi StatusLineNC    guifg=#767676 guibg=#000000 guisp=NONE    gui=reverse      ctermfg=243  ctermbg=16   cterm=reverse      term=bold,underline
  hi TabLine         guifg=#000000 guibg=#767676 guisp=NONE    gui=NONE         ctermfg=16   ctermbg=243  cterm=NONE         term=bold,underline
  hi TabLineFill     guifg=#000000 guibg=#767676 guisp=NONE    gui=NONE         ctermfg=16   ctermbg=243  cterm=NONE         term=NONE
  hi TabLineSel      guifg=#000000 guibg=#9e9e9e guisp=NONE    gui=bold         ctermfg=16   ctermbg=247  cterm=bold         term=bold,reverse
  hi Title           guifg=NONE    guibg=NONE    guisp=NONE    gui=bold         ctermfg=NONE ctermbg=NONE cterm=bold         term=NONE
  hi TitleBar        guifg=#ffffff guibg=#3c3c3c guisp=NONE    gui=NONE         ctermfg=231  ctermbg=237  cterm=NONE         term=NONE
  hi TitleBarNC      guifg=#767676 guibg=#2c2c2c guisp=NONE    gui=NONE         ctermfg=243  ctermbg=236  cterm=NONE         term=NONE
  hi Todo            guifg=#ffffff guibg=NONE    guisp=NONE    gui=bold         ctermfg=231  ctermbg=NONE cterm=bold         term=bold,reverse
  hi ToolbarButton   guifg=#000000 guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=16   ctermbg=252  cterm=NONE         term=bold,reverse
  hi ToolbarLine     guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=NONE cterm=NONE         term=reverse
  hi Underlined      guifg=NONE    guibg=NONE    guisp=NONE    gui=underline    ctermfg=NONE ctermbg=NONE cterm=underline    term=underline
  hi VertSplit       guifg=#767676 guibg=#767676 guisp=NONE    gui=NONE         ctermfg=243  ctermbg=243  cterm=NONE         term=NONE
  hi Visual          guifg=NONE    guibg=#204060 guisp=NONE    gui=NONE         ctermfg=81   ctermbg=16   cterm=reverse      term=reverse
  hi VisualNOS       guifg=#000000 guibg=#00afff guisp=NONE    gui=NONE         ctermfg=16   ctermbg=39   cterm=NONE         term=NONE
  hi WarningMsg      guifg=#ffaf00 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=214  ctermbg=NONE cterm=NONE         term=standout
  hi WildMenu        guifg=#000000 guibg=#ffaf00 guisp=NONE    gui=NONE         ctermfg=16   ctermbg=214  cterm=NONE         term=bold
  hi debugBreakpoint guifg=#00afaf guibg=NONE    guisp=NONE    gui=reverse      ctermfg=37   ctermbg=NONE cterm=reverse      term=reverse
  hi debugPC         guifg=#0087d7 guibg=NONE    guisp=NONE    gui=reverse      ctermfg=32   ctermbg=NONE cterm=reverse      term=reverse
endif

if &background == 'light'
  " Custom
  hi Constant        guifg=#000000 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=0    ctermbg=NONE cterm=NONE         term=NONE
  hi Identifier      guifg=#000000 guibg=NONE    guisp=NONE    gui=bold         ctermfg=0    ctermbg=NONE cterm=bold         term=bold
  hi Normal          guifg=#000000 guibg=#ffffff guisp=NONE    gui=NONE         ctermfg=0    ctermbg=15   cterm=NONE         term=NONE

  " Wild Charm
  hi Added           guifg=#5faf5f guibg=NONE    guisp=NONE    gui=NONE         ctermfg=71   ctermbg=NONE cterm=NONE         term=NONE
  hi Changed         guifg=#0087d7 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=32   ctermbg=NONE cterm=NONE         term=NONE
  hi ColorColumn     guifg=NONE    guibg=#e4e4e4 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=254  cterm=NONE         term=reverse
  hi Comment         guifg=#8a8a8a guibg=NONE    guisp=NONE    gui=NONE         ctermfg=245  ctermbg=NONE cterm=NONE         term=bold
  hi Conceal         guifg=#a8a8a8 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=248  ctermbg=NONE cterm=NONE         term=NONE
  hi CursorColumn    guifg=NONE    guibg=#eeeeee guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=255  cterm=NONE         term=NONE
  hi CursorLine      guifg=NONE    guibg=#eeeeee guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=255  cterm=NONE         term=underline
  hi CursorLineNr    guifg=#000000 guibg=NONE    guisp=NONE    gui=bold         ctermfg=16   ctermbg=NONE cterm=bold         term=bold
  hi DiffAdd         guifg=NONE    guibg=#dafada guisp=NONE    gui=NONE         ctermfg=16   ctermbg=151  cterm=NONE         term=reverse
  hi DiffChange      guifg=NONE    guibg=#e3e3e3 guisp=NONE    gui=NONE         ctermfg=16   ctermbg=253  cterm=NONE         term=NONE
  hi DiffDelete      guifg=#808080 guibg=#ffd7d7 guisp=NONE    gui=NONE         ctermfg=240  ctermbg=224  cterm=NONE         term=reverse
  hi DiffText        guifg=NONE    guibg=#bfe7e7 guisp=NONE    gui=NONE         ctermfg=16   ctermbg=152  cterm=NONE         term=reverse
  hi EndOfBuffer     guifg=#a8a8a8 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=248  ctermbg=NONE cterm=NONE         term=NONE
  hi Error           guifg=#af0000 guibg=#ffffff guisp=NONE    gui=reverse      ctermfg=124  ctermbg=231  cterm=reverse      term=bold,reverse
  hi ErrorMsg        guifg=#d70000 guibg=#ffffff guisp=NONE    gui=reverse      ctermfg=160  ctermbg=231  cterm=reverse      term=bold,reverse
  hi FoldColumn      guifg=#a8a8a8 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=248  ctermbg=NONE cterm=NONE         term=NONE
  hi Folded          guifg=#808080 guibg=#e4e4e4 guisp=NONE    gui=NONE         ctermfg=240  ctermbg=254  cterm=NONE         term=NONE
  hi Ignore          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=NONE cterm=NONE         term=NONE
  hi IncSearch       guifg=NONE    guibg=#fff0cf guisp=NONE    gui=NONE         ctermfg=172  ctermbg=231  cterm=reverse      term=bold,reverse,underline
  hi LineNr          guifg=#a8a8a8 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=248  ctermbg=NONE cterm=NONE         term=NONE
  hi MatchParen      guifg=#ff00af guibg=NONE    guisp=NONE    gui=bold         ctermfg=199  ctermbg=NONE cterm=bold         term=bold,underline
  hi ModeMsg         guifg=NONE    guibg=NONE    guisp=NONE    gui=bold         ctermfg=NONE ctermbg=NONE cterm=bold         term=bold
  hi MoreMsg         guifg=#008700 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=28   ctermbg=NONE cterm=NONE         term=NONE
  hi NonText         guifg=#a8a8a8 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=248  ctermbg=NONE cterm=NONE         term=NONE
  hi Pmenu           guifg=NONE    guibg=#e4e4e4 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=254  cterm=NONE         term=reverse
  hi PmenuBorder     guifg=#808080 guibg=#e4e4e4 guisp=NONE    gui=NONE         ctermfg=240  ctermbg=254  cterm=NONE         term=NONE
  hi PmenuExtra      guifg=#808080 guibg=#e4e4e4 guisp=NONE    gui=NONE         ctermfg=240  ctermbg=254  cterm=NONE         term=NONE
  hi PmenuExtraSel   guifg=#808080 guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=240  ctermbg=252  cterm=NONE         term=NONE
  hi PmenuKind       guifg=#d70000 guibg=#e4e4e4 guisp=NONE    gui=NONE         ctermfg=160  ctermbg=254  cterm=NONE         term=NONE
  hi PmenuKindSel    guifg=#d70000 guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=160  ctermbg=252  cterm=NONE         term=NONE
  hi PmenuMatch      guifg=#870087 guibg=#e4e4e4 guisp=NONE    gui=NONE         ctermfg=90   ctermbg=254  cterm=NONE         term=NONE
  hi PmenuMatchSel   guifg=#870087 guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=90   ctermbg=252  cterm=NONE         term=NONE
  hi PmenuSbar       guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=NONE cterm=NONE         term=reverse
  hi PmenuSel        guifg=NONE    guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=252  cterm=NONE         term=bold
  hi PmenuShadow     guifg=#808080 guibg=#303030 guisp=NONE    gui=NONE         ctermfg=240  ctermbg=236  cterm=NONE         term=NONE
  hi PmenuThumb      guifg=NONE    guibg=#808080 guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=240  cterm=NONE         term=NONE
  hi Question        guifg=#870087 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=90   ctermbg=NONE cterm=NONE         term=standout
  hi QuickFixLine    guifg=NONE    guibg=#e7cfe7 guisp=NONE    gui=NONE         ctermfg=16   ctermbg=182  cterm=NONE         term=NONE
  hi Removed         guifg=#d70000 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=160  ctermbg=NONE cterm=NONE         term=NONE
  hi Search          guifg=NONE    guibg=#e7f3e7 guisp=NONE    gui=NONE         ctermfg=28   ctermbg=231  cterm=reverse      term=reverse
  hi SignColumn      guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=NONE cterm=NONE         term=reverse
  hi SpecialKey      guifg=#a8a8a8 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=248  ctermbg=NONE cterm=NONE         term=bold
  hi SpellBad        guifg=NONE    guibg=NONE    guisp=#af0000 gui=undercurl    ctermfg=160  ctermbg=NONE cterm=underline    term=underline
  hi SpellCap        guifg=NONE    guibg=NONE    guisp=#008787 gui=undercurl    ctermfg=30   ctermbg=NONE cterm=underline    term=underline
  hi SpellLocal      guifg=NONE    guibg=NONE    guisp=#008700 gui=undercurl    ctermfg=28   ctermbg=NONE cterm=underline    term=underline
  hi SpellRare       guifg=NONE    guibg=NONE    guisp=#af00af gui=undercurl    ctermfg=127  ctermbg=NONE cterm=underline    term=underline
  hi StatusLine      guifg=#ffffff guibg=#5f5f5f guisp=NONE    gui=bold         ctermfg=231  ctermbg=59   cterm=bold         term=bold,reverse
  hi StatusLineNC    guifg=#000000 guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=16   ctermbg=252  cterm=NONE         term=bold,underline
  hi TabLine         guifg=#000000 guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=16   ctermbg=252  cterm=NONE         term=bold,underline
  hi TabLineFill     guifg=#d0d0d0 guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=252  ctermbg=252  cterm=NONE         term=NONE
  hi TabLineSel      guifg=#5f5f5f guibg=#ffffff guisp=NONE    gui=bold,reverse ctermfg=59   ctermbg=231  cterm=bold,reverse term=bold,reverse
  hi Title           guifg=NONE    guibg=NONE    guisp=NONE    gui=bold         ctermfg=NONE ctermbg=NONE cterm=bold         term=NONE
  hi TitleBar        guifg=#000000 guibg=#ececec guisp=NONE    gui=NONE         ctermfg=16   ctermbg=255  cterm=NONE         term=NONE
  hi TitleBarNC      guifg=#808080 guibg=#f5f5f5 guisp=NONE    gui=NONE         ctermfg=240  ctermbg=255  cterm=NONE         term=NONE
  hi Todo            guifg=NONE    guibg=NONE    guisp=NONE    gui=bold         ctermfg=NONE ctermbg=NONE cterm=bold         term=bold,reverse
  hi ToolbarButton   guifg=#ffffff guibg=#5f5f5f guisp=NONE    gui=NONE         ctermfg=231  ctermbg=59   cterm=NONE         term=bold,reverse
  hi ToolbarLine     guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE         ctermfg=NONE ctermbg=NONE cterm=NONE         term=reverse
  hi Underlined      guifg=NONE    guibg=NONE    guisp=NONE    gui=underline    ctermfg=NONE ctermbg=NONE cterm=underline    term=underline
  hi VertSplit       guifg=#d0d0d0 guibg=#d0d0d0 guisp=NONE    gui=NONE         ctermfg=252  ctermbg=252  cterm=NONE         term=NONE
  hi Visual          guifg=NONE    guibg=#bfdfff guisp=NONE    gui=NONE         ctermfg=32   ctermbg=231  cterm=reverse      term=reverse
  hi VisualNOS       guifg=#ffffff guibg=#005faf guisp=NONE    gui=NONE         ctermfg=231  ctermbg=25   cterm=NONE         term=NONE
  hi WarningMsg      guifg=#af5f00 guibg=NONE    guisp=NONE    gui=NONE         ctermfg=130  ctermbg=NONE cterm=NONE         term=standout
  hi WildMenu        guifg=#ffffff guibg=#d78700 guisp=NONE    gui=NONE         ctermfg=231  ctermbg=172  cterm=NONE         term=bold
  hi debugBreakpoint guifg=#008787 guibg=NONE    guisp=NONE    gui=reverse      ctermfg=30   ctermbg=NONE cterm=reverse      term=reverse
  hi debugPC         guifg=#005faf guibg=NONE    guisp=NONE    gui=reverse      ctermfg=25   ctermbg=NONE cterm=reverse      term=reverse
endif
