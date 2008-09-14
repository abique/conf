#! /bin/bash

#urxvtd & disown
#~/wallpapers/random_wallpaper.sh
#{ sleep 6 && xmodmap ~/.xmodmaprc; } & disown

case "$1" in
    wmaker)
	exec wmaker;;
    kde)
        exec ${KDEDIR}/bin/startkde;;
    openbox)
        exec openbox-session;;
    fluxbox-svn)
        export FLUXBOX_SVN="TRUE"
        exec ${HOME}/local/bin/startfluxbox;;
    e)
        exec enlightenment_start;;
    compiz)
        exec compiz-manager;;
    ion|ion3)
        exec ion3;;
    awesome)
	exec awesome;;
    fluxbox|*)
        exec startfluxbox;;
esac
