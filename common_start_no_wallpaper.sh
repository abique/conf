#! /bin/bash

which numlockx >/dev/null 2>/dev/null && numlockx
setxkbmap -model evdev -layout us -variant altgr-intl -option -option ctrl:nocaps
xrdb -load ~/.Xdefaults
xset b off
xset r rate 175 30

# apps

if which xfce4-notifyd 2>/dev/null ; then
    xfce4-notifyd & disown
fi

if which nm-applet 2>/dev/null ; then
    nm-applet & disown
fi
