""
"" leopard.vim for vim-syntax in /u/a1/sigour_b/.vim/syntax
""
"" Made by SIGOURE Benoit
"" Login   <sigour_b@epita.fr>
""
"" Started on  Sat Jan  7 20:11:05 2006 SIGOURE Benoit
"" Last update Wed Mar  8 14:23:09 2006 SIGOURE Benoit
""

" Vim syntax file based on the C syntax file by Bram Moolenaar <Bram@vim.org>

" INSTALL instructions:
" install leopard-ftdetect.vim
" $ mkdir -p ~/.vim/syntax
" $ cp leopard-syntax.vim ~/.vim/syntax

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" A bunch of useful Leopard keywords
syn keyword	leopardStatement		break let in end of
syn keyword	leopardConditional	if then else
syn keyword	leopardRepeat		while for to do

syn keyword	leopardTodo		contained TODO FIXME XXX NOTE[S]

" leopardCommentGroup allows adding matches for special things in comments
syn cluster	leopardCommentGroup	contains=leopardTodo

" String constants (Note: there is no character constants in Leopard)
" Highlight special characters (those which have a backslash) differently
syn match	leopardSpecial		display contained "\\\(x\x\{2}\|\o\{3}\|a\|b\|f\|n\|r\|t\|v\|\\\|\"\)"
" Highlight invalid escapes
syn match	leopardSpecialError	display contained "\\[^0-9abfnrtvx\\\"]"
syn match	leopardSpecialError	display contained "\\x[^0-9a-fA-F]"
syn match	leopardSpecialError	display contained "\\x\x[^0-9a-fA-F]"
syn region	leopardString		start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=leopardSpecial,leopardSpecialError,Spell

syn match	leopardSpaceError		display excludenl "\s\+$"
syn match	leopardSpaceError		display " \+\t"me=e-1

"catch errors caused by wrong parenthesis and brackets
syn cluster	leopardParenGroup		contains=leopardParenError,leopardSpecial,leopardSpecialError,leopardCommentGroup,leopardNumber,leopardNumbersCom
syn region	leopardParen		transparent start='(' end=')' contains=ALLBUT,@leopardParenGroup,leopardErrInBracket,Spell
syn match	leopardParenError		display "[\])]"
syn match	leopardErrInParen		display contained "[\]]"
syn region	leopardBracket		transparent start='\[' end=']' contains=ALLBUT,@leopardParenGroup,leopardErrInParen,Spell
syn match	leopardErrInBracket	display contained "[);{}]"

" integer number (Note: octal or hexadecimal literals don't exist in Leopard.)
"                (Numbers starting with a 0 are not considered in a special way)
syn case ignore
syn match	leopardNumbers		display transparent "\<\d\|\.\d" contains=leopardNumber
" Same, but without octal error (for comments)
syn match	leopardNumbersCom		display contained transparent "\<\d\|\.\d" contains=leopardNumber
syn match	leopardNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn case match

syn region	leopardComment		matchgroup=leopardCommentStart start="/\*" end="\*/" contains=@leopardCommentGroup,leopardComment,@Spell

syn keyword	leopardType		int string

syn keyword	leopardStructure	type array class extends
syn keyword	leopardStorageClass	var
syn keyword	leopardDecl		function primitive
syn keyword	leopardImport		import
syn keyword	leopardNil		nil
syn keyword	leopardBuiltin		chr concat exit flush getchar not ord print print_err print_int size strcmp streq substring

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_leopard_syn_inits")
  if version < 508
    let did_leopard_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink leopardCommentL		leopardComment
  HiLink leopardCommentStart	leopardComment
  HiLink leopardConditional	Conditional
  HiLink leopardRepeat		Repeat
  HiLink leopardNumber		Number
  HiLink leopardParenError	leopardError
  HiLink leopardErrInParen	leopardError
  HiLink leopardErrInBracket	leopardError
  HiLink leopardSpaceError	leopardError
  HiLink leopardSpecialError	leopardError
  HiLink leopardStructure		Structure
  HiLink leopardStorageClass	StorageClass
  HiLink leopardDefine		Macro
  HiLink leopardError		Error
  HiLink leopardStatement		Statement
  HiLink leopardType		Type
  HiLink leopardConstant		Constant
  HiLink leopardString		String
  HiLink leopardComment		Comment
  HiLink leopardSpecial		SpecialChar
  HiLink leopardTodo		Todo
  HiLink leopardDecl		Type
  HiLink leopardImport            Include
  HiLink leopardNil               Constant
  HiLink leopardBuiltin		Define

  delcommand HiLink
endif

let b:current_syntax = "leopard"

" vim: ts=8
