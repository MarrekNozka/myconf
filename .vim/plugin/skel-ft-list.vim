" Původní plugin pro vkládání koster souborů vytvořil 16.7.2002 Michal Burda 
" http://www.root.cz/clanky/kostry-dokumentu-ve-vim/
"
" Marek Nožka provedl 27.10.2010 drobné úpravy. Největší a zásadní změnou je,
" že se počítá nejen s příponou ale i s filetype, takže je možné vytvořit si
" skeleton i například na Makefile atp., které nemají příponu.
"
" Použití: 
" =========
"
" Tento soubor je třeba uložit nezi pluginy -- například do ~/.vim/plugin nebo
" ho zavolat ve vimrc -- například source ~/.vim/skel-ft-list.vim
"
" Do adresáře SKELETONSDIR = "~/.vim/skeletons/" se ukládají kostry dokumentů 
" ve tvaru {jméno}.{filetype}. Pokud existuje pro jeden filetype více souborů,
" plugin při založení nového souboru otevře nabídku s výběrem skeletonu.
" Pokud neexistuje fyletype, plugin se orientuje podle přípony 
" 
" Uvnitř skeletonu je možné použít následujících řetězců:
"
"  * skeletonVIM_CREATION_DATETIME – aktuální datum a čas ve formátu „rok/měsíc/den hodina:minuta“
"  * skeletonVIM_CREATION_CZDATETIME – aktuální datum a čas ve formátu „den.měsíc.rok hodina:minuta“
"  * skeletonVIM_CREATION_DATE – aktuální datum ve formátu „rok/měsíc/den“
"  * skeletonVIM_CREATION_CZDATE – aktuální datum ve formátu „den.měsíc.rok“
"  * skeletonVIM_CREATION_TIME – aktuální čas ve formátu „hodina:minuta“
"  * skeletonVIM_FILE_BASE – základ jména vytvořeného souboru (bez cesty a přípony)
"  * skeletonVIM_FILE_NAME – jméno souboru s příponou
"  * skeletonVIM_FILE_EXT – pouze přípona souboru
"  * skeletonVIM_FILE_MACRO – název souboru ve speciálním formátu vhodném pro použití v definicích
"                             preprocesoru jazyka C. Jmenuje-li se soubor „MujSoubor.h“, bude tento
"                             řetězec nahrazen sekvencí __MUJSOUBOR_H__.
"  * skeletonVIM_USER_NAME – jméno uživatele, který soubor vytvořil (bere se z proměnné prostředí $USERNAME)
"
"
" Funkce se vykoná po každém otevření nového souboru
function! SKEL_on_new_file()
  let SKELETONSDIR = "~/.vim/skeletons/"
  " Jestliže je soubor jen ke čtení nebo nemá filetype ani příponu, konči.
  if (&modifiable == 0) || ( ( &l:filetype == '' )  && (expand("%:e") == "") )
    return
  endif

  " Do proměnné skels ulož seznam názvů patřičných šablonových souborů.
  let skels = expand(SKELETONSDIR . "*." . &l:filetype)
  if ( ( skels == "" ) || ( skels =~ "\*" ) )
    let skels = expand(SKELETONSDIR . "*." . expand("%:e"))
  endif
  " Jestliže je seznam prázdný (žádný vhodný šablonový soubor neexistuje), konči.
  if ( ( skels == "" ) || ( skels =~ "\*" ) )
    return
  endif

  let pom = skels . "\n"
  let s = "Vyberte si šablonu:\n"
  let i = "1"
  " Budeme vytvářet nabídku šablon
  while pom != ""
    let s = s . i . ": " . fnamemodify(substitute(pom, "\n.*$", "", ""), ":t:r") .  "\n"
    let pom = substitute(pom, "^[^\n]*\n", "", "")
    let i = nr2char(char2nr(i) + 1)
  endwhile
  if i == "2"
    " Jestliže i == "2", znamená to, že existuje jenom jeden soubor s šablonou. Nebudeme se tedy
    " na nic ptát a rovnou ho použijeme...
    exe "0r " . substitute(skels, "\n.*$", "", "")
    call SKEL_replace()
  else " ...jinak se zeptáme uživatele, kterou šablonu si vybral
    let in = toupper(input(s))
    " Jestliže je výběr v pořádku, načteme patřičnou šablonu.
    if (char2nr(in) != 0) && (char2nr(in) >= nr2char("1")) && (char2nr(in) < char2nr(i))
      let pom = skels . "\n"
      let i = "1"
      " Hledáme název souboru, který uživatel zvolil.
      while i != in[0]
        let pom = substitute(pom, "^[^\n]*\n", "", "")
        let i = nr2char(char2nr(i) + 1)
      endwhile
      exe "0r " . substitute(pom, "\n.*$", "", "")
      call SKEL_replace()
    endif
  endif
endfunction


" Náhrady řetězců v načtené šabloně
function! SKEL_replace()
  " Vymazání posledního prázdného řádku - oproti šablonovému souboru 
  " je tam vždy navíc (aspoň u mě).
  exe "$d"
  " Přesun kurzoru na začátek.
  normal 1G
  " Několik prima regulárních výrazů...
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


" Pokud spuštěná verze VIMu podporuje auto-commands...
if has("autocmd")
  " ...zaregistruj funkci SKEL_on_new_file() na provedení po každém otevření nového souboru.
  augroup skeletons
    au!
    "autocmd BufNewFile *    call SKEL_on_new_file()
  augroup END
endif
