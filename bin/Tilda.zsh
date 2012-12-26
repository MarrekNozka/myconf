#!/bin/zsh
# Soubor:  Tilda.zsh
# Datum:   01.12.2012 23:23
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha:   tmux for Tilda
############################################################

if [[ $TERM =~ 'xterm' ]] || [[ $1 == '-2'  ]]; then
    alias tmux='tmux -2'
fi

if  tmux has-session -t Tilda ; then 
    tmux attach -d -t Tilda
else
    tmux new-session -d -s Tilda -n Root zsh
    tmux new-window -t Tilda -n Shell zsh
    tmux new-window -t Tilda -n IPython "py.kernel; py ; zsh"
    tmux new-window -t Tilda -n MC  "mc ; zsh"
    tmux select-window -t Tilda:0 
    tmux attach-session -t Tilda
fi

