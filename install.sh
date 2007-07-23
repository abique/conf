#! /bin/sh

CONF_PATH=`pwd`


function install()
{
    rm -rf ${HOME}/$1
    ln -s ${CONF_PATH}/$1 ${HOME}/$1
    printf "\e[33mInstalling\e[m ${HOME}/\e[32m$1\e[m\n"
}

for file in	\
    .bashrc	\
    .emacs	\
    emacs.d	\
    .toprc	\
    .beryl	\
    .beryl-managerrc
do
    install ${file}
done
