#!/bin/zsh
#
# $ cd bin
# $ ln -s easyssh.sh user@server.tld
# $ user@server.tld # instead $ ssh user@server.tld 


if [ $TTY ]; then
    ssh $(basename $0) $@;
else
    urxvtcd -e ssh $(basename $0) $@;
fi
