version 7.0
"set t_Co=256
" volba -u soubor načte soubor a ostatní konfirutaci přeskočí
" vim -u NONE načte čistý vim, bez konfigurace
set nocompatible "nejí to vi ale vim
"""autocmd! bufwritepost .vimrc source %  " automaticky načte .vimrc
syntax on
set fileencodings=utf-8,iso8859-2,cp1250
set fileformats=unix,dos
command Widle set ff=dos | set fenc=cp1250
command Unix set ff=unix | set fenc=utf-8
command UlozISO set ff=unix | set fenc=iso8859-2
command W write
command Nazeleno !chmod +x %
set printencoding=iso8859-2 
"set printexpr=system('kprinter'\ .\ '\ '\ .\ v:fname_in)\ .\ delete(v:fname_in)\ +\ v:shell_error
set printexpr=system('gtklp'\ .\ (&printdevice\ ==\ ''\ ?\ ''\ :\ '\ -P'\ .\ &printdevice)\ .\ '\ '\ .\ v:fname_in)\ .\ delete(v:fname_in)\ +\ v:shell_error

set showcmd	 "ukazuje příkazy na posledním řádku
set showmode 	 "ukazuj režim INZERT, REPLACE ....
set number	 "ukazuje čísla řádků
set ruler	 "ukazuj pozici kurzoru
set laststatus=2 " znamená, že chceme, aby byl stavový řádek zapnutý vždy
"set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P\ %{VimBuddy()} "stavový řádek
"set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*\ \(%F\)%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P\ } "stavový řádek
set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*\ %=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P\ "stavový řádek
highlight User1 guibg=white guifg=blue 
highlight User2 guibg=white guifg=red

" pwd
"set autochdir
command Cd cd %:h
command CD cd %:h


set lazyredraw
set display=lastline "Zobrazovat alespoň část řádku místo nehezkých @.
set wrap	 "zalamování řádků	
set linebreak	"zlom jen ve slově 
"set showbreak=++\ 
set autoindent  "jen zachovává odsazení
set smartindent	"zachovává odsazení ale inteligentně ho umí zvětšit/zmenšit
filetype plugin indent on "odsazovaní podle filetype
" Při odsazování mi text zůstane odsazený
vmap < <gv 
vmap > >gv 

set ww=b,s,<,>,[,],~ ",h,l "chování na přechodu dvou řádků
set backspace=indent,eol,start "chování na přechodu dvou řádků
set scrolloff=3  " minimální počet viditelných řádků při rolování
set sidescroll=3 " totéž při posun za stránky

set helplang=cs
set dictionary=~/.slovnik 

set wrapscan "po dosažení konce souboru se hledá znovu od začátku
set hlsearch "zvýraznění hledaného textu
set ignorecase "při hledání nerozlišuje velká a malá písmena
set smartcase  "ignorecase platí pouze tehdy pokud v~hledaném výrazu jsou jen malá písmena
set incsearch  "ukazuje mi co hledám ještě předtím než dám Enter

set wildmenu "v :příkazovém řádku zobrazí menu pro výběr
set wildmode=list:longest,list:full "chování TAB v~příkazovém řádku
set wildignore=*~,*.o,*.log,*.aux "Ignoruje při doplňování tabulátorem

set confirm		"pokud jsem nepoužil ! a měl jsem, tak se mě zeptá co dělat
set showmatch   "zvýraznění páru závorek
set nojoinspaces " při spojování řádků nedává dvě mezery

set visualbell "vizuální zvonek
set tabstop=4  "odsazení tabulátoru
set shiftwidth=4 " šířka odsazení při >>
set shiftround " Zaokrouhluj počet mezer při odsazování (>> C-T << C-D) na násobek shiftwidth. 
set expandtab "při stisku tabulátoru vkládá mezery
" příkaz :retab projde celý text a převede tabulátory podle aktuálního
" nastavení (expandtab nebo noexpandtab)


set viminfo='50,r/mnt,n~/.vim/viminfo "pamatuje značky z~posledních 50 souborů, neukládá si je pro soubory pocházející z~/mnt a soubor s~informacemi je ~/.vim/viminfo
set history=200
set backup 
set backupdir=~/.vim/backup
"set directory=~/tmp,.,/tmp   "adresář s dočasnými soubory

"set exrc " načítej soubor $PWD/.vimrc

set title 
set titlestring=vim:\ \"%t\"(%L)%m%R  "titulek
set mouse=a          "myš v konzole
"set mousemodel=popup "pravé tlačítko myši v grafické verzi otevírat vyskakovací menu

"clikbord
set clipboard=unnamed "Vše, co se ukládá do "unnamed" registru, se bude ukládat zároveň i do clipboardu.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

"set langmap=ě2,š3,č4,ř5,ž6,ý7,á8,í9,é0,\":,-/,_?
let mapleader = ",,"
let maplocalleader = ",,"

"source ~/.vim/skeletons.vim
"autocmd BufRead,BufNewFile *.html,*.xhtml,*.php source ~/.vim/html.vim
"autocmd BufRead,BufNewFile *.html,*.xhtml,*.php source ~/.vim/html.menu
"au BufNewFile *.php,*.html,*.xhtml 0r ~/.vim/sablony/xhtml.html
"autocmd BufRead,BufNewFile *.html,*.xhtml,*.php set filetype=xhtml
"au BufNewFile *.fold 0r ~/.vim/sablony/osnova.fold
"au BufNewFile *.fold set filetype=conf
"au BufNewFile *.tex 0r ~/.vim/sablony/latex.tex
"au BufRead,BufNewFile *.tex set filetype=tex
"au BufNewFile *.pl 0r ~/.vim/sablony/perl.pl
"au BufNewFile *.c 0r ~/.vim/sablony/program.c

au BufNewFile,BufRead *.t2t set ft=txt2tags
au BufNewFile *.t2t 0r ~/.vim/sablony/txt2tags.t2t
au BufNewFile,BufRead *.asm set ft=asm8051
au BufNewFile,BufRead *.inc set ft=asm8051

au BufRead *.PAS set ft=pascal
au BufRead *.lpr set ft=pascal


"folds -- sklady
set foldcolumn=1
set foldmethod=indent
"set foldmethod=marker
"set foldmarker=##,::
set nofoldenable
"set foldopen=all
"set foldclose=all

"Tags
set tags=./tags,./TAGS,tags,TAGS,~/.vim/tags

""""   Vzhled
" Show whitespace " MUST be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

