#! /bin/sh

which numlockx && numlockx
setxkbmap -model evdev -layout us -variant altgr-intl
setxkbmap -option -option ctrl:nocaps
xrdb -load ~/.Xdefaults
xset -b
xset r rate 175 30