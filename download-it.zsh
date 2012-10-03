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

[ -d @$host ] || mkdir @$host
for file in .Xdefaults .Xresources .Xsession .xinitrc .Xmodmap; do
    cp -av ~/$file ./@$host
done
cd @$host
## awesome
[ -d ./.config ] || mkdir ./.config
cp -av ~/.config/awesome/ ./.config/
cd -
###############################################

### shell Vim a TeX
for file in .aliases .zshrc .dir_colors .vimrc .vimperatorrc .gvimrc texmf/ ; do
    cp -av ~/$file ./
done

[ -d ./.vim ] || mkdir .vim
cp -av ~/.vim/.*~*.netrwhist ~/.vim/*~*(backup|viminfo|.zip|.tmp|vba) ./.vim/
if [ -d ./.vim/backup ]; then 
    rm  ./.vim/backup/*
else
    mkdir ./.vim/backup/
    rm -Rf ./.vim/backup/* ./.vim/backup/.*
fi




####################################
### Binárky
binarky="regexcolor.pl regexcount.pl easymake.sh easyssh.sh"
binarky="$binarky xplanet.sh without.pl avi-x264-lame.sh video-z-fotaku.zsh"
binarky="$binarky chwall.sh prumer.pl without.pl spark rename4date.zsh"
binarky="$binarky ipython-wrapper.zsh"
binarky="$binarky screen.wrapper.zsh"

odkazy="regexcolor regexcount"
odkazy="$odkazy xplanet.sh without.pl avi-x264-lame video-z-fotaku.zsh" 
odkazy="$odkazy chwall prumer.pl without.pl spark rename4date" 
odkazy="$odkazy py py.black py.c py.inline py.kernel py.notebook pysh py.white"
odkazy="$odkazy bagr meloun forge Tilda" 

echo "######## binaries #########"
[ -d ./bin ] || mkdir bin
for file in  $(eval echo $binarky); do
    cp -av ~/bin/$file ./bin
done

[ -d ./bin/bin ] || mkdir bin/bin
for file in $(eval echo $odkazy); do
    cp -av ~/bin/bin/$file ./bin/bin
done

