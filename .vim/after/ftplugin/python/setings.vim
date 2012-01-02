" Nastaveni pro python

" Go
map ,,go <Esc>:write \| !python %<Return>
imap ,,go <Esc><Leader>go

" Makej
command! Make write | make %<
map <Leader>ma :Make<Return>
imap <Leader>ma <Esc>:Make<Return>

map <Leader>Ma :write\|make<Return>

