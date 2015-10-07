#!/bin/zsh
# Soubor:  vim-remote.zsh
# Datum:   22.04.2015 12:39
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL 
# Úloha:   Wrapper pro vim --remote
# Popis:   Jméno vim-serveru se určí z jména pracovní plochy
#          Pokud zadám parametr (např. -1 nebo -5) vezme se plocha
#          podle totoho parametru.
######################################################################
#
##.................................................................###
# funkce vytiskne help
printHelp() {
cat <<EOF
vim-remote.zsh: Wrapper pro \"vim --remote\"
Popis:   Jméno vim-serveru se určí z jména pracovní plochy
         Pokud zadám parametr (např. -1 nebo -5) vezme se plocha
         podle totoho parametru.
         -1 je stejné jako -n 1

EOF
}

##.................................................................###

######################################################################
#                         Tělo skriptu. 
######################################################################
#
##.................................................................###
#        zpracování přepínačů příkazového řádku

#if [ -z $1 ]; then
#    printHelp
#    exit 0;
#fi
# pokud je zadán parametr -h nebo --help vytiskne help s končí
for param in $@; do
    if [[ $param == "-h" ]] || [[ $param == "--help" ]]; then
        printHelp
        exit 0;
    fi
done

# zpracuje parametry příkazového řádku
args=$(getopt --name $(basename $0) -o 123456789n: -- "$@") || exit 1
# zpracované parametry předá zpět do $@ a $*
eval set -- $args
# projde a posune parametry
while true; do
    i=$1
    case $i in 
        -[0-9])
            DESKTOP=${i#-}
            shift
            ;;
        -n)
            shift
            DESKTOP=$1
            shift
            ;;
        --)
            shift
            break ; # tohle byl poslední...
            ;;
    esac
done

#        zpracování parametrů příkazového řádku
##.................................................................###
#      Zpracování ne-přepínačových parametrů
#for i in "$@"; do
#    echo $i
#done
#      Zpracování ne-přepínačových parametrů
##.................................................................###

# funguje v notion; jak je to jinde nevím

if [ -z $DESKTOP ]; then
    DESKTOP=`xprop -root | \
         grep '_WORKSPACE(' | \
         sed  -r 's/(.*=[ \t]*)(.+)/\2/'`
# oříznu případné uvozovky
    DESKTOP=${DESKTOP#'"'}
    DESKTOP=${DESKTOP%'"'}
fi

gvim --servername $DESKTOP$DISPLAY
while [ $1 ]; do
    gvim --servername $DESKTOP$DISPLAY --remote-tab-silent $1
    shift
done

