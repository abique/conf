if [[ $1 = "kde" ]] ; then
    exec /usr/kde/3.5/bin/startkde
elif [[ $1 = "kde-svn" ]] ; then
    source /home/babali/kde.env
    eval `dbus-launch --auto-syntax`
    xterm &
    exec /usr/kde/svn/bin/startkde 
elif [[ $1 = "openbox" ]] ; then
    exec openbox-session
elif [[ $1 = "fluxbox" ]] ; then
    exec startfluxbox
elif [[ $1 = "e" ]]; then
    exec enlightenment_start
elif [[ $1 = "compiz" ]] ; then
    exec compiz-start
else
    exec startfluxbox
fi
