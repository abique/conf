#! /bin/bash

which numlockx >/dev/null 2>/dev/null && numlockx
setxkbmap -model evdev -layout us -variant altgr-intl -option -option ctrl:nocaps
xrdb -load ~/.Xdefaults
xset b off
xset r rate 175 30

# apps
xfce4-notifyd & disown
if which nm-applet ; then
  nm-applet & disown
fi
