#! /bin/sh

which numlockx && numlockx
if [[ -r ~/wallpapers/current ]] ; then
    feh --bg-center ~/wallpapers/current
fi
xmodmap ~/.xmodmaprc
xrdb -load ~/.Xdefaults

xset -b
xset r rate 175 30

if which soulmebaby.sh 2>/dev/null >/dev/null ; then
    soulmebaby.sh & disown
elif which soulmebaby 2>/dev/null >/dev/null ; then
    soulmebaby & disown
fi
