#! /bin/sh

~/conf/common_start.sh

if which xfce4-panel 2>/dev/null >&2 ; then
    xfce4-panel & disown
elif which bmpanel 2>/dev/null >&2 ; then
    bmpanel & disown
fi
