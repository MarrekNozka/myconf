"set t_Co=256
" volba -u soubor načte soubor a ostatní konfirutaci přeskočí
" vim -u NONE načte čistý vim, bez konfigurace
set nocompatible "nejí to vi ale vim
if !exists('g:vscode')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let term=$TERM


set noautoread
"set termguicolors
"""autocmd! bufwritepost .vimrc source %  " automaticky načte .vimrc
syntax on
set concealcursor=nv   "skrývání jen v normálním a vizuálním módu
set conceallevel=1     "skrývání....
set fileencodings=utf-8,cp1250,iso8859-2
set fileformats=unix,dos
command Widle set ff=dos | set fenc=cp1250
command Unix set ff=unix | set fenc=utf-8
command UlozISO set ff=unix | set fenc=iso8859-2
command W write
command Q qall
command Nazeleno !chmod +x %
set printencoding=iso8859-2 
"set printexpr=system('kprinter'\ .\ '\ '\ .\ v:fname_in)\ .\ delete(v:fname_in)\ +\ v:shell_error
set printexpr=system('gtklp'\ .\ (&printdevice\ ==\ ''\ ?\ ''\ :\ '\ -P'\ .\ &printdevice)\ .\ '\ '\ .\ v:fname_in)\ .\ delete(v:fname_in)\ +\ v:shell_error

"" číslování řádků
set number   "ukazuje čísla řádků
nnoremap <silent> <F12> :set relativenumber!<CR>
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END




set showcmd	 "ukazuje příkazy na posledním řádku
set showmode 	 "ukazuj režim INZERT, REPLACE ....
set ruler	 "ukazuj pozici kurzoru
set laststatus=2 " znamená, že chceme, aby byl stavový řádek zapnutý vždy
"set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P\ %{VimBuddy()} "stavový řádek
"set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*\ \(%F\)%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P\ } "stavový řádek
set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*\ %=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P\ "stavový řádek
highlight User1 guibg=white guifg=blue 
highlight User2 guibg=white guifg=red

set iskeyword+=-

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

" Při odsazování mi text zůstane označený
vmap > >gv
vmap < <gv
vmap . >gv
vmap , <gv

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
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr-o-sm:hor20
set nojoinspaces " při spojování řádků nedává dvě mezery

set visualbell "vizuální zvonek
set tabstop=4  "odsazení tabulátoru
set shiftwidth=4 " šířka odsazení při >>
set shiftround " Zaokrouhluj počet mezer při odsazování (>> C-T << C-D) na násobek shiftwidth. 
set expandtab "při stisku tabulátoru vkládá mezery
" příkaz :retab projde celý text a převede tabulátory podle aktuálního
" nastavení (expandtab nebo noexpandtab)


"set viminfo='50,r/mnt,n~/.vim/viminfo "pamatuje značky z~posledních 50 souborů, neukládá si je pro soubory pocházející z~/mnt a soubor s~informacemi je ~/.vim/viminfo
set history=200
" aby se vytvářely záložní soubory
set backup 
set backupdir=~/.local/share/nvim/backup/

" aby se zachovala histirie změn i když otevřu a zavřu editor
set undofile
set undodir=~/.local/share/nvim/undo
nnoremap <F9> :UndotreeToggle<cr>
"set directory=~/tmp,.,/tmp   "adresář s dočasnými soubory


"set exrc " načítej soubor $PWD/.vimrc


set title 
set titlestring=vim:\ \"%t\"(%L)%m%R[%{expand(v:servername)[10:]}] "titulek
set mouse=a          "myš v konzole
"set mousemodel=popup "pravé tlačítko myši v grafické verzi otevírat vyskakovací menu

"clikbord
set clipboard=unnamed "Vše, co se ukládá do "unnamed" registru, se bude ukládat zároveň i do clipboardu.
set clipboard=unnamedplus
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

"set langmap=ě2,š3,č4,ř5,ž6,ý7,á8,í9,é0,\":,-/,_?
let mapleader = ",,"
let maplocalleader = ",,"

let g:python_host_prog  = '/usr/bin/python2'  " Python 2
"let g:python3_host_prog = '/usr/bin/python3'  " Python 3
let g:python3_host_prog = '/usr/local/bin/python3.8'  " Python 3
"let g:ruby_host_prog = '~/.gem/ruby/2.5.0/bin/neovim-ruby-host'

"source ~/.vim/skeletons.vim
"au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
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
"au BufNewFile *.tex set ft=tex


au BufNewFile,BufRead *.nxc set filetype=nxc

au BufRead *.PAS set ft=pascal
au BufRead *.lpr set ft=pascal

"set updatetime=7000
autocmd CursorHold * call Timer()
"" Když se nic neděje kontroluje jestli soubor nebyl změněn zvenku...
"" https://stackoverflow.com/questions/22090335/use-checktime-with-autocmd-without-delay-in-vim/22092122#
function! Timer()
  checktime
  call feedkeys("f\e")   " nevím proč to tu je ale funguje to i bez toho
endfunction

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

set bg=dark
map <Leader>l :set bg=light<Return>
map <Leader>L :set bg=dark<Return>

"colorscheme slate
colorscheme 256-jungle
"colorscheme darkblue
"colorscheme murphy
"colorscheme torte
"colorscheme desert
"colorscheme robinhood
set guioptions=aAcrLm " Vzhled
command Nomenu set guioptions=aAcrLm "e
command Menu set guioptions=aArcLmtTh "e
set guifont=Terminus:h14

" srovnání vim a nvim. nvim tam má navíc F a c. Ale nevím proč.
set shortmess-=Fc

"Spell
map <Leader>ss :set spell spelllang=cs,en<Return>
map <Leader>S :set nospell<Return>
"set spell spelllang=cs,en
set nospell
set cpo&vim


tnoremap <Esc> <C-\><C-n>


" seřadí označené řádky podle abecedy
" vnoremap <leader>s :sort<CR>

""Páry (závorky)
"imap <> <><Esc>i
"imap () ()<Esc>i
"imap [] []<Esc>i
"imap {} {}<Esc>i
"imap $$ $$<Esc>i
"imap "" ""<Esc>i
"imap '' ''<Esc>i
"imap ** **<Esc>i

" http://vimdoc.sourceforge.net/htmldoc/usr_40.html#40.2
command -nargs=1 Man Page! -t man <args>
set keywordprg=man " použije se Vimpager; gVim to má nastaveno v ~/.gvimrc
"vmap C <Esc>:set keywordprg=zsh\ -c<Return>`>`<v`>K<Esc>:set keywordprg=urxvt\ -e\ man<Return>
"vmap C <Esc>:set keywordprg=zsh\ -c<Return>`>`<v`>K<Esc>:set keywordprg=man<Return>

" chyby ve zdrojových kódech
imap <leader>[ <C-O>:lnext<Return>
imap <leader>] <C-O>:lprevious<Return>
map <leader>[ :lnext<Return>
map <leader>] :lprevious<Return>


:tnoremap <Esc> <C-\><C-n>

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
"imap <C-H> <Left>
"imap <C-L> <Right>
"imap <C-J> <Down>
"imap <C-K> <Up>
"imap <C-K> <Up>     " kolize :h digraph

" ukládání
map <C-S> :update<Return>
imap <C-s> <C-O>:update<Return>
map <Leader>u :update<Return>
imap <Leader>u <C-O>:update<Return>

""""""""""""""""""""""""""""
" Ctrl+Alt+J  Ctrl+Alt+K přesouvá řádek nahoru dolů
nnoremap <M-C-J> :m .+1<CR>==
nnoremap <M-C-K> :m .-2<CR>==

