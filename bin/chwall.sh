#!/bin/bash
# File:    chwall.sh
# Date:    11.11.2011
# Author:  Marek Nožka, marek <@t> tlapicka <d.t> net
# Base on: Michal Pemčák: http://xbl7.skauting.cz/Navody/bgchanger/
# Licence: GNU/GPL 
# Task:    Change wallpaper
# Description:
#       Download random image from Google images, resize it
#       and wallpapering it.
############################################################

if [ -z $1 ]; then 
    echo "Hello. I'm ChWall"
    echo "I'm changing your wallpaper."
    echo -ne "\n\t\$ chwall theme words for search"
    echo -ne "\n\t\$ chwall star universe space\n"
    exit 0;
fi

img="$HOME/img"

# čte počet obrázku z příkazovky
for i in "$@"; do
    if echo $i | egrep '^-' &>/dev/null; then
        MAX=${i#-} # oříznu -
    fi
done
MAX=${MAX-22}

RRRANDOM=$(od -An -N2 -i /dev/random);
COUNT=$[ ($RRRANDOM % $MAX) + 1 ] 

echo count: $COUNT


url=$(
w3m -dump_source \
    "http://www.google.com/search?q=$(echo $* | sed 's/ /+/g')&tbm=isch&tbs=isz:lt,islt:2mp&start=$[$RANDOM % 33]" | \
     sed -r -e 's/http:/\nhttp:/ig' -e 's/(jpe?g|png)/\1\n/ig' |\
     egrep -i '^http:[^ ]+(jpe?g|png)$' | \
     head -n 1 
)


wget -O $img "$url"

identify $img

RESOLUTION=$(xrandr 2>/dev/null | egrep '\*' | awk '{print $1;}' )
mogrify -resize "$RESOLUTION>" $img
#display  -backdrop -window root $img
awsetbg -c $img

