" Vim color file
" Maintainer:	Piotr Husiatyński <phusiatynski@gmail.com>
"
" https://github.com/dolio/256-jungle
" https://github.com/MarrekNozka/256-jungle
"
"
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
" https://jonasjacek.github.io/colors/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
let g:colors_name="256-jungle"

let python_highlight_all = 1
let c_gnu = 1

hi Normal	    ctermfg=253       ctermbg=234       cterm=None
hi Normal       guifg=#dadada     guibg=#1c1c1c     gui=NONE
hi Cursor       ctermfg=253       ctermbg=57        cterm=None
hi Cursor       guifg=#dadada     guibg=#5f00ff     gui=NONE

hi iCursor      ctermfg=253       ctermbg=57        cterm=None 
hi iCursor      guifg=#dadada     guibg=#5f00ff     gui=None
hi MatchParen   ctermfg=160       ctermbg=8         cterm=Bold
hi MatchParen   guifg=#d70000     guibg=#008080     gui=Bold

hi SpecialKey	ctermfg=70        ctermbg=None      cterm=None
hi SpecialKey   guifg=#5faf00     guibg=NONE        gui=NONE
hi Directory	ctermfg=57        ctermbg=254       cterm=None
hi Directory    guifg=#5f00ff     guibg=#e4e4e4     gui=NONE
hi ErrorMsg     ctermfg=160       ctermbg=245       cterm=None
hi ErrorMsg     guifg=#d70000     guibg=#8a8a8a     gui=NONE
hi PreProc	    ctermfg=184       ctermbg=None      cterm=Bold
hi PreProc      guifg=#d7d700     guibg=NONE        gui=Bold
hi Search	    ctermfg=125       ctermbg=None      cterm=Bold
hi Search       guifg=#af005f     guibg=NONE        gui=Bold
hi IncSearch    ctermfg=125       ctermbg=106       cterm=Bold
hi IncSearch    guifg=#af005f     guibg=#87af00     gui=Bold
hi Type		    ctermfg=166       ctermbg=None      cterm=Bold
hi Type         guifg=#d75f00     guibg=NONE        gui=Bold
hi Statement	ctermfg=172       ctermbg=None      cterm=Bold
hi Statement    guifg=#d78700     guibg=NONE        gui=Bold
hi Comment	    ctermfg=174      ctermbg=None      cterm=None
hi Comment      guifg=#d78787     guibg=NONE        gui=NONE
hi LineNr	    ctermfg=244       ctermbg=233       cterm=None
hi LineNr       guifg=#808080     guibg=#121212     gui=NONE
hi NonText	    ctermfg=105       ctermbg=None      cterm=Bold
hi NonText      guifg=#8787ff     guibg=NONE        gui=Bold
hi DiffText	    ctermfg=165       ctermbg=244       cterm=None
hi DiffText     guifg=#d700ff     guibg=#808080     gui=NONE
hi Constant	    ctermfg=76        ctermbg=None      cterm=None
hi Constant     guifg=#5fd700     guibg=NONE        gui=NONE
hi Todo         ctermfg=162       ctermbg=None      cterm=Bold
hi Todo         guifg=#d70087     guibg=NONE        gui=Bold
hi Identifier	ctermfg=142       ctermbg=None      cterm=Bold
hi Identifier   guifg=#afaf00     guibg=NONE        gui=Bold
hi Error	    ctermfg=None      ctermbg=196       cterm=Bold
hi Error        guifg=NONE        guibg=#ff0000     gui=Bold
hi Special	    ctermfg=172       ctermbg=None      cterm=Bold
hi Special      guifg=#d78700     guibg=NONE        gui=Bold
hi Ignore       ctermfg=221       ctermbg=None      cterm=Bold
hi Ignore       guifg=#ffd75f     guibg=NONE        gui=Bold
hi Underline    ctermfg=147       ctermbg=None      cterm=Italic
hi Underline    guifg=#afafff     guibg=NONE        gui=Italic

hi FoldColumn	ctermfg=132       ctermbg=None      cterm=None
hi FoldColumn   guifg=#af5f87     guibg=NONE        gui=NONE
hi Folded       ctermfg=132       ctermbg=None      cterm=Bold
hi Folded       guifg=#af5f87     guibg=NONE        gui=Bold

hi Visual       ctermfg=248       ctermbg=238       cterm=None
hi Visual       guifg=#a8a8a8     guibg=#444444     gui=NONE

hi Pmenu        ctermfg=62        ctermbg=233       cterm=None
hi Pmenu        guifg=#5f5fd7     guibg=#121212     gui=NONE
hi PmenuSel     ctermfg=69        ctermbg=232       cterm=Bold
hi PmenuSel     guifg=#5f87ff     guibg=#080808     gui=Bold
hi PmenuSbar    ctermfg=247       ctermbg=233       cterm=Bold
hi PmenuSbar    guifg=#9e9e9e     guibg=#121212     gui=Bold
hi PmenuThumb   ctermfg=248       ctermbg=233       cterm=None
hi PmenuThumb   guifg=#a8a8a8     guibg=#121212     gui=NONE

hi StatusLineNC ctermfg=248       ctermbg=239       cterm=None
hi StatusLineNC guifg=#a8a8a8     guibg=#4e4e4e     gui=NONE
hi StatusLine   ctermfg=39        ctermbg=239       cterm=None
hi StatusLine   guifg=#00afff     guibg=#4e4e4e     gui=NONE
hi VertSplit    ctermfg=239       ctermbg=239       cterm=None
hi VertSplit    guifg=#4e4e4e     guibg=#4e4e4e     gui=NONE

hi TabLine      ctermfg=245       ctermbg=239       cterm=None
hi TabLine      guifg=#8a8a8a     guibg=#4e4e4e     gui=NONE
hi TabLineFill  ctermfg=239       ctermbg=239
hi TabLineFill  guifg=#4e4e4e     guibg=#4e4e4e
hi TabLineSel   ctermfg=104       ctermbg=236       cterm=Bold
hi TabLineSel   guifg=#8787d7     guibg=#303030     gui=Bold
hi BlingHilight ctermbg=125       ctermfg=bg        cterm=Bold
hi BlingHilight guibg=#af005f     guifg=bg          gui=Bold

" gui definition
"vim: sw=4