inoremap <M-C-J> <Esc>:m .+1<CR>==gi
inoremap <M-C-K> <Esc>:m .-2<CR>==gi

vnoremap <M-C-J> :m '>+1<CR>gv=gv
vnoremap <M-C-K> :m '<-2<CR>gv=gv

"""""""""""""""""""""""""""""


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

inoremap <silent><C-J> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-K> <C-R>=OmniPopup('k')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


" Paste with <Shift> + <Insert>
imap <S-Insert> <C-R>*
cmap <S-Insert> <C-R>*

""""""""""""""""""""""""""Plugins"""""""""""""""""""""""""
" Pathogen
"execute pathogen#infect()

"" vim-Plug -- https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')

"Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': 'c'}

"Plug 'https://github.com/kien/ctrlp.vim'
"
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/drmingdrmer/vim-toggle-quickfix', {'on': '<Plug>window:quickfix:loop'}   " F6
Plug 'https://github.com/scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " F7
Plug 'https://github.com/MarrekNozka/taglist.vim'                          " F8
Plug 'https://github.com/mbbill/undotree'                                  " F9
"Plug 'https://github.com/henrik/vim-open-url'
Plug 'https://github.com/sirtaj/vim-openscad'

Plug 'https://github.com/scrooloose/nerdcommenter'

Plug 'https://github.com/tmux-plugins/vim-tmux', { 'for': 'tmux'}

" https://github.com/junegunn/vim-plug/issues/700
"Plug 'https://github.com/ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clangd-completer ', 'for': [ 'python', 'zsh', 'sh', 'c'] }
Plug 'https://github.com/ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clangd-completer '}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'https://github.com/python-mode/python-mode', { 'for': 'python'}
"Plug 'https://github.com/davidhalter/jedi-vim', { 'for': 'python'}
"Plug 'https://github.com/rkulla/pydiction', { 'for': 'python'}
Plug 'https://github.com/wmvanvliet/jupyter-vim', { 'for': 'python'}
Plug 'https://github.com/psf/black',           { 'for': 'python', 'tag': '19.10b0'}
Plug 'https://github.com/hdima/python-syntax',    { 'for': 'python'}

"Plug 'https://github.com/Glench/Vim-Jinja2-Syntax'
"Plug 'https://github.com/hiphish/jinja.vim'
Plug 'https://gitlab.com/HiPhish/jinja.vim'

"Plug 'https://github.com/tpope/vim-markdown', {'for': 'markdown'}
Plug 'https://github.com/plasticboy/vim-markdown', {'for': 'markdown'}

Plug 'https://github.com/MarrekNozka/vim-skeletonlist'                    "F4

Plug 'https://github.com/mileszs/ack.vim'

Plug 'cloudhead/neovim-fuzzy'

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'frazrepo/vim-rainbow'                      "F11

Plug 'jiangmiao/auto-pairs'

if term == 'xterm-kitty'
    Plug 'norcalli/nvim-colorizer.lua'
endif

" Initialize plugin system
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""" vim-toggle-quickfix  -- https://github.com/drmingdrmer/vim-toggle-quickfix
nmap <F6> <Plug>window:quickfix:loop
"nmap <F5> <Plug>window:quickfix:toggle
"nmap <F6> <Plug>window:location:toggle



