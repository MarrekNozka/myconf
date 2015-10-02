syntax match xTab1 /^    / nextgroup=xTab2 containedin=ALL
syntax match xTab1 /^	/ nextgroup=xTab2 containedin=ALL
syntax match xTab2 /    / contained nextgroup=xTab3 
syntax match xTab2 /	/ contained nextgroup=xTab3 
syntax match xTab3 /    / contained nextgroup=xTab4 
syntax match xTab3 /	/ contained nextgroup=xTab4 
syntax match xTab4 /    / contained nextgroup=xTab5 
syntax match xTab4 /	/ contained nextgroup=xTab5 
syntax match xTab5 /    / contained nextgroup=xTab6 
syntax match xTab5 /	/ contained nextgroup=xTab6 
syntax match xTab6 /    / contained nextgroup=xTab7 
syntax match xTab6 /	/ contained nextgroup=xTab7 
syntax match xTab7 /    / contained nextgroup=xTab2 
syntax match xTab7 /	/ contained nextgroup=xTab2 

command! Highlight highlight xTab1 ctermbg=DarkRed guibg=#330000 | highlight xTab3 ctermbg=darkblue guibg=#000033 | highlight xTab5 ctermbg=DarkGreen guibg=#002200 | highlight xTab7 ctermbg=DarkRed guibg=#330000  

command! Nohighlight highlight clear xTab1  | highlight clear xTab3 | highlight clear xTab5 | highlight clear xTab7   

"map <Leader>h :Highlight<Return>
"map <Leader>H :Nohighlight<Return>
"Highlight
