"gvim -c 'set filetype=mail' -c 'set textwidth=72' -c 'set fenc=utf-8' -c 'set spell spelllang=cs,en' -c 'colorscheme koehler' -c 'set guioptions=aAcrL' -f %s

set textwidth=72
set spell spelllang=cs,en
set guioptions=aAcrL

"Mail -- citace
imap <Leader>l <Return>><Esc>O
map <Leader>l i<Return>><Esc>O<Esc>
