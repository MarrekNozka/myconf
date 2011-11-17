" Nastaveni pro python


command! Go write | make
set makeprg=./%
map ,,go <Esc>:Go<Return>
imap ,,go <Esc>,,go
