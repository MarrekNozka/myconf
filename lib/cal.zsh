#!/bin/zsh
# Soubor:  cal.zsh
# Datum:   17.03.2012 23:03
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha: 
############################################################

den=$(date +%-d)

if [[ $1 == '-t' ]]; then
    ncal -3Mhw | sed -r \
        -e "/^So/i-------------------------------------------------------" \
        -e "/^Ne/a-------------------------------------------------------" \
        -e "s/(.{16}) $den (.{16})/\\1\*$den\*\\2/g" \
        | head -n -1
    
else
    ncal -3Mhw | sed -r \
        -e "/^So/i-------------------------------------------------------" \
        -e "/^Ne/a-------------------------------------------------------" \
        | regexcolor "^(Po|St|Pá).*$" bold "(?<=.{20})\b$den\b(?=(\s+\d+\s*){4})" reverse \
        | head -n -1  # poslední řádek neobarvuju
fi
ncal -3Mhw | tail -n 1 # vypíšu poslední řádek
