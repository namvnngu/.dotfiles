autocmd filetype python nnoremap <Leader>pp :FloattermNew! clear && python3 % <CR>
autocmd filetype cpp nnoremap <Leader>pp :FloatermNew! clear && g++ -std=c++14 % -O2 -Wall -Wextra -Werror -pedantic -g -o %:t:r && ./%:t:r <CR>
autocmd filetype java nnoremap <Leader>pp :FloatermNew! clear && javac %:t && java -enableassertions %:t:r<CR>
autocmd filetype cs nnoremap <Leader>pp :FloattermNew! clear && dotnet run --project %:p:h<CR>
