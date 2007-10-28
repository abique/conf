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
    if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
    # if not found, launch a new one
        eval `dbus-launch --sh-syntax --exit-with-session`
    fi
    exec compiz-manager ccp
else
    exec startfluxbox
fi
