#!/bin/zsh
# Soubor:  band.zsh
# Datum:   04.03.2019 21:40
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha: 
############################################################

TIME=$1
INTERFACE=$(ip route | awk '/^default/ { print $5 ; exit }')

IO=($(ifstat -i $INTERFACE $TIME 1 | tail -1 ))


print "$INTERFACE: $IO[1]/$IO[2] kB/s"
print "$INTERFACE: $IO[1]/$IO[2]"
