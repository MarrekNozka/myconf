" Nastaveni pro python

" Go
"map <leader>go <Esc>:write \| :silent !urxvtcd -e p2or3 "%" &<Return>
"imap <leader>go <Esc><leader>goa
"map <F12> <leader>go
"imap <F12> <leader>go
"map ,,Go <Esc>:write \| :silent !urxvtcd -e p2or3 -i "%" &<Return>
"imap ,,Go <Esc><leader>Goa
"map <C-F12> <leader>Go
"imap <C-F12> <leader>Go
 
compiler pyunit
set makeprg=python3\ %

" Makej
command! Make write | make %<
map <Leader>ma :Make<Return>
imap <Leader>ma <Esc>:Make<Return>

map <Leader>Ma :write\|make<Return>

syn match pythonBoolean "\(\W\|^\)\@<=self\(\.\)\@="
syn match pythonBoolean "\(\W\|^\)\zsself\ze\."

set  equalprg=autopep8\ -
set formatprg=autopep8\ -

" formátování "odstavce"
map <Leader><Return> my][%gq%`y
imap <Leader><Return> <Esc><Leader><Return>

" formátování celého souboru
map <Leader>g<Return> mygggqG`y
imap <Leader>g<Return> <Esc><Leader><Return>


" Jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "2"
