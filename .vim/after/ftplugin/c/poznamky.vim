
"poznámka /*  */
imap <Leader>/ //<Esc>i**  <Esc>i
map <Leader>/ i//<Esc>i**  <Esc>i
" z aktuálního bloku vytvoří poznámku
map <Leader>c my(I/*<C-O>)*/<Esc>`y
imap <Leader>c <Esc><Leader>ca
" z označeného bloku vytvoří poznámku
vmap <Leader>c <Esc>`>a*/<Esc>`<i/*<Esc>
" od-poznámkuje aktuální poznámku
map <Leader>C my?\/\*<Return>xx/\*\/<Return>xx`y
imap <Leader>C <Esc><Leader>Ca
imap <Leader>C <Esc>my?\/\*<Return>xx/\*\/<Return>xx`y
"vymaže všechny jednořádkové komentáře
command! VymazPoznamky %s/\/\/.*$//g | %s/\/\*.*\*\///g

