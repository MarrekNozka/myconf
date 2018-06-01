#!/bin/bash
#
# $ cd bin
# $ ln -s easyssh.sh user@server.tld
# $ user@server.tld # instead $ ssh user@server.tld 
#

#exec ssh $(basename $0) $@;
ssh $(basename $0) $@;
