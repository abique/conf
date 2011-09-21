#! /bin/bash

~/conf/random_wallpaper.sh
. ~/conf/common_start_no_wallpaper.sh
psi & disown
xfce4-notifyd & disown
kmix & disown
ibus-daemon --replace & disown
