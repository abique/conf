# /etc/skel/.bashrc:
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if [[ -f ~/.dir_colors ]]; then
    eval `dircolors -b ~/.dir_colors`
elif [[ -f ~/DIR_COLORS ]]; then
    eval `dircolors -b /etc/DIR_COLORS`
else
    eval `dircolors -b`
fi

if [[ $TERM = "linux" ]]; then
    unicode_start
fi

# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
export GTK2_RC_FILES=$HOME/.gtkrc-2.0


# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
export GTK2_RC_FILES="$HOME/.gtkrc-2.0:$HOME/.kde/share/config/gtkrc-2.0:/etc/gtk-2.0/gtkrc"


######################################
## My configuration
######################################

unalias -a

# ls/df/du human readable
if [[ `uname -s` = "FreeBSD" ]]; then
    alias ls="ls -GhF"
elif [[ `uname -s` = "Linux" ]]; then
    alias ls="ls --color=auto -hF"
fi
alias la='ls -a'
alias l='ls -l'
alias ll='la -l'
alias ssh_epita='ssh -X bique_a@ssh.epita.fr'
alias df='df -h'
alias du='du -h --max-depth=1'
alias reload="source ~/.bashrc"
alias emacs='emacs -fn 7x14'
alias e='emacs -Q -nw'
alias em='e'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ps='ps -fx'
alias grep="grep --color --exclude='*.svn*'"
alias ssh_rootmetest='ssh root@10.227.42.101'
alias screen="screen -U"
alias xgcc='gcc -W -Wall'
alias dsss='~/local/bin/dsss'
alias rebuild='~/local/bin/rebuild'
alias fixme='grep -rn FIXME .'

export EDITOR="emacs -nw -Q"
export ECHANGELOG_USER="Alexandre Bique (BabaLi) <bique.alexandre@gmail.com>"
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PATH="${HOME}/local/bin/:${PATH}:/sbin/:/usr/sbin/"
export COLORTERM="yes"

if [[ -f ~/.bash.d/proxy ]] ; then
    source ~/.bash.d/proxy
fi

if false; then
    if [[ -d ~/.bash_completion.d ]] ; then
	for file in ~/.bash_completion.d/*
	do
	    source "${file}"
	done
    fi
fi

function prompt_babali()
{
    RET=$?

    let promptsize=$(echo -n "`uname -s` ${USER}@${HOSTNAME}:${PWD}" |
	wc -c | tr -d " ")
    fillsize=$((${COLUMNS} - ((${promptsize} + 5) % ${COLUMNS})))
    fill=""
    # Make the filler if prompt isn't as wide as the terminal:
    while [ ${fillsize} -gt "0" ]
    do
	fill="${fill} "
   # The A with the umlaut over it (it will appear as a long dash if
   # you're using a VGA font) is \304, but I cut and pasted it in
   # because Bash will only do one substitution - which in this case is
   # putting $fill in the prompt.
	let fillsize=${fillsize}-1
    done

    if [ $RET -eq 0 ] ; then
	PS1="\[\033[0;0m\]\[\033[1;33m\]`uname -s` "\
"\[\033[1;36m\]\u@\H:\[\033[1;34m\]${PWD}"\
"\[\033[1;33m\]${fill}$(date +%H:%M)\n"\
"\[\033[1;34m\][\[\033[1;32m\]OK\[\033[1;34m\]]"\
"\[\033[1;34m\][jobs:\[\033[1;36m\]\j\[\033[1;34m\]]"\
"\[\033[0;0m\]\[\033[0;32m\]>>\[\033[0;0m\]"
    else
	PS1="\[\033[0;0m\]\[\033[1;33m\]`uname -s` "\
"\[\033[1;36m\]\u@\H:\[\033[1;34m\]${PWD}"\
"\[\033[1;31m\]${fill}$(date +%H:%M)\n"\
"\[\033[1;34m\][\[\033[1;31m\]$RET\[\033[1;34m\]]"\
"\[\033[1;34m\][jobs:\[\033[1;36m\]\j\[\033[1;34m\]]"\
"\[\033[0;0m\]\[\033[0;32m\]>>\[\033[0;0m\]"
    fi

# Change the window title of X terminals
    case $TERM in
	xterm*|rxvt*|Eterm)
	    echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"
	    ;;
	screen)
	    echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"
	    ;;
    esac
}

PROMPT_COMMAND="prompt_babali"

complete -d cd
set completion-ignore-case on
set print-completions-horizontally on
set visible-stats on
umask 0077
