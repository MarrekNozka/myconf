# ~/.zprofile: executed by zsh for login shells.

export EDITOR="vim"
#export PAGER="less"
#export MANPAGER="less"
export PAGER="vimpager"
export MANPAGER="vimpager"

export GREP_COLORS='1;33'
#export GREP_OPTIONS='-P --color=auto'

export LESS='-r'

#loginsh=1
# the default umask is set in /etc/login.defs
umask 022

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
    PYTHONPATH="$HOME/bin/lib/python/"
    export PYTHONPATH
fi

# Agents
if [ $SSH_AUTH_SOCK ]; then
    echo "SSH-agetn is FORWARD!"
else
    echo "SSH-agetn RUN!"
    eval $(ssh-agent -s) 
fi

#if [ -z $GPG_AGENT_INFO ]; then
#    echo "gpg-agetn run!"
#    eval $(gpg-agent --daemon)
#fi

#
# Synchronizace
#echo "Synchronizovat? [A/n]"
#read ANONE
#if [ -z $ANONE ] || { [ $ANONE = a ] || [ $ANONE = A ]; }; then
##    ssh-add
#    synchronizuj
#fi

#unset loginsh
