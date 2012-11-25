#!/bin/zsh
# Soubor:  script-wrapper.zsh
# Datum:   26.09.2012 14:07
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha:   Obal pro /usr/bin/script
######################################################################
#                          FUNKCE                                    #
######################################################################

##.................................................................###
# funkce vytiskne help
printHelp() {
cat <<EOF
Toto je $0
Slouží jako wrapper pro /usr/bin/script

Volání
    $0 [-T] [-a] [file]

    -T 
        NEzaznamenává i časové údaje
    -a
        nemaže ... přidává

Sezení lze přehrát pomocí scriptreplay nebo 
 less -R FILE.script.
EOF
}

######################################################################
#                         Tělo skriptu. 
######################################################################
#
##.................................................................###
#        zpracování přepínačů příkazového řádku

# pokud je zadán parametr -h nebo --help vytiskne help s končí
for param in $@; do
    if [[ $param == "-h" ]] || [[ $param == "--help" ]]; then
        printHelp
        exit 0;
    fi
done

# zpracuje parametry příkazového řádku
args=$(getopt --name $(basename $0) -o at -- "$@") || exit 1
# zpracované parametry předá zpět do $@ a $*
eval set -- $args
# projde a posune parametry
while true; do
    i=$1
    case $i in 
        -T)
            TIME='FALSE'
            shift
            ;;
        -a)
            APPEND='-a'
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

if [ $1 ]; then 
    FILE=$1
else
    FILE="session_$(LC_TIME=C date +%Y,%m,%d-%H:%M:%S)"
fi

#      Zpracování ne-přepínačových parametrů
##.................................................................###

if [ $TIME ]; then
    script $APPEND ${FILE}.script
else
    script -t 2>${FILE}.time $APPEND ${FILE}.script
fi

