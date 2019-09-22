#!/bin/bash
# Soubor: ~/bin/easymake.sh
# Datum: 12.10.2010
# Autor: Postaveno na základu, který vytvořil Michal Halenka
# Autor: Marek Nožka marek z@vináč tlapicka.net
# Licence: GNU/GPL
# Úloha: Jednoduchá kompilace zdrojového kódu v jazyce C
# Popis: Skript najde nejnovější soubor .c a zkompiluje jej.
#

#GCCFLAGS="-Wall -std=c99 -pedantic -g -lm"

CC="clang"
CCFLAGS="-Wall -Wextra -std=c99 -g"

######################################################################
#                          FUNKCE                                    #
######################################################################

##.................................................................###
# funkce vytiskne help
printHelp() {
cat <<EOF
Skript $0
slouží pro jednoduchou kompilaci zdrojového kódu.

easymake.sh [-c] [ [ zdroják.c || /adresar/se/zdrojakem ] jmenoBinarky ]

Pokud není zadáno jménoBinárky bude použito jméno zdojového souboru
bez přípony. Binárka se ukláda vždy do stejného adresáře jako je zdroják.

Pokud není zadáno jmého zdrojového souboru ale /adresar/se/zdrojakem, 
hledá se v tomto adresáři nejnovější soubor s příponocu .c.

Pokud není zadán žádný paremetr použije se nejnovější soubor 
s příponou .c v pracovním adresáři.

-c   Přepínač zakáže spuštění právě vytvořeného
     spustitelného souboru.

EOF
}

##.................................................................###
#   funkce nastaví proměnnou VSTUP
nastavVSTUP() {  
# Pozor! $1 je parametr předaný funkci, ne skriptu
if [ -d $1 ]; then  # jeli jako parametr zadán adresář
    cd $1     
    VSTUP=$(ls -t *.c | head -n 1) # nejmladší .c soubor
elif [ -f $1 ]; then                # jeli jako parametr zadán soubor
    cd $(dirname $1); # přepnu se do adresáře, kde je zdroják
    VSTUP=$(basename $1)
fi
return 0
}

######################################################################
#                         Tělo skriptu. 
######################################################################
#
##.................................................................###
#        zpracování přepínačů příkazového řádku

for param in $@; do
    if [ $param == "-h" ] || [ $param == "--help" ]; then
        printHelp
        exit 0;
    fi
done

args=$(getopt --name $(basename $0) -o c -- "$@") || exit 1
eval set -- $args
# pokud existuje parametr -h nebo --help vytiskne help
for i in $@; do
    case $i in 
        -c)
            COMPILEONLY=1
            shift
            ;;
        --)
            shift
            ;;
    esac
done


# jestliže existuje parametr -c nebo --compile-only  bude se provádět
# jen kompilace a nebude se spouštět binárka

##.................................................................###
#        zpracování parametrů příkazového řádku
if [ $2 ]; then # je-li zadán výstup
    VYSTUP=$2
    nastavVSTUP $1;
else             
    if [ $1 ]; then  # je zadán vstup
        nastavVSTUP $1
    else
        VSTUP=$(ls -t *.c | head -n 1) # nejmladší .c soubor
    fi
    VYSTUP=$(basename $VSTUP .c)   # vystup se jmenuje jako vstup bez přípony
fi

if [ $VSTUP ] && [ $VYSTUP ]; then
    echo kompiluji $VSTUP do souboru $VYSTUP
    COMMAND="$CC $CCFLAGS -o $VYSTUP $VSTUP" 
    echo $GCC; 
    $COMMAND && RUN="true"
else 
    echo -e "ERROR: Nenašel jsem vstupní soubor\n\nHELP:"
    printHelp
    exit 1;
fi

if [ $RUN ];  then 
#    rm -f /tmp/binarka
    if [ -d ~/tmp ]; then
        ln -svf $PWD/$VYSTUP ~/tmp/binarka
    fi
fi

# binárka se spustí jestliže proběhla kompilace bez chyb a pokud 
if [ $RUN ] && ! [ $COMPILEONLY ]; then 
    echo -e "\n";
    echo "#------- ZACATEK PROGRAMU \"$VYSTUP\" ------#";
    ./$VYSTUP;
    RETURN=$?
    echo -e "#---------- KONEC PROGRAMU ----------#\n";
    exit $RETURN
fi

exit 0;
