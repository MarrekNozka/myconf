#!/bin/zsh
# Soubor:  screenIdle.zsh
# Datum:   03.01.2020 11:06
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha: 
############################################################
AFTERTIME=100

#CHECKTIME=1

cd $(dirname $0)

idle=false
backlight=$(xbacklight -get)
AFTERTIME=$[ $AFTERTIME * 1000 ]
while true; do
    time_ms=$(./printIdle)
    if [[ $idle == false && $time_ms -gt $AFTERTIME ]] ; then
        idle=true
        backlight=$(xbacklight -get)
        xbacklight -set 0
    fi
    if [[ $idle == true && $time_ms -lt $AFTERTIME ]] ; then
        idle=false
        xbacklight -set $backlight
    fi
    sleep 1
done
