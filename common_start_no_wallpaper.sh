#! /bin/sh

which numlockx && numlockx
setxkbmap -model evdev -layout us -variant altgr-intl -option -option ctrl:nocaps
xrdb -load ~/.Xdefaults
xset -b off
xset r rate 175 30

# nm-applet & disown