"" Syntastic plugin -- https://github.com/vim-syntastic/syntastic
" :h lopen
" :h lnext
" :h cnext

"  aptitude intall python-flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_flake8_args = "--ignore=E202,E201"
let g:syntastic_python_flake8_args = "--ignore=E203,E501,W503"
let g:syntastic_python_flake8_args = "--ignore=E402"
let g:syntastic_scss_scss_args = "--compass"

"let g:syntastic_c_make_exec="make nocolors"
"let g:syntastic_c_checkers = ['avrgcc -Iinc']
"let g:syntastic_avrgcc_config_file=".syntastic_avrgcc_config"
let g:syntastic_c_checkers = ['make', 'sdcc']
let g:syntastic_quiet_messages = { 'regex': 'warning 217:\|warning 158' }

let g:syntastic_loc_list_height=4
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"""""""""""""""""""""""" TagList plugin
nnoremap <silent> <F8> :TlistToggle<CR><C-W><Left>
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 1
"autocmd! BufWritePost *.c TlistUpdate
"autocmd! BufWritePost *.h TlistUpdate
"autocmd! BufWritePost *.cpp TlistUpdae
"autocmd! BufWritePost *.pl TlistUpdate
"autocmd! BufWritePost *.py TlistUpdate



""""""""""""""""""""""" Enhanced commentify plugin
""let g:EnhCommentifyTraditionalMode = 'no'
""let g:EnhCommentifyUserMode = 'yes'
""let g:EnhCommentifyAlignRight = 'yes'
"let g:EnhCommentifyMultiPartBlocks = 'yes'
""let g:EnhCommentifyUseSyntax = 'yes'



"""       NERDCommenter
map <Leader>x <plug>NERDCommenterToggle
vmap <Leader>x <plug>NERDCommenterToggle
"let NERDDefaultNesting=0 
let NERDDefaultAlign='left'  "Values: 'none', 'left', 'start', 'both'
let NERDDefaultDelims={ 'left': '#', 'leftAlt': '# ' }


"Jinja
autocmd! BufRead,BufNewFile *.html  call jinja#AdjustFiletype()



"" Markdown
"" https://github.com/plasticboy/vim-markdown
"" tento plugin už NEpoužívám
let g:vim_markdown_math=1
let g:vim_markdown_conceal = 0
set concealcursor=n   
set conceallevel=0
"" tento ANO
"" https://github.com/tpope/vim-markdown
let g:markdown_fenced_languages = ['html', 'bash=sh']

