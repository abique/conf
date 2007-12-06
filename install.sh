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
    bashrc		\
    bash.d              \
    beryl		\
    beryl-managerrc	\
    emacs		\
    emacs.d		\
    fluxbox             \
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
    xsession		\
    config/Trolltech.conf \

do
    install ${file}
done
