#!/bin/zsh
# Soubor:  video-z-fotaku.zsh
# Datum:   09.06.2012 15:19
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL 
# Úloha:  
# Popis:   
#

#######           HELP           ##########
# pokud existuje parametr -h vytiskne help
if [ -z $1 ] || [[ $1 == "-h" ]]; then
    cat <<EOF
Skript $0 převádí video do AVIčka h264 bitrate=1100 kbps, 
                        mp3lame mono bitrate=64 kbps

EOF
    exit 0;
fi

#######           SKRIPT         ##########

for vstup in $@; do
        
#**      1. PASS         **
    mencoder $vstup -o /dev/null -oac mp3lame -lameopts cbr:br=64:mode=3:aq=0 -ovc x264 -x264encopts bitrate=1100:pass=1:turbo=1:qcomp=0.8:frameref=3:bframes=3:subq=5:me=hex:weight_b:partitions=all:8x8dct 

#**     2/3. PASS        **
    mencoder $vstup -o out123abc.avi -oac mp3lame -lameopts cbr:br=64:mode=3:aq=0 -ovc x264 -x264encopts bitrate=1100:pass=2:qcomp=0.8:frameref=3:bframes=3:subq=5:me=hex:weight_b:partitions=all:8x8dct

    mv out123abc.avi "$(without.pl $vstup).avi"
done
