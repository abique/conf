#! /bin/sh

CONF_PATH=`pwd`


function install()
{
    rm -rf ${HOME}/$1
    ln -sf ${CONF_PATH}/$1 ${HOME}/.$1
    printf "\e[33mInstalling\e[m ${HOME}/\e[32m$1\e[m\n"
}

[[ -d ${HOME}/.config ]] || mkdir ${HOME}/.config

for file in		\
    awesome		\
    awesome.d		\
    bashrc		\
    bash.d              \
    beryl		\
    beryl-managerrc	\
    bmpanel		\
    emacs		\
    emacs.d		\
    fluxbox             \
    gitconfig		\
    hgrc		\
    htoprc		\
    indent.pro          \
    inputrc		\
    toprc		\
    screenrc            \
    vimrc               \
    vim			\
    Xdefaults           \
    xinitrc		\
    xmodmaprc		\
    xscreensaver	\
    xsession		\
    config/openbox \
    config/Trolltech.conf \
    warsow
do
    install ${file}
done
