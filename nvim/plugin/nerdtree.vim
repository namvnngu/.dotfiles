let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden=1
" autocmd vimenter * NERDTree
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusUpdateOnCursorHold = 1
nnoremap <leader>tf :NERDTreeFind<CR>
