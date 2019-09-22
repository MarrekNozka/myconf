" A script that loads skeletons for known filetypes.
" Maintainer: Gustaf Sjoberg <gs@pipsq.com>
" Maintainer: Marek Nožka <marrek@marrek.cz>

let s:skeldir = 'skeletons/'

function! skeleton#LoadSkeletons()

    if &filetype == '' && (expand("%:e") == '')
        echo "No filetype set; no extension get :-P"
        return ''
    else
        let s:ext = expand("%:e")
    endif

    let fnames = split(globpath(&runtimepath, s:skeldir . &filetype . '/*'))
    if len(fnames) == 0
        echo "Skeleton for filetype not found. I try get sleletons by extension."
        let fnames = split(globpath(&runtimepath, s:skeldir . s:ext . '/*'))
    endif 
    let choices = ["Select skeleton to load:"]
    let index = 1

    for fname in fnames
        call add(choices, printf("%s) %s", index, fnamemodify(fname, ':t')))
        let index += 1
    endfor

    if len(fnames)
        let choice = inputlist(choices)
        if choice > 0 && choice <= len(fnames)
            let cpoptions = &cpoptions
            set cpoptions-=a
            silent execute '0r '.fnames[choice - 1]
            let cpoptions = cpoptions
        endif
        call skeleton#StringReplace()
    else
        let s:m = printf("No skeleton files available for filetype '%s' or extensions '%s'.", &filetype, s:ext)
        echo s:m
    endif
endfunction

function! skeleton#StringReplace()
  normal 1G
  exe "%s/skeletonVIM_CREATION_DATETIME/" . strftime("%Y\\/%m\\/%d %H:%M") . "/ge"
  exe "%s/skeletonVIM_CREATION_CZDATETIME/" . strftime("%d.%m.%Y %H:%M") . "/ge"
  exe "%s/skeletonVIM_COMA_DATE/" . strftime("%Y, %m, %d") . "/ge"
  exe "%s/skeletonPelicanDATETIME/" . strftime("%Y-%m-%d %H:%M") . "/ge"
  exe "%s/skeletonVIM_CREATION_DATE/" . strftime("%Y\\/%m\\/%d") . "/ge"
  exe "%s/skeletonVIM_CREATION_CZDATE/" . strftime("%d.%m.%Y") . "/ge"
  exe "%s/skeletonVIM_CREATION_TIME/" . strftime("%H:%M") . "/ge"
  exe "%s/skeletonVIM_FILE_BASE/" . expand("%:t:r") . "/ge"
  exe "%s/skeletonVIM_FILE_NAME/" . expand("%:t") . "/ge"
  exe "%s/skeletonVIM_FILE_EXT/" . expand("%:e") . "/ge"
  exe "%s/skeletonVIM_FILE_MACRO/__" . toupper(expand("%:t:r") . "_" . expand("%:e")) . "__/ge"
  exe "%s/skeletonVIM_USER_NAME/" . $USERNAME . "/ge"
endfunction
