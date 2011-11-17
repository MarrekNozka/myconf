#!/bin/zsh
# Soubor:  download-it.zsh
# Datum:   01.09.2011 12:33
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha:   downloat files form ~ to .
############################################################
setopt EXTENDED_GLOB

cd $(dirname $0)

### Konfiguráky závislé na hostitelské stanici
host=$(hostname | sed -r -e "s/^([^.]+).*$/\1/")

rm -Rf ./.aliases bin ./.config ./.*vim* ./.z* ./texmf/
rm -Rf ./@$host
