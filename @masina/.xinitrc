#!/bin/sh -f

cd ~

export EDITOR="vim"
export PAGER="less"

xmodmap ~/.Xmodmap
numlockx on

#/usr/bin/gnome-session

#Run the ION3 window manager

trayer --width 7 --expand true  --SetDockType true --SetPartialStrut true &
display -window root /home/marek/Grafika/pozadi/straznice.png
remind '-zkxmessage %s &' &
#gnutu&
psi&
akregator&
#gajim&
#tkabber&
gkrellm &
sylpheed&
#straw&
#amor&

/usr/bin/ion3
#/usr/bin/xfce4-session