""""""""""" CtrlP  --   https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_working_path_mode = 'c'


""""""""""" NERD tree
"map <F7> :NERDTreeCWD<Return>
map <F7> :NERDTreeToggle<Return>



""""""""" IndentLine   -- https://github.com/Yggdroot/indentLine
let g:indentLine_enabled = 0



""""""""""" Jedi
"let g:jedi#force_py_version = 3
"set omnifunc=jedi#completions
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "2"
command JediAno let g:jedi#show_call_signatures = "1"
command JediNe  let g:jedi#show_call_signatures = "0"



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Python Syntax https://github.com/hdima/python-syntax
let python_highlight_all = 1
let g:python_highlight_all = 1

" python-mode
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_run = 0
let g:pymode_breakpoint = 0
let g:pymode_lint = 0
let g:pymode_rope = 1   "mám to tu kvůli přejmenování proměnných, tříd atd
let g:pymode_rope_completion = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_project_root = ""
let g:pymode_rope_ropefolder='.ropeproject'
let g:pymode_rope_rename_bind='<leader>rr'


" autopep8
let g:autopep8_on_save = 1
"let g:autopep8_ignore="E501,W293"
let g:autopep8_disable_show_diff=1
"let g:autopep8_diff_type='vertical'

" pydiction
let g:pydiction_location = '~/.config/nvim/plugged/pydiction/complete-dict'
" Remap snipmate's trigger key from tab to <C-J>
"imap <C-J> <Plug>snipMateNextOrTrigger
"smap <C-J> <Plug>snipMateNextOrTrigger

"" Open URL -- https://github.com/henrik/vim-open-url
let g:open_url_browser="xdg-open"
":h gx
let g:netrw_browsex_viewer= "xdg-open"


"" Black -- https://github.com/psf/black
let g:black_linelength=79
let g:black_virtualenv="~/.local/share/nvim/black"
autocmd BufWrite *.py Black
"nebo 
"au FileType python nnoremap <buffer> <F10> :silent !black % <CR><CR>

"" Skeleton
map <F4> :SkeletonList <Return>
autocmd BufNewFile * unsilent SkeletonList




"" YCM YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" https://github.com/ycm-core/YouCompleteMe#the-gycm_semantic_triggers-option
let g:ycm_semantic_triggers = {'python': ['re!from\s', 're!from\s+\S+\s+import\s']}

let g:ycm_min_num_of_chars_for_completion = 1

" toto nastavení je v after/ftplugin/c
"let g:ycm_show_diagnostics_ui = 0


"" Ack 
"  https://github.com/mileszs/ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

"" NeoVim-Fuzzy
" https://github.com/cloudhead/neovim-fuzzy
" https://github.com/jhawthorn/fzy
nnoremap <leader>e :let g:fuzzy_opencmd='edit'<cr>:FuzzyOpen<cr>
nnoremap <leader>v :let g:fuzzy_opencmd='vs'<cr>:FuzzyOpen<cr>
nnoremap <leader>s :let g:fuzzy_opencmd='sp'<cr>:FuzzyOpen<cr>
nnoremap <leader>t :let g:fuzzy_opencmd='tabe'<cr>:FuzzyOpen<cr>


"" UltiSnips
" https://github.com/SirVer/ultisnips
" https://github.com/honza/vim-snippets

let g:UltiSnipsExpandTrigger="<c-q>"
let g:UltiSnipsListSnippets="<c-i>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" Rainbow Parentheses Improved
" https://github.com/frazrepo/vim-rainbow
let g:rainbow_active = 0
" Shift+F5
nmap <F15> :RainbowLoad<Return>
nmap <F5> :e %<CR>
let g:rainbow_load_separately = [
    \ [ '*'     , [['(', ')'], ['\[', '\]'], ['{', '}'], ['{{', '}}'], ['{%', '%}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_ctermfgs = ['white', 'darkyellow', 'yellow', 'magenta']



" Auto Pairs
" https://github.com/jiangmiao/auto-pairs
let g:AutoPairsFlyMode = 1

" colorizer.lua
" https://github.com/norcalli/nvim-colorizer.lua
if term == 'xterm-kitty'
    set termguicolors
    lua require'colorizer'.setup()
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""
endif

syntax on
" vim:nospell:
