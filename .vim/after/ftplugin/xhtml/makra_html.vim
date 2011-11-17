",makra pro Vim k editaci HTML textů
"Pavel Satrapa & spol., 1. července 2001
"upravil Marek Nožka
"--------------------------------------------------------------------------
"entity
imap ,sp &nbsp;
imap ,,<space> &nbsp;
imap ,,< &lt;
imap ,,> &gt;

"poznámky
imap ,,/ <>!--  --<Esc>hhi

"značka
imap <> <>i
imap >< </>i
"posun před/za značku
map <M-Right> f>
imap <M-Right> <C-O>f><Right>
map <M-Left> F<
imap <M-Left> <C-O>F<

"písma
imap ,,t <code> <BS></code><C-O>F<
vmap ,,t <Esc>`>a</code><Esc>`<i<code><Esc>
imap ,,e <em> <BS></em><C-O>F<
vmap ,,e <Esc>`>a</em><Esc>`<i<em><Esc>
imap ,,b <strong> <BS></strong><C-O>F<
vmap ,,b <Esc>`>a</strong><Esc>`<i<strong><Esc>

imap ,,1 <h1> <BS></h1><C-O>F<
vmap ,,1 <Esc>`>a</h1><Esc>`<i<h1><Esc>
imap ,,2 <h2> <BS></h2><C-O>F<
vmap ,,2 <Esc>`>a</h2><Esc>`<i<h2><Esc>
imap ,,3 <h3> <BS></h3><C-O>F<
vmap ,,3 <Esc>`>a</h3><Esc>`<i<h3><Esc>
imap ,,4 <h4> <BS></h4><C-O>F<
vmap ,,4 <Esc>`>a</h4><Esc>`<i<h4><Esc>

"odstavec
imap ,,p <p> <BS></p><C-O>F<
vmap ,,p <Esc>`>a</p><Esc>`<i<p><Esc>
imap ,,br <br />

"prostředí pro změnu vzhledu textu
imap ,,cen <div align="center"><CR><CR></div><Up>
vmap ,,cen <Esc>`>a</div><Esc>`<i<div align="center"><Esc>
imap ,,quo <blockquote><CR><CR></blockquote><Up>
vmap ,,quo <Esc>`>a</blockquote><Esc>`<i<blockquote><Esc>
imap ,,ver <pre><CR><CR></pre><Up>
vmap ,,ver <Esc>`>a</pre><Esc>`<i<pre><Esc>
imap ,,pre <pre><CR><CR></pre><Up>
vmap ,,pre <Esc>`>a</pre><Esc>`<i<pre><Esc>
imap ,,qv <blockquote><pre><CR><CR></pre></blockquote><Up>
vmap ,,qv <Esc>`>a</pre></blockquote><Esc>`<i<blockquote><pre><Esc>

imap ,,ul <ul> <BS></ul><C-O>F<
vmap ,,ul <Esc>`>a</ul><Esc>`<i<ul><Esc>
imap ,,li <li> <BS></li><C-O>F<
vmap ,,li <Esc>`>a</li><Esc>`<i<li><Esc>
imap ,,dd <dd> <BS></dd><C-O>F<
vmap ,,dd <Esc>`>a</dd><Esc>`<i<dd><Esc>
imap ,,dt <dt> <BS></dt><C-O>F<
vmap ,,dt <Esc>`>a</dt><Esc>`<i<dt><Esc>
imap ,,dl <dl> <BS></dl><C-O>F<
vmap ,,dl <Esc>`>a</dl><Esc>`<i<dl><Esc>

"tabulka, obrázek, odkaz
imap ,tab <TABLE BORDER="0"><CR><TR><TD></TD><TD></TD></TR><CR></TABLE><Esc>k02f>a
imap ,img <img src=" <BS>" alt=" <BS>" width=" <BS>" height=" <BS>" /><Esc>9F"i
imap ,,a <a href="#"> <BS></a><C-O>F<
vmap ,,a <Esc>`>a</a><Esc>`<i<a href=" <BS>"><Left><Left>
vmap ,,A <Esc>`>a"> <BS></a><Esc>`<i<a href=" <BS><Esc>f>a

"uzavření; napište <COSI> a použijte ,.
imap ,. <Esc>bi<<Esc>ea><Esc>F<yf>EpF<a/<Esc>hi
imap ,>	mqF<yf>`qpF<a/hi
"imap ,,> F<yf>f>pF<a/hi


