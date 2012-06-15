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
# pokud existuje parametr -h vytiskne help a končí
for param in $@; do
    if [ $param == "-h" ] || [ $param == "--help" ]; then
        cat <<EOF
Skript $0

EOF
        exit 0;
    fi
done

#######           SKRIPT         ##########


aopt=false
bopt=false
barg=""

while getopts 'ab:' opt; do
  case "$opt" in
    a)
      aopt=true ;;
    b)
      bopt=true
      barg=$OPTARG ;;
  esac
done

if $aopt; then
  echo "Zadali jste přepínač -a"
fi

if $bopt; then
  echo "Zadali jste přepínač -b s argumentem $barg"
fi


#################  NEBO  #####################
while getopts  "abc:def:ghi" flag; do
  echo "$flag" $OPTIND $OPTARG
done
echo "Resetting"
OPTIND=1
while getopts  "abc:def:ghi" flag; do
  echo "$flag" $OPTIND $OPTARG
done

