export HISTFILESIZE=100420
export HISTSIZE=10000
export HISTIGNORE='ls:ll:la:l:[bf]g:'
export INPUTRC="~/.inputrc"
#export EDITOR="$HOME/.bash.d/emacs-quick.bash"
export EDITOR="vim"

if ! echo "${PATH}" | grep "^${HOME}/local/bin" 1>/dev/null 2>&1 ; then
    export PATH="${HOME}/local/bin:${HOME}/local/dmd/bin:${PATH}"
fi
if ! echo "${PATH}" | grep ":/sbin:/usr/sbin\$" 1>/dev/null 2>&1 ; then
    export PATH="${PATH}:$HOME/develop/driver_wifi/rtems-toolchain/bin:/sbin:/usr/sbin"
fi
if ! echo "${LD_LIBRARY_PATH}" | grep "^${HOME}/local/lib" 1>/dev/null 2>&1 ; then
    if [[ -z "${LD_LIBRARY_PATH}" ]] ; then
    	export LD_LIBRARY_PATH="${HOME}/local/lib"
    else
	export LD_LIBRARY_PATH="${HOME}/local/lib:${LD_LIBRARY_PATH}"
    fi
fi

export COLORTERM="yes"
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export LS_COLORS="${LS_COLORS}:*.c=0;33:*.cpp=0;33:*.cc=0;33:*.cxx=0;33:*.d=0;33:*.h=0;36:*.hh=0;36:*.hxx=0;36:*.pkg.sj=1;35:*.mxf=0;35:*.xml=0;34:*AUTHORS=0;31:*Makefile=4;31:*README=4;31:*.pro=4;32:*.ui=1;33:*CMakeLists.txt=4;32:*.proto=0;35"
export MANWIDTH='79'

export LESS="$LESS -XSRI"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;34m'

export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LANG="en_US.UTF-8"

export EMACS_SERVER_FILE=$HOME/.emacs.d/server

export NXT_MAC="00:16:53:01:E5:2C"

#export CSCOPE_LINEFLAG_AFTER_FILE=no
