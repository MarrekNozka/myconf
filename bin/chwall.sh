#!/bin/bash

echo "Hello. I'm ChWall"

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

