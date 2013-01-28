#! /bin/bash

#urxvtd & disown
#~/wallpapers/random_wallpaper.sh
#{ sleep 6 && xmodmap ~/.xmodmaprc; } & disown

#xrdb -load ~/.Xdefaults
#xmodmap ~/.xmodmaprc

. ~/.bashrc

wm="$1"

if [[ "$wm" = "" ]] ; then
    wm=openbox
fi

case "$wm" in
    kde)
        exec ${KDEDIR}/bin/startkde;;
    openbox)
        exec openbox-session;;
    e)
        exec enlightenment_start;;
    ion|ion3)
        exec ion3;;
    fluxbox)
        exec startfluxbox;;
    compiz)
	~/.config/openbox/autostart.sh &
	urxvt &
        exec fusion-icon;;
    awesome)
	~/conf/common_start.sh &
	awesome
	;;
    fluxbox)
        exec startfluxbox;;
    wmaker)
	exec wmaker;;
    gnome)
	exec gnome-shell;;
esac
