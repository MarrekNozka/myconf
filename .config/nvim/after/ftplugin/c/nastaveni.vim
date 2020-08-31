" Nastaveni VIMu pro jazyk C 
""""""""""""""""""""""""""""""""
"
"set autoread

" Makej
"command! Make write | make %<
command! Make write | make flash
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

set nospell
set nowrap

set keywordprg=urxvt\ -e\ man\ 3


let g:ycm_show_diagnostics_ui = 0

