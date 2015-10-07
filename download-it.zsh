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
files+=(.Xsession .Xsession-notion .Xsession-awesome)
files+=(.gvimrc)
files+=(.zprofile .zlogout)
## notion
files+=(.notion)
for f in $files; do
    cp -a ~/$f ./@$host
done
rm -R ./@$host/.notion/default-session-*
rm -Rf ./@$host/.notion/scripts/.git/
cd @$host
## awesome
[ -d ./.config ] || mkdir ./.config
cp -a ~/.config/awesome/ ./.config/
cd -
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
if [ -d ./.vim/backup ]; then 
    rm -Rf ./.vim/backup/
fi




####################################
### Binárky
binarky=()
binarky+=(regexcolor.pl regexcount.pl easymake.sh easyssh.sh)
binarky+=(xplanet.sh without.pl avi-x264-lame.sh video-z-fotaku.zsh)
binarky+=(chwall.sh prumer.pl without.pl spark rename4date.zsh)
binarky+=(ipython-wrapper.zsh svg2x.zsh)
binarky+=(screen.wrapper.zsh script-wrapper.zsh tmux.wrapper.zsh Tilda.zsh)
binarky+=(vim-remote.zsh)
binarky+=(auto-F5.zsh)
binarky+=(vimcat vimpager)

odkazy=()
odkazy+=(regexcolor regexcount)
odkazy+=(xplanet.sh without.pl avi-x264-lame video-z-fotaku.zsh) 
odkazy+=(chwall prumer.pl without.pl spark rename4date) 
odkazy+=(py py.black py.c py.inline py.kernel py.notebook pysh py.white)
odkazy+=(svg2png svg2pdf)
odkazy+=(bagr meloun forge Tilda programming script-wrapper) 
odkazy+=(auto-F5)
odkazy+=(vimcat vimpager)

echo "######## binaries #########"
[ -d ./bin ] || mkdir bin
for file in $binarky; do
    cp -a ~/bin/$file ./bin
done

[ -d ./bin/bin ] || mkdir bin/bin
for file in $odkazy; do
    cp -a ~/bin/bin/$file ./bin/bin
done

