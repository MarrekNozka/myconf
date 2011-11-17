#!/bin/bash
# Soubor: 
# Datum: 
# Autor: Marek Nožka marek z@vináč tlapicka.net
# Licence: GNU/GPL
# Úloha: 
# Popis:  


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

