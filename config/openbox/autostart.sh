#! /bin/sh

~/conf/common_start.sh

if which bmpanel 2>/dev/null >/dev/null ; then
    bmpanel & disown
fi
