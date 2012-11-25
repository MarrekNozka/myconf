"pro překlad a zobrazení chyb

"set makeprg=cslatex
command! MakeDVI write | !latex %
command! MakePDF write | !pdflatex %
map <Leader>go :MakeDVI<Return>
map <Leader>md :MakeDVI<Return>
imap <Leader>md <Esc>:MakeDVI<Return>
map <Leader>mp :MakePDF<Return>
imap <Leader>mp <Esc>:MakePDF<Return>

map <Leader>ma :write\|make %<Return>
map <Leader>Ma :write\|make<Return>

set spell spelllang=cs,en 

"set textwidth=76

"map ,vl :w:!vlna %:e %

"command! Kpdf !JMENO=`echo %`;JMENO=`basename $JMENO .tex`;kpdf $JMENO.dvi & 
command! Odvi !okular %<.dvi & 
command! Xdvi !xdvi -watchfile 1 %<.dvi & 
command! Opdf !okular %<.pdf & 
command! Xpdf !xpdf %<.pdf & 
command! Pisemka 0,$d | 0r ~/.vim/sablony/latex-pisemka.tex 

"foldy
set foldenable
