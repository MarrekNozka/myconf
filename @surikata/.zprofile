# ~/.zprofile: executed by zsh for login shells.

# the default umask is set in /etc/login.defs
umask 026

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
    export PATH
fi

#if [ -d ~/lib/python/ ]; then
#    PYTHONPATH="${PYTHONPATH}:$HOME/lib/python/"
#    export PYTHONPATH
#fi

# do the same with MANPATH
if [ -d ~/man ]; then
    MANPATH=~/man${MANPATH:-:}
    export MANPATH
fi

# Agents
if [ $SSH_AUTH_SOCK ]; then
    echo "SSH-agetn is FORWARD!"
else
    echo "SSH-agetn RUN!"
    eval $(ssh-agent -s) 
fi

#if [ -z $GPG_AGENT_INFO ]; then
#    echo "gpg-agent run!"
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
