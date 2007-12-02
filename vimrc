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
set number			" display line numbers
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
set nowrap
set smarttab

"
" Folding
"
set foldenable			" enable folding
set foldmethod=indent
set foldlevel=0
set foldopen-=search
set foldopen-=undo

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

"
" file headers
"
aug coding
  au!

  au BufNewFile	  {M,m}akefile	    call MakefileNew()

  au BufNewFile	  *.c{,c,++,pp,xx}  call HeaderCNew()
  au BufWritePre  *.c{,c,++,pp,xx}  call HeaderUpdate()

  au BufNewFile	  *.h{,h,++,pp,xx}  call HeaderHNew()
  au BufWritePre  *.h{,h,++,pp,xx}  call HeaderUpdate()

  au BufNewFile	  index.{html,php}  call HeaderWWWNew()
aug END

function Replace(cs, cm, ce)
  execute "% s,@CS@," . a:cs . ",ge"
  execute "% s,@CM@," . a:cm . ",ge"
  execute "% s,@CE@," . a:ce . ",ge"
  execute "% s,@DATE-STAMP@," . strftime("%c") . ",ge"
  execute "% s,@FILE-NAME@," . expand('%:t') . ",ge"
  execute "% s,@FILE-HEADER@," . substitute(substitute(expand('%:t'), "\\.c", "\\.h", "g"), "\\.hc", "\\.hh", "g") . ",ge" 
  execute "% s,@LARGE-FILE-NAME@," . substitute(toupper(expand('%:t')), "\\.", "_", "g") . ",ge"
  execute "% s,@PART@," . expand("%:p:h:t") . ",ge"
  execute "% s,@PROJECT@," . expand("%:p:h:t") . ",ge"
  execute "% s,@USER-LOGIN@," . g:login_epita . ",ge"
endfun

function HeaderCNew()
  let header = confirm("Add header?", "&None\n&Epita\n&Default")
  if header == 2
    0r ~/.vim/skel/epita.tpl
    9r ~/.vim/skel/c.tpl
  endif
  if header == 3
    0r ~/.vim/skel/c.tpl
  endif
  if header >= 2
    call Replace('/*', '**', '*/')
    normal 2G3W
  endif
endfun

function HeaderHNew()
  let header = confirm("Add header?", "&None\n&Epita\n&Default")
  if header == 2
    0r ~/.vim/skel/epita.tpl
    9r ~/.vim/skel/h.tpl
  endif
  if header == 3
    0r ~/.vim/skel/h.tpl
  endif
  if header >= 2
    call Replace('/*', '**', '*/')
    normal 2G3W
  endif
endfun

function HeaderWWWNew()
  let header = confirm("Use default structure?", "&Yes\n&No")
  if header == 1
    0r ~/.vim/skel/index.tpl
    call Replace('/*', '**', '*/')
    normal 2G3W
  endif
endfun

function HeaderUpdate()
  let linenb = line(".")
  let n = search('Last update')
  if (n > 0) && (n< 10)
    execute "1,10 s,\\(Last update \\).*,\\1" . strftime("%c") . " " . g:login_epita . ","
  endif
  execute ":" . linenb
endfun

function MakefileNew()
  let makefile = confirm("Use default makefile?", "&None\n&Default")
  if makefile == 2
    0r ~/.vim/skel/Makefile.tpl
  endif
endfun

au BufNewFile,BufRead *.doxygen setfiletype doxygen

"set laststatus=2
"if version >= 700
"   au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl 
"guisp=Magenta
"   au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 
"gui=bold,reverse
"endif
