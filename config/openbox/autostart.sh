#! /bin/sh

which numlockx && numlockx

if [[ -r ~/wallpapers/current ]] ; then
    feh --bg-center ~/wallpapers/current
fi

xset -b
xset r rate 195 35

xmodmap ~/.xmodmaprc

if which soulmebaby.sh 2>/dev/null >/dev/null ; then
    soulmebaby.sh & disown
elif which soulmebaby 2>/dev/null >/dev/null ; then
    soulmebaby & disown
fi

if which bmpanel 2>/dev/null >/dev/null ; then
    bmpanel & disown
fi