colorscheme slate
"colorscheme darkblue
"colorscheme murphy
"colorscheme torte
"colorscheme desert
set guioptions=aAcrLm " Vzhled
command Nomenu set guioptions=aAcrLm "e
command Menu set guioptions=aArcLmtTh "e

"Spell
map <Leader>s :set spell spelllang=cs,en<Return>
map <Leader>S :set nospell<Return>
"set spell spelllang=cs,en
set nospell
set cpo&vim


" seřadí označené řádky podle abecedy
" vnoremap <leader>s :sort<CR>

"Páry
imap <> <><Esc>i
imap () ()<Esc>i
imap [] []<Esc>i
imap {} {}<Esc>i
imap $$ $$<Esc>i
imap "" ""<Esc>i
imap '' ''<Esc>i
imap ** **<Esc>i

"set keywordprg=man
"vmap C <Esc>:set keywordprg=zsh\ -c<Return>`>`<v`>K<Esc>:set keywordprg=urxvt\ -e\ man<Return>
"vmap C <Esc>:set keywordprg=zsh\ -c<Return>`>`<v`>K<Esc>:set keywordprg=man<Return>

"==== spustí shell z označeným příkazem =====
"příkaz shell pod kurzorem
map <Leader>e :!<C-R><C-A>& <Return>
"označený příkaz
vmap <Leader>e y:!<C-R>"& <Return>
" celý řádek zadá jako příkaz shell
map <Leader>E ^v$h<Leader>e
imap <Leader>E <Esc><Leader>E
" řetězec pod kurzorem vloží jak URL do prohlížeče
map <Leader>w :!iceweasel <C-R><C-A> & <Return>

