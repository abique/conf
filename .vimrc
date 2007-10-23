"
" .vimrc 0.9.90
"

set nocompatible
set bs=indent,eol,start
syntax on

set hls		" HighLight Search
set is		" Incremental Search
set ic		" Ignore case

set ruler
set showmatch

"set tags=tags.vim
set background=dark

if &term == "xterm-256color"
	" The Search highlight group will have a 50% grey bg
	hi Search ctermbg=244
endif
" guifont should be conditionally set (utf-8 or not)
"set guifont=-misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso10646-1
set guifont=6x13

" See *30.3* or *:filetype-indent-on*
filetype indent on
set shiftwidth=4
set shiftround
set cinoptions={.5s
set comments=s:/*,mb:**,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
set formatoptions=tcqr

colorscheme darkblue
set shiftwidth=4
set shiftround
set expandtab
set tabstop=8

