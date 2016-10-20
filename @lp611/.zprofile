# ~/.zshrc
loginsh=1

export EDITOR="vim"
#export EDITOR="nano"
#export EDITOR="mcedit"
export PAGER="vimpager"

# the default umask is set in /etc/login.defs
umask 022

if [ -d /home/bin ] ; then
    PATH=/home/bin:"${PATH}"
    export PATH
fi
# set PATH so it includes user's private bin if it exists
if [ -d ~/bin/bin ] ; then
    PATH=~/bin/bin:"${PATH}"
    export PATH
fi
# do the same with MANPATH
if [ -d ~/man ]; then
    MANPATH=~/man${MANPATH:-:}
    export MANPATH
fi

if [ -d ~/bin/lib/python/ ]; then
    PYTHONPATH="${PYTHONPATH}:$HOME/bin/lib/python/"
    export PYTHONPATH
fi

# SSH Agent
#eval $(ssh-agent) 

#unset loginsh
