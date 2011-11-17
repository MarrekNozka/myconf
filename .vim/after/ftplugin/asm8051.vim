" Nastaveni VIMu pro jazyk ASM8051
""""""""""""""""""""""""""""""""

" Makej
command! Make write | make %<.hex
map <Leader>ma :Make<Return>
imap <Leader>ma <Esc>:Make<Return>

map <Leader>Ma :write\|make<Return>
"imap <Leader>Ma <Esc><Leader>Ma

set nospell
set nowrap
