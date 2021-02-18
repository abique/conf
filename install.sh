#! /bin/bash

CONF_PATH=`pwd`

function install_cfg()
{
    if [[ -e "$HOME/.$1" && $(readlink "$HOME/.$1") == "$CONF_PATH/$1" ]]
    then
        printf "\e[32mOK\e[m\t $HOME/\e[33m.$1\e[m\n"
        return
    fi

    while [[ -e "$HOME/.$1" && $(readlink "$HOME/.$1") != "$CONF_PATH/$1" ]]
    do
        printf "\e[31mOverride\e[m $HOME/\e[33m.$1\e[m? (y/n) "
        read answer
        if [[ "$answer" = "y" ]] ; then
            break
        elif [[ "$answer" = "n" ]] ; then
            return
        fi
    done

    rm -rf ${HOME}/.$1
    ln -sf ${CONF_PATH}/$1 ${HOME}/.$1
    printf "\e[33mInstall\e[m\t ${HOME}/\e[32m.$1\e[m\n"
}

mkdir -p ~/.icons/default
mkdir -p ~/.config/environment.d

[[ -d ${HOME}/.config ]] || mkdir ${HOME}/.config

for file in		\
    Xdefaults           \
    bash.d              \
    bashrc		\
    bash_profile	\
    bazaar		\
    config/environment.d/*.conf \
    config/Trolltech.conf \
    config/fish         \
    config/qtcurvestylerc \
    config/openbox      \
    config/tint2 \
    config/user-dirs.dirs \
    config/user-dirs.locale \
    config/mimeapps.list \
    config/sway         \
    emacs		\
    emacs.d		\
    gitconfig		\
    gitk		\
    gtkrc-2.0		\
    hgrc		\
    htoprc		\
    icons/default/index.theme \
    icons/default/cursors \
    inputrc		\
    pam_environment     \
    screenrc            \
    sqliterc            \
    toprc		\
    vimrc               \
    xinitrc		\
    xmodmaprc		\
    xscreensaver	\
    xsession
do
    install_cfg ${file}
done
