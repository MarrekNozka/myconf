

set makeprg=fpc\ -Mobjfpc\ %
command! Goo write | !fpc -g -B -Mobjfpc % && ./$(basename % .pas)
map ,go :Go
imap ,go :Go
set nospell
set nowrap

let pascal_delphi=1
let pascal_fpc = 1
let pascal_symbol_operator = 1
let pascal_one_line_string = 1

command! Unit 0,$d | 0r ~/.vim/sablony/pascal-unit.pas
