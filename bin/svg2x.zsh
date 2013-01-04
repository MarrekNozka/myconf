#!/bin/zsh
# Soubor:  svg2x.zsh
# Datum:   04.01.2013 12:20
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL 
# Úloha:   konvertuje SVG na PNG/PDG, zachovává poměr stran
#

#######           HELP           ##########
printHelp() {
cat <<EOF
    svg2png [-T] geom soubor.svg
    svg2pdf [-T] geom soubor.pdf

    svg2png 800x600 soubor.svg

    -T povolí průhlednost
EOF

}
# pokud existuje parametr -h vytiskne help
for param in $@; do
    if [[ $param == "-h" ]] || [[ $param == "--help" ]]; then
        printHelp
        exit 0;
    fi
done
#####
if [ -z $2 ]; then
    printHelp
    exit 0;
fi

#######           SKRIPT         ##########

dstGeometry=$1
WH=("${(s/x/)dstGeometry}")
dstW=$WH[1]
dstH=$WH[2]
srcGeometry=${$(identify $2)[3]}
WH=("${(s/x/)srcGeometry}")
srcW=$WH[1]
srcH=$WH[2]

if [[ $srcW -gt $srcH ]]; then
    geometry="-w $dstW"
else
    geometry="-h $dstH"
fi

#############################################################

transp=(-y 1)
# zpracuje parametry příkazového řádku
args=$(getopt --name $(basename $0) -o T -- "$@") || exit 1
# zpracované parametry předá zpět do $@ a $*
eval set -- $args
# projde a posune parametry
while true; do
    i=$1
    case $i in 
        -T)
            transp=''
            shift
            ;;
        --)
            shift
            break ; # tohle byl poslední...
            ;;
    esac
done

#############################################################

if [[ $0 =~ pdf ]]; then 
    destination=(-A $(basename $2 .svg).pdf)
else
    destination=(-e $(basename $2 .svg).png)
fi

#############################################################

eval inkscape $geometry $transp $destination $2

