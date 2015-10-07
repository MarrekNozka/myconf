#!/bin/zsh
# Soubor:  auto-F5.zsh
# Datum:   16.06.2015 11:40
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL 
# Úloha:   Automatické stisknutí F5 v prohlížečí při změně souborů v adresáři
#
######################################################################
#                          FUNKCE                                    #
######################################################################

##.................................................................###
# funkce vytiskne help
printHelp() {
cat <<EOF
Skript $0 slouží pro automatický stisk klávesy F5 v určeném okně 
při změně souborů v určených adresářích

$(basename $0) [-x XID] [-c příkaz] [-t 1] [ADR]
 
-x Pokud není zadán XID bude XID vyhledám podle okna,
   na které se klikne.

-c Volitelný příkaz, který se provede před stiskem F5

-t Volitelná časová prodleva mezi registrovanou změnou souboru a
   stiskem F5.

EOF
}

######################################################################
#                         Proměnné                                   #
######################################################################
setopt extendedglob # **/*.txt
setopt re_match_pcre 
TIME=1
XID="x"



######################################################################
#                         Tělo skriptu. 
######################################################################
#
##.................................................................###
#        zpracování přepínačů příkazového řádku

if [ -z $1 ]; then
    printHelp
    exit 0;
fi
# pokud je zadán parametr -h nebo --help vytiskne help s končí
for param in $@; do
    if [[ $param == "-h" ]] || [[ $param == "--help" ]]; then
        printHelp
        exit 0;
    fi
done

# zpracuje parametry příkazového řádku
args=$(getopt --name $(basename $0) -o x:c:t: -- "$@") || exit 1
#echo $args
# zpracované parametry předá zpět do $@ a $*
eval set -- $args
# projde a posune parametry
while true; do
    i=$1
    case $i in 
        -x)
            shift
            XID=$1
            shift
            ;;
        -c)
            shift
            COMMAND=$1
            shift
            ;;
        -t)
            shift
            TIME=$1
            if ! [[ $TIME =~ '^\d*$' ]]; then
                echo "-t ${TIME}: Časový údaj musí být číslo." >/dev/stderr
                exit 1
            fi
            shift
            ;;
        --)
            shift
            break ; # tohle byl poslední...
            ;;
    esac
done

# načtu XID okna jako parametr z příkazové řádky
if [[ $XID == 'x' ]]; then 
    winID=$(xwininfo | egrep -i 'window id' | awk '{print $4}')
    echo "XID: $winID"
else
    if [[ $XID =~ '^[\da-fA-F]+$' ]]; then
        winID="0x$XID"
    elif [[ $XID =~ '^0x[\da-fA-F]+$' ]]; then
        winID="$XID"
    else 
        echo "Toto ($XID) nevypadá jako window XID" >/dev/stderr
        exit 1
    fi
fi

#        zpracování parametrů příkazového řádku
##.................................................................###
#      Zpracování ne-přepínačových parametrů

radek=0
while true; do
    radek=$[ $radek + 1 ]
    printf "#####:--> %03d: " ${radek}; 
    date
    inotifywait -r -e modify --excludei '\.[^/]+\.swp$' $@
    if [ $COMMAND ]; then
        printf "########: command --> %03d:\n" ${radek}; 
        printf "$ %s ;;;;\n" $COMMAND
        eval $COMMAND
        printf "########: command <-- %03d:\n" ${radek}; 
    fi
    sleep ${TIME}s
    xdotool key --window $winID F5  
    printf "###   <-- %03d: " ${radek}; 
    date
done
#      Zpracování ne-přepínačových parametrů
##.................................................................###
