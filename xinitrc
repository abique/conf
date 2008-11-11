#! /bin/bash

#urxvtd & disown
#~/wallpapers/random_wallpaper.sh
#{ sleep 6 && xmodmap ~/.xmodmaprc; } & disown

#xrdb -load ~/.Xdefaults
#xmodmap ~/.xmodmaprc

wm="$1"

if [[ "$wm" = "" ]] ; then
    wm=awesome
fi

case "$wm" in
    kde)
        exec ${KDEDIR}/bin/startkde;;
    openbox)
        exec openbox-session;;
    e)
        exec enlightenment_start;;
    compiz)
        exec compiz-manager;;
    ion|ion3)
        exec ion3;;
    awesome)
	~/conf/common_start.sh &
	awesome
	;;
    fluxbox)
        exec startfluxbox;;
    wmaker)
	exec wmaker;;
esac
