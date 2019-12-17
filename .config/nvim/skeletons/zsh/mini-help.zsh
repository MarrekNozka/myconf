#!/bin/zsh
# Soubor:  skeletonVIM_FILE_NAME
# Datum:   skeletonVIM_CREATION_CZDATETIME
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL 
# Úloha: 
# Popis:   


name=$(basename $0)
# pokud existuje parametr -h vytiskne help
for param in $@; do
    if [[ $param == "-h" ]] || [[ $param == "--help" ]]; then
        cat <<EOF
Skript $name
slouží ..


$name [] <>

EOF
        exit 0;
    fi
done

#######           SKRIPT         ##########


if [[ $0 =~ 'enable' ]]; then
    sleep
fi
