nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <leader>qq :q<CR>
nnoremap <Leader>Y "*y
nnoremap <Leader>P "*p
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>ay :%y+<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bd :bdelete<CR>
tnoremap <Esc> <C-\><C-n> "NeoVim
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Yank til the end
nnoremap Y y$

" Keeping it centered and stable
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
