if [[ $1 = "kde" ]] ; then
    exec startkde
elif [[ $1 = "openbox" ]] ; then
    exec openbox-session
elif [[ $1 = "fluxbox" ]] ; then
    exec startfluxbox
else
    exec startfluxbox
fi
