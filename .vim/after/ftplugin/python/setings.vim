" Nastaveni pro python

" Go
map <leader>go <Esc>:write \| :silent !urxvtcd -e p2or3 "%" &<Return>
imap <leader>go <Esc><leader>goa
map <F12> <leader>go
imap <F12> <leader>go
map ,,Go <Esc>:write \| :silent !urxvtcd -e p2or3 -i "%" &<Return>
imap ,,Go <Esc><leader>Goa
map <C-F12> <leader>Go
imap <C-F12> <leader>Go

" Makej
command! Make write | make %<
map <Leader>ma :Make<Return>
imap <Leader>ma <Esc>:Make<Return>

map <Leader>Ma :write\|make<Return>

