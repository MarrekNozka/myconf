#!/bin/bash
# Soubor:  skeletonVIM_FILE_NAME
# Datum:   skeletonVIM_CREATION_CZDATETIME
# Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
# Licence: GNU/GPL 
# Úloha: 
# Popis:   
# 

echo "content-type:text/plain; charset=utf-8"
echo 
echo "<h1>toto je můj CGI skriptík</h1>"

echo $REQUEST_METHOD
if [ $REQUEST_METHOD == 'GET' ]; then 
	echo $QUERY_STRING
fi

if [ $REQUEST_METHOD == 'POST' ]; then 
	cat /dev/stdin
fi


#prikaz=$(echo $QUERY_STRING | sed 's/^.*prikaz=\([^&]*\)&.*$/\1/g')
#parametry=$(echo $QUERY_STRING | sed 's/^.*parametry=\([^&]*\)&.*$/\1/g')
#
#echo ========================================
#echo $prikaz $parametry
#echo ========================================
#$prikaz $parametry
#

