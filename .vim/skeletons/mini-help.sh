#!/bin/bash
# File:    skeletonVIM_FILE_NAME
# Date:    skeletonVIM_CREATION_CZDATETIME
# Author:  Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL 
# Task: 
# Description:
#
############################################################

#######           HELP           ##########
# pokud existuje parametr -h vytiskne help
for param in $@; do
    if [ $param == "-h" ] || [ $param == "--help" ]; then
        cat <<EOF
Skript $0

EOF
        exit 0;
    fi
done

#######           SKRIPT         ##########

