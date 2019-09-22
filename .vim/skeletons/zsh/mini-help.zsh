#!/bin/zsh
# Soubor:  skeletonVIM_FILE_NAME
# Datum:   skeletonVIM_CREATION_CZDATETIME
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL 
# Úloha: 
# Popis:   
#

#######           HELP           ##########
printHelp() {
cat <<EOF
Skript $0
slouží pro jednoduchou kompilaci zdrojového kódu.

EOF
}
# pokud existuje parametr -h vytiskne help
for param in $@; do
    if [[ $param == "-h" ]] || [[ $param == "--help" ]]; then
        printHelp
        exit 0;
    fi
done

#######           SKRIPT         ##########


if [[ $0 =~ 'enable' ]]; then
    sleep
fi
