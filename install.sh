#! /bin/sh

CONF_PATH=`pwd`


function install()
{
    rm -rf ${HOME}/.$1
    ln -sf ${CONF_PATH}/$1 ${HOME}/.$1
    printf "\e[33mInstalling\e[m ${HOME}/\e[32m$1\e[m\n"
}

[[ -d ${HOME}/.config ]] || mkdir ${HOME}/.config

for file in		\
    Xdefaults           \
    bash.d              \
    bashrc		\
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
    config/xfce4	\
    config/xfce4-session \
    emacs		\
    emacs.d		\
    fluxbox             \
    gitconfig		\
    hgrc		\
    htoprc		\
    indent.pro          \
    inputrc		\
    kde4                \
    q3a			\
    screenrc            \
    toprc		\
    vim			\
    vimrc               \
    warsow		\
    xinitrc		\
    xmodmaprc		\
    xscreensaver	\
    xsession
do
    install ${file}
done
