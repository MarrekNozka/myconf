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
files=()
files+=(.Xdefaults .Xresources .xinitrc .Xmodmap)
files+=(.Xsession)
files+=(.gvimrc)
files+=(.zprofile .zlogout)
## i3 
files+=(.i3)

for f in $files; do
    cp -a ~/$f ./@$host
done
#
###############################################

### Shell, Vim,  TeX, colors
files=(.gmrunrc)
files+=(.aliases .zshrc .dir_colors .terminfo)
files+=(.vimrc .vimperatorrc .vimpagerrc .vimcatrc)
files+=(texmf/ .tmux.conf)
for f in $files; do
    cp -a ~/$f ./
done

[ -d ./.vim ] || mkdir .vim
cp -a ~/.vim/.*~*.netrwhist ~/.vim/*~*(backup|viminfo|.zip|.tmp|vba|.git) ./.vim/
rm -Rf .vim/bundle/**/.git       
rm -Rf .vim/bundle/**/.gitignore      
if [ -d ./.vim/backup ]; then 
    rm -Rf ./.vim/backup/*
fi


adr=".config/nvim"
[ -d $adr ] || mkdir -p $adr
cp -a ~/$adr/*~*plugged $adr

adr=".config/ranger"
[ -d $adr ] || mkdir -p $adr
cp -a ~/$adr/*~*.git $adr

adr=".config/openbox"
[ -d $adr ] || mkdir -p $adr
cp -a ~/$adr/*~*.git $adr

####################################
### Binárky

echo "######## binaries #########"
[ -d ./bin ] || mkdir bin
for file in asf2mp3 asf2ogg prumer.pl term without.pl p2or3 \
            pocasi počasí psql-drop.user.db psql-create.user.db \
            autoclone cal. vimcat vimpager forge melou oliva; do
    cp -a ~/bin/$file ./bin
done

[ -d ./lib ] || mkdir ./lib 
for file in autoclone.zsh cal.zsh pocasi.sh psql-wrapper.zsh \
    tmux.wrapper.zsh regexcolor.pl regexcount.pl \
    easymake.sh easyssh.sh; do
    cp -a ~/lib/$file ./lib
done

for dir in  forgit zsh-fzy; do
    [ -d ./lib/$dir ] || mkdir ./lib/$dir
    cp -a ~/lib/$dir/*~*.git ./lib/$dir
done
