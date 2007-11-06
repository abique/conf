export HISTFILESIZE=10042
export HISTIGNORE='ls:ll:la:l'
export INPUTRC="~/.inputrc"
export EDITOR="emacs -nw -Q -eval \"(setq make-backup-files nil)(setq delete-auto-save-files t)(setq delete-old-versions t)\""
#export EDITOR="vim"
export DEBEMAIL="alexandre.bique@smartjog.com"
export DEBFULLNAME="Alexandre Bique"
export ECHANGELOG_USER="Alexandre Bique (BabaLi) <bique.alexandre@gmail.com>"
if ! echo "${PATH}" | grep "^${HOME}/local/bin" 1>/dev/null 2>&1 ; then
    export PATH="${HOME}/local/bin:${PATH}:/usr/local/bin"
fi
if ! echo "${PATH}" | grep ":/sbin:/usr/sbin\$" 1>/dev/null 2>&1 ; then
    export PATH="${PATH}:/sbin:/usr/sbin"
fi
if ! echo "${LD_LIBRARY_PATH}" | grep "^${HOME}/local/lib" 1>/dev/null 2>&1 ; then
    export LD_LIBRARY_PATH="${HOME}/local/lib:${LD_LIBRARY_PATH}"
fi
export COLORTERM="yes"
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export LS_COLORS="${LS_COLORS}:*.c=0;33:*.cc=0;33:*.d=0;33:*.h=0;34:*.hh=0;34:"
