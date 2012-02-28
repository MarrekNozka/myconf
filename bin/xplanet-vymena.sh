#!/bin/bash
# Soubor:  xplanet-vymena.sh
# Datum:   12.01.2011 21:12
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha: vymění xplanet obrázek na ploše
############################################################

kill $(cat $XPLANET_PID_FILE)


#display -window root /home/marek/Grafika/pozadi/straznice.png
#xplanet -target europa -origin earth -radius 7&
#xplanet -target europa -radius 7&
#xplanet -target saturn -radius 22 -rotate 11&
#xplanet -target earth -longitude 21 -latitude 21 -radius 43 &
#xplanet -target moon -origin marz -radius 10&
RRRANDOM=$(od -An -N2 -i /dev/random);
LONGITUDE=$[ ($RRRANDOM % 360) - 180 ] 
LATITUDE=$[ ($RRRANDOM % 130) - 65 ] 
ROTATE=$[ ($RRRANDOM % 180) ] 
RADIUS=$[ ($RRRANDOM % 20) + 8 ] 
XPLANETCMD=(
"xplanet -target moon -origin neptune -radius 5 -rotate 20"
"xplanet -target moon -radius 3 -rotate 20"
"xplanet -target moon -longitude $LONGITUDE -latitude $LATITUDE -radius 7 -rotate 20"
"xplanet -target moon -origin neptune -radius 5 -rotate 20"
"xplanet -target moon -radius 3 -rotate 20"
"xplanet -target moon -longitude $LONGITUDE -latitude $LATITUDE -radius 7 -rotate 20"
"xplanet -target earth -longitude $LONGITUDE -latitude $LATITUDE -radius 33"
"xplanet -target earth -longitude 21 -latitude 21 -radius 30"
"xplanet -target earth -origin moon -radius 13"
"xplanet -target earth -origin neptune -radius 13"
"xplanet -target earth -longitude $LONGITUDE -latitude $LATITUDE -radius 33"
"xplanet -target earth -longitude 21 -latitude 21 -radius 30"
"xplanet -target earth -origin moon -radius 13"
"xplanet -target earth -origin neptune -radius 13"
"xplanet -target io -origin moon -radius 5 "
"xplanet -target europe -origin moon -radius 5 "
"xplanet -target callisto -origin moon -radius 3 "
"xplanet -target ganymede -origin moon -radius 3 "
"xplanet -target saturn -radius 22"
"xplanet -target titan -radius 8 "
"xplanet -target mercury -radius $RADIUS"
"xplanet -target venus -radius $RADIUS"
"xplanet -target mars -radius $RADIUS"
"xplanet -target uranus -radius $RADIUS"
"xplanet -target neptune -radius $RADIUS"
"xplanet -target pluto -radius $RADIUS"
"xplanet -target sun -radius 1"
)
DELKA=${#XPLANETCMD[@]}
INDEX=$[ $RANDOM % $DELKA ]
#INDEX=6
ROTATE=$[ $RANDOM % 70 ]
nice -n 19 ${XPLANETCMD[$INDEX]} -rotate $ROTATE &
XPLANETPID=$!

echo ${XPLANETCMD[$INDEX]}
echo XPLANETINDEX=$INDEX
echo XPLANETROTATE=$ROTATE
echo XPLANETPID=$XPLANETPID
echo $XPLANETPID >$XPLANET_PID_FILE

# vim:nospell:
