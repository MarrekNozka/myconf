"makra pro Vim k editaci zdrojových textů LaTeXu
"Pavel Satrapa & spol., 1. července 2001
"--------------------------------------------------------------------------
"písma
imap ,tt \texttt{}
vmap ,tt <Esc>`>a}<Esc>`<i\texttt{<Esc>%
imap ,ee \emph{}
vmap ,ee <Esc>`>a}<Esc>`<i\emph{<Esc>%
imap ,bb \textbf{}
vmap ,bb <Esc>`>a}<Esc>`<i\textbf{<Esc>%

"uzavření do uvozovek
imap ,uv \uv{}<Left>
vmap ,uv <Esc>`>a}<Esc>`<i\uv{<Esc>%

"prostředí
imap ,cen \begin{center}<CR><CR>\end{center}<Up>
vmap ,cen <Esc>`>a\end{center}<Esc>`<i\begin{center}<Esc>F\
imap ,quo \begin{quote}<CR><CR>\end{quote}<Up>
vmap ,quo <Esc>`>a\end{quote}<Esc>`<i\begin{quote}<Esc>F\
imap ,tab \begin{tabular}{ll}<CR><CR>\end{tabular}<Up>
imap ,ver \begin{verbatim}<CR><CR>\end{verbatim}<Up>
vmap ,ver <Esc>`>a\end{verbatim}<Esc>`<i\begin{verbatim}<Esc>F\
imap ,qv \begin{quote}\begin{verbatim}<CR><CR>\end{verbatim}\end{quote}<Up>
vmap ,qv <Esc>`>a\end{verbatim}\end{quote}<Esc>`<i\begin{quote}\begin{verbatim}<Esc>2F\

"plovoucí objekty
imap ,tbl \begin{table}[htp]<CR><CR>\caption{}<CR>\label{}<CR>\end{table}<C-O>3k
vmap ,tbl <Esc>`>a<CR>\caption{}<CR>\label{}<CR>\end{table}<Esc>`<i\begin{table}[htp]<CR><Esc><Up>
imap ,fig \begin{figure}[htp]<CR><CR>\caption{}<CR>\label{}<CR>\end{figure}<C-O>3k
vmap ,fig <Esc>`>a<CR>\caption{}<CR>\label{}<CR>\end{figure}<Esc>`<i\begin{figure}[htp]<CR><Esc><Up>

"uzavření; napište \begin{cosi} a použijte ,.
imap ,. <Esc>F{lyt}f}a\end{}<Esc>PF\i
imap ,: vbyi\begin{ea}o\end{pa}O

"poskakuje před (\) a za (}) TeXovské konstrukce
map <M-Right> f}
imap <M-Right> <C-O>f}<Right>
map <M-Left> F\
imap <M-Left> <C-O>F\
