case "$1" in
    kde) 
            source ~/.bash.d/kde-env.bash &&
            exec /usr/kde/3.95.2/bin/startkde;;
    openbox) 
            exec openbox-session;;
    fluxbox-svn)
            echo pouet > titi
            exec ${HOME}/local/bin/startfluxbox;;
    e)
            exec enlightenment_start;;
    compiz) 
            xfce4-panel &
            exec compiz-manager;;
    ion)
            exec ion3;;
    awesome)
	    exec awesome;;
#    fluxbox|*)
#            exec /usr/bin/startfluxbox;;
esac
