#!/bin/zsh
# Soubor:  rename4date.zsh
# Datum:   29.10.2011 17:25
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha:   přejmenuje soubory podle časového razítka
#          
############################################################


for i in $@; do  
    cd $(dirname $i)
    echo mv $(LC_TIME=C ls --time-style=+%Y%m%d-%a -l $(basename $i) | awk '{print $7 " " $6 "-" $7 }')
    cd -
done
