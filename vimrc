"
" Vars
"
let login_epita = "bique_a"	" login epita

"
" General
"
set nocompatible		" no vi-compatible mode
filetype on			" detect the ype of the file
filetype plugin on		" load filetypes plugin
set history=500			" history
set cf				" enable error files and erro jumping

"
" Theme
"
syntax on			" enable syntax highlighting
colorscheme inkpot		" theme: snp

"
" Backup
"
set backup			" enable backup
set backupdir=~/.vim/backup	" backup files
set directory=~/.vim/temp	" temp files
set makeef=error.err		" error files

"
" Vim UI
"
set lsp=0
set wildmenu			" display list for completion mode
set ruler			" display cursor position
set cmdheight=2			" command line uses 2 screen line
set lz				" do not redraw while running macro
set showcmd			" display the current command
set backspace=indent,eol,start	" enable a nice backspace
set wildchar=<Tab>
set whichwrap=<,>,[,],b,s,h,l	" enable keys to move cursor
set mouse=a			" enable mouse uses everywhere
set shortmess=atI		" shortens messages
set report=0			" report anything
set noerrorbells		" no beep

"
" Visual
"
set showmatch			" show matching brackets
set mat=5			" show matching brackets for 5 tenth of secs
set nohlsearch			" no highlight for searched phrases
set incsearch			" display matching pattern as typing
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " :set list
set so=5			" keep 10 lines for scope
set novisualbell		" do not blink

"
" Text formatting
"
set fo=tcrqn
set autoindent			" autoindent
set smartindent			" smartindent
set cindent			" c-style indenting
set tabstop=8
set softtabstop=2
set shiftwidth=2
"set nowrap
set smarttab

"
" Misc
"
set wig=*.o
let c_space_errors=1

"
" Autocmd
"
if has("autocmd")
  " jump to the  last known cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \	exe "normal g`\"" |
    \ endif
endif

au BufNewFile,BufRead *.doxygen setfiletype doxygen
