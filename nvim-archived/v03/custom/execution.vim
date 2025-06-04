autocmd filetype python nnoremap <Leader>pp :FloatermNew! clear && python3 % <CR>
autocmd filetype cpp nnoremap <Leader>pp :FloatermNew! clear && g++ -std=c++14 % -O2 -Wall -Wextra -Werror -pedantic -g -o %:t:r.out && ./%:t:r.out <CR>
autocmd filetype java nnoremap <Leader>pp :FloatermNew! clear && javac %:t && java -enableassertions %:t:r<CR>
autocmd filetype cs nnoremap <Leader>pp :FloatermNew! clear && dotnet run --project %:p:h<CR>
autocmd filetype javascript nnoremap <Leader>pp :FloatermNew! clear && esno % <CR>
autocmd filetype typescript nnoremap <Leader>pp :FloatermNew! clear && esno % <CR>
