syntax on			" enable coloration

set nocompatible

"set mouse=a			" use your mouse with your terminal

set softtabstop=2		" indentation is 2 spaces
set tabstop=8			" tab is 8 spaces
set shiftwidth=2
set expandtab

highlight LongLine ctermbg=DarkYellow guibg=DarkYellow
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow

filetype on

augroup csrc
  au!
  autocmd FileType *	  set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END

set cinoptions=:0,g0,(0,Ws,l1
set smarttab

" Customize the compilation & quickfix here
set autowrite			" save buffers before compiling
map <F5> :mak<CR><Esc>
map <F7> :cp!<CR><Esc>
map <F8> :cn!<CR><Esc>
