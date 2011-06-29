#! /bin/sh

~/conf/common_start.sh

if which tint2 2>/dev/null >&2 ; then
    tint2 & disown
elif which fbpanel 2>/dev/null >&2 ; then
    fbpanel & disown
elif which xfce4-panel 2>/dev/null >&2 ; then
    xfce4-panel & disown
elif which bmpanel 2>/dev/null >&2 ; then
    bmpanel & disown
fi
