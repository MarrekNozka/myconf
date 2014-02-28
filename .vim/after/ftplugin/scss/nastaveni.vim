function! MakeCSS()
    write
    if exists("g:file") 
        if isdirectory(g:file)
            execute "!sass --debug-info % " . g:file . "/%:r.css"
        else
            execute "!sass --debug-info % " . g:file
        endif
    else
        execute "!sass --debug-info % %:r.css"
    endif
endfunction

"command! MakeCSS write | !sass % %.css
map <Leader>go :call MakeCSS()<Return>
imap <Leader>go <Esc>:call MakeCSS()<Return>

