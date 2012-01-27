#! /bin/bash

CONF_PATH=`pwd`

function install()
{
    rm -rf ${HOME}/.$1
    ln -sf ${CONF_PATH}/$1 ${HOME}/.$1
    printf "\e[33mInstalling\e[m ${HOME}/\e[32m.$1\e[m\n"
}

mkdir -p ~/.quakelive/quakelive/home/baseq3

[[ -d ${HOME}/.config ]] || mkdir ${HOME}/.config

for file in		\
    Xdefaults           \
    bash.d              \
    bashrc		\
    bazaar		\
    beryl		\
    beryl-managerrc	\
    bmpanel		\
    conkerorrc          \
    conkeror.d          \
    config/Trolltech.conf \
    config/awesome      \
    config/fish         \
    config/qtcurvestylerc \
    config/openbox      \
    config/midori	\
    config/xfce4	\
    config/xfce4-session \
    config/tint2 \
    emacs		\
    emacs.d		\
    fluxbox             \
    gitconfig		\
    gtkrc-2.0		\
    hgrc		\
    htoprc		\
    indent.pro          \
    inputrc		\
    q3a			\
    screenrc            \
    sqliterc            \
    toprc		\
    vimrc               \
    warsow		\
    xinitrc		\
    xmodmaprc		\
    xscreensaver	\
    xsession            \
    quakelive/quakelive/home/baseq3/*.cfg
do
    install ${file}
done
