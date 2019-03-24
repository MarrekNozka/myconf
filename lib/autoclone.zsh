#!/bin/zsh
# Soubor:  autoclone.zsh
# Datum:   19.10.2017 14:55
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha:   naklonuje repositář a přepne se do něj
#          klonuje repositář uložený v clickbordu
############################################################


if ! command xsel >/dev/null; then
    echo něco mi chybí
    echo apt install xsel '||' apt install xclip
    exit(1)
fi


args=$(getopt --name $(basename $0) -o htd: -- "$@")
eval set -- $args   # převede $args zpět do pozičních parametrů
while true; do
    case $1 in 
        -h)
            cat <<EOF

Jak použít autoclone
---------------------

autoclone klonouje REPO, jehož URL je X-schránce.

clonování se provede v aktuálním adresáři
    $ autoclone

clonování se provede v adresáři <destination>
    $ autoclone -d destination

clonování se provede v adresáři /tmp
    $ autoclone -t

EOF
            return 0
            shift
            ;;
        -t)
            cd /tmp
            shift
            ;;
        -d)
            shift
            cd $1
            shift
            ;;
        --)
            shift
            break ; # tohle byl poslední...
            ;;
    esac
done


REPO=$(xsel)
if [ $1 ]; then
    ADR=$1
else
    ADR=$(basename $REPO .git)
fi

git clone $REPO $1 || {
    cat <<EOF
Klonování se nepovedlo. Ve schránce je uloženo toto:
>>>$REPO<<<
Zdá se, že to není repositář, který by uměl git naklonovat.

EOF
}

# aby bylo možné přejít do adresáře, který jsem právě naklonoval
# musím si udělat alias autoclone='source autoclone.zsh'
if [[ $0 =~ 'autoclone.zsh' ]]; then
    cd $ADR
else
# pokud se nemůžu do adresáře přepnout alespoň dám do schránky příkaz na přepnutí
    xsel -i <<<"cd $ADR"
fi
