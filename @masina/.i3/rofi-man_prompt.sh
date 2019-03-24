#!/usr/bin/env bash

HISTFILE=~/.cache/rofi/man_script_history
HISTCOUNT=14
TERMINAL=urxvtcd

if [ ! -d $(dirname "$HISTFILE") ]; then
    mkdir -p "$(dirname "$HISTFILE")"
fi


if [ -z "$@" ]; then     # generate list of choice
    cat "$HISTFILE"
    man -k .
else                     # process the choice
    # histiry
    sed -i "\|$@|d" "$HISTFILE"
    sed -i "1i $@" "$HISTFILE"
    sed -i "$[$HISTCOUNT + 1],\$d" "$HISTFILE"

    # lunch
    manpage=$(awk '{ print $2 " " $1 }' <<< $@ | tr -d '()')
    exec $TERMINAL -e man $manpage
fi
