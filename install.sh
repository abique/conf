#! /bin/sh

rm -rf \
    ${HOME}/.emacs \
    ${HOME}/emacs.d \
    ${HOME}/.bashrc

CONF_PATH=`pwd`

function install()
{
    ln -s ${CONF_PATH}/$1 ${HOME}/$1
}

install .bashrc
install .emacs
install emacs.d
