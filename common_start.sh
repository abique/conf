#! /bin/bash

if [[ -r ~/wallpapers/current ]] ; then
    feh --bg-scale ~/wallpapers/current
fi
. ~/conf/common_start_no_wallpaper.sh
