#!/bin/zsh
# Soubor:  download-it.zsh
# Datum:   01.09.2011 12:33
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
# Úloha:   downloat files form ~ to .
############################################################
setopt EXTENDED_GLOB

cd $(dirname $0)

### Konfiguráky závislé na hostitelské stanici
host=$(hostname | sed -r -e "s/^([^.]+).*$/\1/")

[ -d $host ] || mkdir @$host
for file in .Xdefaults .Xresources .Xsession .xinitrc .Xmodmap; do
    cp -av ~/$file ./@$host
done

### shell Vim a TeX
for file in .aliases .zshrc .dir_colors .vimrc .vimperatorrc .gvimrc texmf/ ; do
    cp -av ~/$file ./
done

[ -d ./.vim ] || mkdir .vim
cp -av ~/.vim/.*~*.netrwhist ~/.vim/*~*(backup|viminfo|.zip|vba) ./.vim/
if [ -d ./.vim/backup ]; then 
    rm ./.vim/backup/*
else
    mkdir ./.vim/backup/
    rm -Rf ./.vim/backup/* ./.vim/backup/.*
fi


## awesome
[ -d ./.config ] || mkdir .config
cp -av ~/.config/awesome/ ./.config/


####################################
### Binárky
binarky="regexcolor.pl regexcount.pl easymake.sh easyssh.sh"
binarky="$binarky xplanet.sh"

odkazy="regexcolor regexcount"
odkazy="$odkazy xplanet.sh"

echo "######## binaries #########"
[ -d ./bin ] || mkdir bin
for file in  $(eval echo $binarky); do
    cp -av ~/bin/$file ./bin
done

[ -d ./bin/bin ] || mkdir bin/bin
for file in $(eval echo $odkazy); do
    cp -av ~/bin/bin/$file ./bin/bin
done

