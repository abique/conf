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
        exec ck-launch-session openbox-session;;
    e)
        exec ck-launch-session enlightenment_start;;
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
	exec ck-launch-session wmaker;;
    gnome)
	exec ck-launch-session gnome-shell;;
esac
