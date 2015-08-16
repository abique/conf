#! /bin/bash

CONF_PATH=`pwd`

function install()
{
    rm -rf ${HOME}/.$1
    ln -sf ${CONF_PATH}/$1 ${HOME}/.$1
    printf "\e[33mInstalling\e[m ${HOME}/\e[32m.$1\e[m\n"
}

mkdir -p ~/.icons/default

[[ -d ${HOME}/.config ]] || mkdir ${HOME}/.config

for file in		\
    Xdefaults           \
    bash.d              \
    bashrc		\
    bazaar		\
    config/Trolltech.conf \
    config/fish         \
    config/qtcurvestylerc \
    config/openbox      \
    config/tint2 \
    config/user-dirs.dirs \
    config/user-dirs.locale \
    config/mimeapps.list \
    config/kdeglobals \
    config/kglobalshortcutsrc \
    config/kwinrc       \
    emacs		\
    emacs.d		\
    gitconfig		\
    gitk		\
    gtkrc-2.0		\
    hgrc		\
    htoprc		\
    icons/default/index.theme \
    inputrc		\
    screenrc            \
    sqliterc            \
    toprc		\
    vimrc               \
    xinitrc		\
    xmodmaprc		\
    xscreensaver	\
    xsession
do
    install ${file}
done
