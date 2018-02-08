" Vim syntax file
" Language:         Moodle GIFT (General Import Format Template)
" Maintainer:       Clinton McKay
" Latest Revision:  21 February 2015

if exists("b:current_syntax")
  finish
endif

let conceallevel = 1

syntax spell toplevel

"------------------------------------------------------------------------/
" GIFT Comments
"------------------------------------------------------------------------/
syn keyword giftTodo      containedin=giftComment contained TODO FIXME XXX NOTE
syn match   giftComment   "\/\/.*$" contains=giftTodo
syn match   giftFormat    "\[.\{-}\]" conceal cchar=⥊ containedin=giftProblem
syn match   giftTitle     /^::.\{-}::/ containedin=giftProblem

"------------------------------------------------------------------------/
" GIFT blocks 
"------------------------------------------------------------------------/
syn region giftProblem start=/^::/hs=s+1 end=/}/ skip='\\}' keepend contains=giftAnswers
syn region giftAnswers start='{'         end=/}/he=e-1 skip='\\}' keepend concealends
  \ containedin=giftProblem contains=giftFormat
syn region giftCorrect   start='='   end=/\(\s*\)\+[~]/he=e-1  skip='\\\~|\\\='
  \ containedin=giftAnswers contains=giftFormat
syn region giftIncorrect start='[~]'   end=/\(\s*\)\+[=]/he=e-1  skip='\\\~|\\\='
  \ containedin=giftAnswers contains=giftFormat

"------------------------------------------------------------------------/
" Setup syntax highlighting
"------------------------------------------------------------------------/
let b:current_syntax = "gift"

hi def link giftComment     Comment
hi def link giftTodo        Todo
hi def link giftTitle       Title
hi def link giftAnswers     MoreMsg
hi def link giftProblem     ModeMsg
hi def link giftCorrect     Identifier 
hi def link giftIncorrect   Constant
hi def link giftFormat      LineNr


