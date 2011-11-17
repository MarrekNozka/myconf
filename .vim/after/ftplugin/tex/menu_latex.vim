"menu pro Vim pro editaci zdrojových textů LaTeXu
"Pavel Satrapa & spol., 1. července 2001
"--------------------------------------------------------------------------
imenu &LaTeX.Písmo.zvýrazněné\ (kurzíva) \emph{}
vmenu &LaTeX.Písmo.zvýrazněné\ (kurzíva) <Esc>`>a}<Esc>`<i\emph{<Esc>%
imenu &LaTeX.Písmo.-SEP1- :
imenu &LaTeX.Písmo.tučné \textbf{}
vmenu &LaTeX.Písmo.tučné <Esc>`>a}<Esc>`<i\textbf{<Esc>%
imenu &LaTeX.Písmo.neproporcionální\ (psací\ stroj) \texttt{}
vmenu &LaTeX.Písmo.neproporcionální\ (psací\ stroj) <Esc>`>a}<Esc>`<i\texttt{<Esc>%
imenu &LaTeX.Písmo.kapitálky \textsc{}
vmenu &LaTeX.Písmo.kapitálky <Esc>`>a}<Esc>`<i\textsc{<Esc>%
imenu &LaTeX.Písmo.skloněné \textsl{}
vmenu &LaTeX.Písmo.skloněné <Esc>`>a}<Esc>`<i\textsl{<Esc>%
imenu &LaTeX.Písmo.-SEP2- :
imenu &LaTeX.Písmo.tiny<Tab>(nejmenší) \tiny 
vmenu &LaTeX.Písmo.tiny<Tab>(nejmenší) <Esc>`>a}<Esc>`<i{\tiny <Esc>F{%
imenu &LaTeX.Písmo.scriptsize \scriptsize 
vmenu &LaTeX.Písmo.scriptsize <Esc>`>a}<Esc>`<i{\scriptsize <Esc>F{%
imenu &LaTeX.Písmo.footnotesize \footnotesize 
vmenu &LaTeX.Písmo.footnotesize <Esc>`>a}<Esc>`<i{\footnotesize <Esc>F{%
imenu &LaTeX.Písmo.small \small 
vmenu &LaTeX.Písmo.small <Esc>`>a}<Esc>`<i{\small <Esc>F{%
imenu &LaTeX.Písmo.normalsize<Tab>(normální) \normalsize 
vmenu &LaTeX.Písmo.normalsize<Tab>(normální) <Esc>`>a}<Esc>`<i{\normalsize <Esc>F{%
imenu &LaTeX.Písmo.large \large 
vmenu &LaTeX.Písmo.large <Esc>`>a}<Esc>`<i{\large <Esc>F{%
imenu &LaTeX.Písmo.Large \Large 
vmenu &LaTeX.Písmo.Large <Esc>`>a}<Esc>`<i{\Large <Esc>F{%
imenu &LaTeX.Písmo.LARGE \LARGE 
vmenu &LaTeX.Písmo.LARGE <Esc>`>a}<Esc>`<i{\LARGE <Esc>F{%
imenu &LaTeX.Písmo.huge \huge 
vmenu &LaTeX.Písmo.huge <Esc>`>a}<Esc>`<i{\huge <Esc>F{%
imenu &LaTeX.Písmo.Huge<Tab>(největší) \Huge 
vmenu &LaTeX.Písmo.Huge<Tab>(největší) <Esc>`>a}<Esc>`<i{\Huge <Esc>F{%
"--------------------------------------------------------------------------
imenu &LaTeX.Nadpis.Část \part{}
vmenu &LaTeX.Nadpis.Část <Esc>`>a}<Esc>`<i\part{<Esc>%
imenu &LaTeX.Nadpis.Kapitola \chapter{}
vmenu &LaTeX.Nadpis.Kapitola <Esc>`>a}<Esc>`<i\chapter{<Esc>%
imenu &LaTeX.Nadpis.Kapitolka \section{}
vmenu &LaTeX.Nadpis.Kapitolka <Esc>`>a}<Esc>`<i\section{<Esc>%
imenu &LaTeX.Nadpis.Podkapitolka \subsection{}
vmenu &LaTeX.Nadpis.Podkapitolka <Esc>`>a}<Esc>`<i\subsection{<Esc>%
imenu &LaTeX.Nadpis.Podpodkapitolka \subsubsection{}
vmenu &LaTeX.Nadpis.Podpodkapitolka <Esc>`>a}<Esc>`<i\subsubsection{<Esc>%
imenu &LaTeX.Nadpis.Odstavec \paragraph{}
vmenu &LaTeX.Nadpis.Odstavec <Esc>`>a}<Esc>`<i\paragraph{<Esc>%
imenu &LaTeX.Nadpis.Pododstavec \subparagraph{}
vmenu &LaTeX.Nadpis.Pododstavec <Esc>`>a}<Esc>`<i\subparagraph{<Esc>%
imenu &LaTeX.Nadpis.-SEP1- :
imenu &LaTeX.Nadpis.Část* \part*{}
vmenu &LaTeX.Nadpis.Část* <Esc>`>a}<Esc>`<i\part*{<Esc>%
imenu &LaTeX.Nadpis.Kapitola* \chapter*{}
vmenu &LaTeX.Nadpis.Kapitola* <Esc>`>a}<Esc>`<i\chapter*{<Esc>%
imenu &LaTeX.Nadpis.Kapitolka* \section*{}
vmenu &LaTeX.Nadpis.Kapitolka* <Esc>`>a}<Esc>`<i\section*{<Esc>%
imenu &LaTeX.Nadpis.Podkapitolka* \subsection*{}
vmenu &LaTeX.Nadpis.Podkapitolka* <Esc>`>a}<Esc>`<i\subsection*{<Esc>%
imenu &LaTeX.Nadpis.Podpodkapitolka* \subsubsection*{}
vmenu &LaTeX.Nadpis.Podpodkapitolka* <Esc>`>a}<Esc>`<i\subsubsection*{<Esc>%
imenu &LaTeX.Nadpis.Odstavec* \paragraph*{}
vmenu &LaTeX.Nadpis.Odstavec* <Esc>`>a}<Esc>`<i\paragraph*{<Esc>%
imenu &LaTeX.Nadpis.Pododstavec* \subparagraph*{}
vmenu &LaTeX.Nadpis.Pododstavec* <Esc>`>a}<Esc>`<i\subparagraph*{<Esc>%
"--------------------------------------------------------------------------
imenu &LaTeX.Formátování\ textu.Seznam\ s\ odrážkami\ (itemize) \begin{itemize}<CR>\item <CR>\item <CR>\item <CR>\end{itemize}<Up><Up><Up>
imenu &LaTeX.Formátování\ textu.Seznam\ číslovaný\ (enumerate) \begin{enumerate}<CR>\item <CR>\item <CR>\item <CR>\end{enumerate}<Up><Up><Up>
imenu &LaTeX.Formátování\ textu.Seznam\ s\ nadpisy\ (description) \begin{description}<CR>\item[] <CR>\item[] <CR>\item[] <CR>\end{description}<Up><Up><Up>
imenu &LaTeX.Formátování\ textu.Položka\ seznamu \item 
imenu &LaTeX.Formátování\ textu.Položka\ seznamu\ se\ jménem \item[] 
imenu &LaTeX.Formátování\ textu.-SEP1- :
imenu &LaTeX.Formátování\ textu.Odsazený\ krátký \begin{quote}<CR><CR>\end{quote}<Up>
imenu &LaTeX.Formátování\ textu.Odsazený\ dlouhý \begin{quotation}<CR><CR>\end{quotation}<Up>
imenu &LaTeX.Formátování\ textu.Centrovaný \begin{center}<CR><CR>\end{center}<Up>
imenu &LaTeX.Formátování\ textu.Na\ prapor\ vlevo \begin{flushleft}<CR><CR>\end{flushleft}<Up>
imenu &LaTeX.Formátování\ textu.Na\ prapor\ vpravo \begin{flushright}<CR><CR>\end{flushright}<Up>
imenu &LaTeX.Formátování\ textu.-SEP2- :
imenu &LaTeX.Formátování\ textu.Předformátovaný\ (opis\ vstupu,\ verbatim) \begin{verbatim}<CR><CR>\end{verbatim}<Up>
imenu &LaTeX.Formátování\ textu.Krátký\ opis\ vstupu\ (verb) \verb''<Left>
"--------------------------------------------------------------------------
imenu &LaTeX.Tabulka/Obrázek.Základní\ tabulka \begin{tabular}{lll}<CR><CR>\end{tabular}<Up> &  &  \\<Home>
imenu &LaTeX.Tabulka/Obrázek.Plovoucí\ tabulka \begin{table}[htp]<CR><CR>\caption{}<CR>\end{table}<Up><Up>
imenu &LaTeX.Tabulka/Obrázek.-SEP1- :
imenu &LaTeX.Tabulka/Obrázek.Vícesloupcová\ buňka \multicolumn{2}{l}{}
imenu &LaTeX.Tabulka/Obrázek.Čára\ přes\ několik\ sloupců \cline{-}<Left><Left>
imenu &LaTeX.Tabulka/Obrázek.Čára\ přes\ celou\ tabulku \hline<CR>
imenu &LaTeX.Tabulka/Obrázek.-SEP2- :
imenu &LaTeX.Tabulka/Obrázek.Plovoucí\ obrázek \begin{figure}[htp]\begin{center}<CR>\includegraphics[width=0.9\textwidth]{}<Right><CR>\caption{}<Right><CR>\label{}<Right><CR>\end{center}\end{figure}kkk$i
imenu &LaTeX.Tabulka/Obrázek.Vložit\ obrázek\ (soubor) \includegraphics{}
"--------------------------------------------------------------------------
imenu &LaTeX.Rejstřík\ a\ obsah.Heslo\ do\ rejstříku<Tab>\\index \index{}
vmenu &LaTeX.Rejstřík\ a\ obsah.Heslo\ do\ rejstříku<Tab>\\index y`<i\index{}<Esc>P<Right>
imenu &LaTeX.Rejstřík\ a\ obsah.Heslo\ do\ rejstříku,\ začátek \index{\|(}<Left><Left><Left>
vmenu &LaTeX.Rejstřík\ a\ obsah.Heslo\ do\ rejstříku,\ začátek y`<i\index{\|(}<Esc>T{Pf}
imenu &LaTeX.Rejstřík\ a\ obsah.Heslo\ do\ rejstříku,\ konec \index{\|)}<Left><Left><Left>
vmenu &LaTeX.Rejstřík\ a\ obsah.Heslo\ do\ rejstříku,\ konec y`<i\index{\|)}<Esc>T{Pf}
imenu &LaTeX.Rejstřík\ a\ obsah.Heslo\ do\ rejstříku,\ tučně \index{\|textbf}T{
vmenu &LaTeX.Rejstřík\ a\ obsah.Heslo\ do\ rejstříku,\ tučně y`<i\index{\|textbf}<Esc>T{Pf}
imenu &LaTeX.Rejstřík\ a\ obsah.Vysázet\ rejstřík %nezapomeňte před \begin{document} vložit:<CR>%\RequirePackage{makeidx}<CR>%\makeindex<CR>\printindex
imenu &LaTeX.Rejstřík\ a\ obsah.-SEP1- :
imenu &LaTeX.Rejstřík\ a\ obsah.Obsah \tableofcontents<CR>
imenu &LaTeX.Rejstřík\ a\ obsah.Seznam\ obrázků \listoffigures<CR>
imenu &LaTeX.Rejstřík\ a\ obsah.Seznam\ tabulek \listoftables<CR>
imenu &LaTeX.Rejstřík\ a\ obsah.Přidat\ řádek\ obsahu \addcontentsline{toc}{section}{}
imenu &LaTeX.Rejstřík\ a\ obsah.Přidat\ do\ obsahu \addtocontents{toc}{}
"--------------------------------------------------------------------------
imenu &LaTeX.Odkaz.Návěstí \label{}
vmenu &LaTeX.Odkaz.Návěstí y`<i\label{}<Esc>P<Right>
imenu &LaTeX.Odkaz.Odkaz \ref{}
imenu &LaTeX.Odkaz.Odkaz\ na\ stránku \pageref{}
"--------------------------------------------------------------------------
imenu &LaTeX.Matematika.Vzorec\ v\ řádku $  $<Left><Left>
imenu &LaTeX.Matematika.Vzorec\ samostatný $$  $$<Left><Left><Left>
imenu &LaTeX.Matematika.Vzorec\ číslovaný \begin{equation}<CR><CR>\end{equation}<Up>
imenu &LaTeX.Matematika.Vzorec\ několik\ číslovaných \begin{eqnarray}<CR><CR>\end{eqnarray}<Up> &  &  \\<C-O>0
imenu &LaTeX.Matematika.-SEP1- :
imenu &LaTeX.Matematika.Zlomek \frac{}<Right>{}<Left><Left>
imenu &LaTeX.Matematika.Odmocnina \sqrt{}
imenu &LaTeX.Matematika.Třetí\ odmocnina \sqrt[3]{}
imenu &LaTeX.Matematika.Suma \sum_{}<Right>^{}<Left><Left><Left>
imenu &LaTeX.Matematika.Produkce \prod_{}<Right>^{}<Left><Left><Left>
imenu &LaTeX.Matematika.Matice \left( \begin{array}{ccc}<CR><CR>\end{array} \right)<Up> &  &  \\<C-O>0
"--------------------------------------------------------------------------
imenu &LaTeX.Vložit.Uvozovky \uv{}
vmenu &LaTeX.Vložit.Uvozovky <Esc>`>a}<Esc>`<i\uv{<Esc>%
imenu &LaTeX.Vložit.-SEP1- :
imenu &LaTeX.Vložit.Poznámku\ pod\ čarou \footnote{}
imenu &LaTeX.Vložit.Poznámku\ na\ okraj \marginpar{}
imenu &LaTeX.Vložit.-SEP2- :
imenu &LaTeX.Vložit.Doporučený\ konec\ stránky \pagebreak[3]
imenu &LaTeX.Vložit.Konec\ stránky \newpage
imenu &LaTeX.Vložit.Konec\ stránky\ a\ plovoucí\ objekty \clearpage
imenu &LaTeX.Vložit.-SEP3- :
imenu &LaTeX.Vložit.Mezeru.Čtverčík \quad
imenu &LaTeX.Vložit.Mezeru.Dva\ čtverčíky \qquad
imenu &LaTeX.Vložit.Mezeru.Vodorovnou \hspace{}
imenu &LaTeX.Vložit.Mezeru.Vodorovnou\ povinnou \hspace*{}
imenu &LaTeX.Vložit.Mezeru.Vodorovnou\ nekonečnou \hfill
imenu &LaTeX.Vložit.Mezeru.-SEP1- :
imenu &LaTeX.Vložit.Mezeru.Malou\ svislou \smallskip<CR>
imenu &LaTeX.Vložit.Mezeru.Střední\ svislou \medskip<CR>
imenu &LaTeX.Vložit.Mezeru.Velkou\ svislou \bigskip<CR>
imenu &LaTeX.Vložit.Mezeru.Svislou \vspace{}
imenu &LaTeX.Vložit.Mezeru.Svislou\ povinnou \vspace*{}
imenu &LaTeX.Vložit.Mezeru.Svislou\ nekonečnou \vfill
imenu &LaTeX.Vložit.Symbol.Tři\ tečky {\ldots}
imenu &LaTeX.Vložit.Symbol.Paragraf {\S}
imenu &LaTeX.Vložit.Symbol.Copyright {\copyright}
imenu &LaTeX.Vložit.Symbol.Stupeň $^\circ$
imenu &LaTeX.Vložit.Datum {\today}
imenu &LaTeX.Vložit.Logo\ TeX {\TeX}
imenu &LaTeX.Vložit.Logo\ La\.TeX {\LaTeX}


