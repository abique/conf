unset KDE_IS_PRELINKED
export KDEDIR=/usr/kde/3.95.0
export KDEDIRS=/usr:/usr/local:$KDEDIR
export QTEST_COLORED=1
export QT_PLUGIN_PATH=$KDEDIR/lib/kde4/plugins/
export PATH=$KDEDIR/bin:$PATH
export LD_LIBRARY_PATH="$KDEDIR/lib:$LD_LIBRARY_PATH"
export XDG_DATA_DIRS=/usr/share:${PREFIX}/share:/usr/local/share
export XDG_CONFIG_DIRS=$KDEDIR/etc/xdg
export PATH=$(echo $PATH | sed -e 's\:/usr/kde/3.5/bin\\')
