if [[ $1 = "kde" ]] ; then
    exec /usr/kde/3.5/bin/startkde
elif [[ $1 = "kde-svn" ]] ; then
    export PATH="/usr/kde/svn/bin:${PATH}"
    exec /usr/kde/svn/bin/startkde
elif [[ $1 = "openbox" ]] ; then
    exec openbox-session
elif [[ $1 = "fluxbox" ]] ; then
    exec startfluxbox
elif [[ $1 = "enlightenment" ]]; then
    exec enlightenment_start
else
    exec startfluxbox
fi
