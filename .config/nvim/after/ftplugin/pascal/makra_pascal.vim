"Makta pro pascalovské zdrojáky
"Marek Nožka 25.4 2007


imap ,bb beginend;O
"write
imap ,ww writeln()<Esc>la;<Esc>F(a
imap ,WW write()<Esc>la;<Esc>F(a

imap ,pp procedure<Return>var<Return>:<Return>begin<Return>;<Return>end;<Esc><<<<k<<k<<kkkA;<Esc>i<space>
imap ,ff function<Return>var<Return>:<Return>begin<Return>;<Return>end;<Esc><<<<k<<k<<kkkA( <BS>):;<Esc>3hi<space>
imap ,if if  thenk$5ha
imap ,ii if  then  begin<BS>end else beginendO	3k$11hi

"komentaře
imap ,{{ ^{$}
vmap ,{{ <Esc>`>a}<Esc>`</\<<Return>i{<Esc>/<Up><Up><Return>
imap ,}} <Esc>?{<Return>x/}<Return>x/<Up><Up><Return>
map  ,}} ?{<Return>x/}<Return>x/<Up><Up><Up><Return>
