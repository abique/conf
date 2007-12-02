""
"" leopard.vim for vim-syntax in /u/a1/sigour_b/.vim/ftdetect
""
"" Made by SIGOURE Benoit
"" Login   <sigour_b@epita.fr>
""
"" Started on  Sat Jan  7 20:08:17 2006 SIGOURE Benoit
"" Last update Wed Mar  8 14:01:07 2006 SIGOURE Benoit
""

" This file is used to detect the leopard files

" INSTALL instructions:
" $ mkdir -p ~/.vim/ftdetect
" $ cp leopard-ftdetect.vim ~/.vim/ftdetect/leopard.vim

au BufRead,BufNewFile *.leo		set filetype=leopard
au BufRead,BufNewFile *.leh		set filetype=leopard