" code completion
imap <C-Space> <C-X><C-O>

"""" Pohyb v příkazovém režumu
cmap <C-H> <Left>
cmap <C-L> <Right>
cmap <C-J> <Down>
cmap <C-K> <Up>
"""" Pohyb ve vkládacím režumu
imap <C-H> <Left>
imap <C-L> <Right>
imap <C-J> <Down>
imap <C-K> <Up>
" ukládání
map <C-U> :update<Return>
imap <C-U> <C-O>:update<Return>
map <Leader>u :update<Return>
imap <Leader>u <C-O>:update<Return>

"Formátování
map <Leader><Return> gwap
imap <Leader><Return> <Esc>gwapa
map <Leader>g<Return> gogqG
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
"highlight ColorColumn ctermbg=Yellow guibg=#ff9999
highlight ColorColumn ctermbg=Gray guibg=Gray

"""""""""""""""""""Omni popopu"""""""""""""""""""""""
"" Aby při plovoucím doplňovacím okýnku se ško pohybovat
"" pomocí J a K.

function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent>j <C-R>=OmniPopup('j')<CR>
inoremap <silent>k <C-R>=OmniPopup('k')<CR>

""""""""""""""""""""""""""PluIns"""""""""""""""""""""""""
execute pathogen#infect()

"" Syntastic plugin
"  aptitude intall python-flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_flake8_args = "--ignore=E202,E201"
let g:syntastic_scss_scss_args = "--compass"


"""""""""""""""""""""""" TagList plugin
nnoremap <silent> <F8> :TlistToggle<CR>
"autocmd! BufWritePost *.c TlistUpdate
"autocmd! BufWritePost *.h TlistUpdate
"autocmd! BufWritePost *.cpp TlistUpdae
"autocmd! BufWritePost *.pl TlistUpdate
"autocmd! BufWritePost *.py TlistUpdate

"""""""""""""""""""""" Enhanced commentify plugin
let g:EnhCommentifyTraditionalMode = 'no'
let g:EnhCommentifyUserMode = 'yes'
let g:EnhCommentifyAlignRight = 'yes'
"let g:EnhCommentifyMultiPartBlocks = 'yes'
let g:EnhCommentifyUseSyntax = 'yes'


""""""""""" CtrlP 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'


"""""" Viki
 let g:vikiUpperCharacters = "A-ZĚŠČŘŽÝÁÍÉÚŮÓĎŤŘŇ"
 let g:vikiLowerCharacters = "a-zěščřžýáíéúůóďťřň"
 let g:vikiUseParentSuffix = 1
 let g:vikiCommentStart = "#"
 let g:vikiTextstylesVer = 1
 let g:vikiMapMouse = 1
 
 let g:vikiOpenUrlWith_mailto = 'silent !claws-mail --compose %{URL} & '
 let g:vikiOpenUrlWith_http = "silent !iceweasel -new-tab %{URL} &"
 let g:vikiOpenUrlWith_file = "silent !iceweasel -new-tab %{URL} &"
 let g:vikiOpenFileWith_html  = "silent !iceweasel -new-tab %{FILE} &"
 let g:vikiOpenFileWith_pdf  = "silent !okular %{FILE} &"
 let g:vikiOpenFileWith_ANY   = "silent !VikiStart %{FILE} &"
 
 let g:vikiNameSuffix = ".viki"
 autocmd! BufRead,BufNewFile *.viki set filetype=viki
 autocmd! BufRead,BufNewFile $HOME/Viki/* set filetype=viki
 autocmd! BufRead,BufNewFile $HOME/Viki/* cd ~/Viki
 let g:vikiHomePage = "~/Viki/index.viki"

map <Leader>h :VikiHome<Return>
imap <Leader>h <Esc>:VikiHome<Return>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:nospell:
