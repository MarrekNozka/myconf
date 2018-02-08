#!/bin/sh
# Soubor:  počasí.zsh
# Datum:   06.04.2016 11:31
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
############################################################

misto=$*
if [ -z $misto ]; then
    misto="Bystřice+pod+Hostýnem"
fi

exec curl -H "Accept-Language: cs, en;q=0.777" "http://wttr.in/$misto"
