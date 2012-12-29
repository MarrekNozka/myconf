# ~/.zprofile: executed by zsh for login shells.

export EDITOR="vim"
export PAGER="less"

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'
export LESS='-r'

loginsh=1
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

# Agents
#if [ -z $SSH_AGENT_PID ]; then
    echo "ssh-agetn run!"
    eval $(ssh-agent -s) 
#fi

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
