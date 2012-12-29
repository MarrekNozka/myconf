#!/bin/zsh
# Soubor:  use-it.zsh
# Datum:   29.10.2011 22:48
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha:   install files from . to ~
############################################################
setopt EXTENDED_GLOB

cd $(dirname $0)

cp -av .*~.git* *~*-it.zsh~README~@* ~

### Konfiguráky závislé na hostitelské stanici
host=$(hostname | sed -r -e "s/^([^.]+).*$/\1/")
#cp -av ./@$host/.* ./@$host/* ~
cp -av ./@$host/.*  ~

if ! [ -d ~/.vim/backup/ ]; then
    mkdir ~/.vim/backup/
fi

