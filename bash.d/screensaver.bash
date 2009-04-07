#! /bin/sh
xscreensaver-command -lock || { xscreensaver & disown && sleep .5 && xscreensaver-command -lock;}
