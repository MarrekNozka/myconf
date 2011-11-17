#!/bin/zsh
# Soubor:  skeletonVIM_FILE_NAME
# Datum:   skeletonVIM_CREATION_CZDATETIME
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL 
# Úloha: 
# Popis:   
#

#######           HELP           ##########
# pokud existuje parametr -h vytiskne help
for param in $@; do
    if [ $param == "-h" ] || [ $param == "--help" ]; then
        cat <<EOF
Skript $0

EOF
        exit 0;
    fi
done

#######           SKRIPT         ##########

