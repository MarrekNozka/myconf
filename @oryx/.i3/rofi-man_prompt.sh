#!/usr/bin/env zsh

HISTFILE=~/.cache/rofi/man_script_history
HISTCOUNT=14
TERMINAL=urxvtcd
export PAGER=vimpager
export VIMPAGER_VIM=nvim

if [ ! -d $(dirname "$HISTFILE") ]; then
    mkdir -p "$(dirname "$HISTFILE")"
fi
if [ ! -s "$HISTFILE" ]; then
    echo ls >"$HISTFILE"
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
    if [[ $0 =~ 'mankier' ]]; then
        manpage=$(awk '{ print $2 "/" $1 }' <<< $@ | tr -d '()')
        eval "exec x-www-browser https://mankier.com/$manpage &>/dev/null"
    else
        manpage=$(awk '{ print $2 " " $1 }' <<< $@ | tr -d '()')
        eval "exec $TERMINAL -e man $manpage"
    fi
fi
