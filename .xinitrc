if [[ $1 = "kde" ]] ; then
    exec startkde
elif [[ $1 = "openbox" ]] ; then
    exec openbox-session
elif [[ $1 = "fluxbox" ]] ; then
    exec startfluxbox
elif [[ $1 = "enlightenment" ]]; then
    exec enlightenment_start
else
    exec startfluxbox
fi
