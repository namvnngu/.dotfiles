let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden=1
" autocmd vimenter * NERDTree
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusUpdateOnCursorHold = 1
nnoremap <leader>tf :NERDTreeFind<CR>

"function! ToggleVExplorer()
  "if exists("t:expl_buf_num")
      "let expl_win_num = bufwinnr(t:expl_buf_num)
      "if expl_win_num != -1
          "let cur_win_nr = winnr()
          "exec expl_win_num . 'wincmd w'
          "close
          "exec cur_win_nr . 'wincmd w'
          "unlet t:expl_buf_num
      "else
          "unlet t:expl_buf_num
      "endif
  "else
      "exec '1wincmd w'
      "Vexplore
      "let t:expl_buf_num = bufnr("%")
  "endif
"endfunction
"map <silent> <C-N> :call ToggleVExplorer()<CR>

"" Hit enter in the file browser to open the selected
"" file with :vsplit to the right of the browser.
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1

"" Default to tree mode
"let g:netrw_liststyle=3

