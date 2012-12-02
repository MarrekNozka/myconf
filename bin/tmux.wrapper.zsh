#!/bin/zsh
# Soubor:  tmux.wrapper.zsh
# Datum:   02.12.2012 22:13
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL 
# Úloha:   easy run tmux
#
######################################################################
#                         Proměnné                                   #
######################################################################

detach='-d'
######################################################################
#                          FUNKCE                                    #
######################################################################

##.................................................................###
# funkce vytiskne help
printHelp() {
cat <<EOF
Skript $0
    wrapper for tmux
    create session named $(basename $0)

    OPIONS
     -d  detach original session
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
#args=$(getopt --name $(basename $0) -o ab:c -- "$@") || exit 1
args=$(getopt --name $(basename $0) -o d -- "$@") || exit 1
# zpracované parametry předá zpět do $@ a $*
eval set -- $args
# projde a posune parametry
while true; do
    case $1 in 
#        -b)
#            shift
#            echo "volba -b je \"$1\""
#            shift
#            ;;
        -d)
            shift
            detach=''
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

name=$(basename $0)

if  tmux has-session -t $name ; then 
    tmux attach $detach -t $name 
else
    tmux new-session -d -s $name -n Shell
#    tmux new-window -t Tilda -n Shell zsh
#    tmux new-window -t Tilda -n IPython "py ; zsh"
#    tmux new-window -t Tilda -n MC  "mc ; zsh"
#    tmux select-window -t Tilda:0 
    tmux attach-session -t $name
fi
