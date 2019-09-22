"menu pro Vim pro editaci HTML textů
"Pavel Satrapa & spol., 1. července 2001
"--------------------------------------------------------------------------
imenu &HTML.Písmo.zvýrazněné\ (kurzíva) <EM></EM><C-O>F<
vmenu &HTML.Písmo.zvýrazněné\ (kurzíva) <Esc>`>a</EM><Esc>`<i<EM><Esc>
imenu &HTML.Písmo.tučné <STRONG></STRONG><C-O>F<
vmenu &HTML.Písmo.tučné <Esc>`>a</STRONG><Esc>`<i<STRONG><Esc>
imenu &HTML.Písmo.neproporcionální\ (psací\ stroj) <CODE></CODE><C-O>F<
vmenu &HTML.Písmo.neproporcionální\ (psací\ stroj) <Esc>`>a</CODE><Esc>`<i<CODE><Esc>
imenu &HTML.Písmo.-SEP1- :
imenu &HTML.Písmo.Větší <BIG></BIG><C-O>F<
vmenu &HTML.Písmo.Větší <Esc>`>a</BIG><Esc>`<i<BIG><Esc>
imenu &HTML.Písmo.Menší <SMALL></SMALL><C-O>F<
vmenu &HTML.Písmo.Menší <Esc>`>a</SMALL><Esc>`<i<SMALL><Esc>
imenu &HTML.Písmo.-SEP2- :
imenu &HTML.Písmo.Horní\ index <SUP></SUP><C-O>F<
vmenu &HTML.Písmo.Horní\ index <Esc>`>a</SUP><Esc>`<i<SUP><Esc>
imenu &HTML.Písmo.Dolní\ index <SUB></SUB><C-O>F<
vmenu &HTML.Písmo.Dolní\ index <Esc>`>a</SUB><Esc>`<i<SUB><Esc>
imenu &HTML.Písmo.-SEP3- :
imenu &HTML.Písmo.Barevné <FONT COLOR="#"></FONT><C-O>F"
vmenu &HTML.Písmo.Barevné <Esc>`>a</FONT><Esc>`<i<FONT COLOR="#"><Left><Left>
"--------------------------------------------------------------------------
imenu &HTML.Nadpis.H1 <H1></H1><C-O>F<
vmenu &HTML.Nadpis.H1 <Esc>`>a</H1><Esc>`<i<H1><Esc>
imenu &HTML.Nadpis.H2 <H2></H2><C-O>F<
vmenu &HTML.Nadpis.H2 <Esc>`>a</H2><Esc>`<i<H2><Esc>
imenu &HTML.Nadpis.H3 <H3></H3><C-O>F<
vmenu &HTML.Nadpis.H3 <Esc>`>a</H3><Esc>`<i<H3><Esc>
imenu &HTML.Nadpis.H4 <H4></H4><C-O>F<
vmenu &HTML.Nadpis.H4 <Esc>`>a</H4><Esc>`<i<H4><Esc>
imenu &HTML.Nadpis.H5 <H5></H5><C-O>F<
vmenu &HTML.Nadpis.H5 <Esc>`>a</H5><Esc>`<i<H5><Esc>
imenu &HTML.Nadpis.H6 <H6></H6><C-O>F<
vmenu &HTML.Nadpis.H6 <Esc>`>a</H6><Esc>`<i<H6><Esc>
"--------------------------------------------------------------------------
imenu &HTML.Formátování\ textu.Seznam\ s\ odrážkami <UL><CR><CR></UL><Up><LI>
imenu &HTML.Formátování\ textu.Seznam\ číslovaný <OL><CR><CR></OL><Up><LI>
imenu &HTML.Formátování\ textu.Seznam\ s\ nadpisy <DL><CR><CR></DL><Up><DT><CR>    <DD><Up>
imenu &HTML.Formátování\ textu.Položka\ seznamu\ UL/OL <LI>
imenu &HTML.Formátování\ textu.Položka\ seznamu\ se\ jménem <DT><CR>    <DD><Up>
imenu &HTML.Formátování\ textu.-SEP1- :
imenu &HTML.Formátování\ textu.Odsazený <BLOCKQUOTE><CR><CR></BLOCKQUOTE><Up>
imenu &HTML.Formátování\ textu.Centrovaný <DIV ALIGN="CENTER"><CR><CR></DIV><Up>
imenu &HTML.Formátování\ textu.Na\ prapor\ vlevo <DIV ALIGN="LEFT"><CR><CR></DIV><Up>
imenu &HTML.Formátování\ textu.Na\ prapor\ vpravo <DIV ALIGN="RIGHT"><CR><CR></DIV><Up>
imenu &HTML.Formátování\ textu.-SEP2- :
imenu &HTML.Formátování\ textu.Předformátovaný\ (PRE) <PRE><CR><CR></PRE><Up>
"--------------------------------------------------------------------------
imenu &HTML.Tabulka/Obrázek.Základní\ tabulka <TABLE BORDER="0"><CR><TR><TD></TD><TD></TD></TR><CR></TABLE><Esc>k02f>a
imenu &HTML.Tabulka/Obrázek.Obrázek <IMG SRC="" ALT="" WIDTH="" HEIGHT="" BORDER="0"><C-O>9F"
"--------------------------------------------------------------------------
imenu &HTML.Odkaz.Návěstí <A NAME=""></A><C-O>F"
vmenu &HTML.Odkaz.Návěstí <Esc>`>a</A><Esc>`<i<A NAME=""><Left><Left>
imenu &HTML.Odkaz.Odkaz <A HREF=""></A><C-O>F"
vmenu &HTML.Odkaz.Odkaz <Esc>`>a</A><Esc>`<i<A HREF=""><Left><Left>
"--------------------------------------------------------------------------
imenu &HTML.Symbol.Nezlomitelná\ mezera &nbsp;
imenu &HTML.Symbol.Ampersand &amp;
imenu &HTML.Symbol.Menší\ než &lt;
imenu &HTML.Symbol.Větší\ než &gt;
