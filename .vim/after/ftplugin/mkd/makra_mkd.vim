" Makra pro Markdown
"


" zkratka
map <Leader>oo i[[! ]]()<Esc>hhhha
imap <Leader>oo [[! ]]()<Esc>hhhha

" wikipedia
map <Leader>wk i[[!wkcz ]]()<Esc>hhha
imap <Leader>wk [[!wkcz ]]()<Esc>hhha
vmap <Leader>wk <Esc>`>a]]()<Esc>`<i[[!wkcz 

" obrázek
map <Leader>ob i![<C-O>a](<C-O>a)<Esc>ha
imap <Leader>ob ![<C-O>a](<C-O>a)<Esc>ha
" odkaz
map <Leader>od i[<C-O>a](<C-O>a)<Esc>hh
imap <Leader>od [<C-O>a](<C-O>a)<Esc>hhi
vmap <Leader>od <Esc>`>a]()<Esc>`<i[<Esc>`>3l

map <Leader>co i[[!code ]]()<Esc>hhha<Return><Esc>kA
imap <Leader>co [[!code ]]()<Esc>hhha<Return><Esc>kA
map <Leader>py i[[!code ]]()<Esc>hhha<Return><Esc>kApython<Return>
imap <Leader>py [[!code ]]()<Esc>hhha<Return><Esc>kApython<Return>
