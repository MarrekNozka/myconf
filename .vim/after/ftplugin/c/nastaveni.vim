" Nastaveni VIMu pro jazyk C 
""""""""""""""""""""""""""""""""
"
"set autoread

" Makej
command! Make write | make %<
map <Leader>ma :Make<Return>
imap <Leader>ma <Esc>:Make<Return>

map <Leader>Ma :write\|make<Return>
"imap <Leader>Ma <Esc><Leader>Ma

"Spusť nejmladší spustitelný soubor
command! Run !./$(/bin/ls -t | head -1)
map <Leader>ru :Run<Return>
imap <Leader>ru <Esc>:Run<Return>

"Go go
"set makeprg=easymake\ %
command! Go write | !easymake %
map <Leader>go :Go<Return>
imap <Leader>go <Esc>:Go<Return>

"indent aktuální funkce
set formatprg=indent
map <Leader><Return> my[[gq]]`y
imap <Leader><Return> <Esc><Leader><Return>
" indent celého souboru
map <Leader>g<Return> mygggqG`y
imap <Leader>g<Return> <Esc><Leader><Return>

set nospell
set nowrap

set keywordprg=urxvt\ -e\ man\ 3

