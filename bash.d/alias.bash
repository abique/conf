unalias -a

if [[ `uname -s` = "FreeBSD" ]] ; then
    alias ls="ls -GhF"
    alias make=gmake
    alias sed=gsed
elif [[ `uname -s` = "Linux" ]] ; then
    alias ls="ls --color=auto -hF"
fi
alias la='ls -a'
alias l='ls -l'
alias lt='l -t'
alias ll='la -l'
alias llt='ll -t'
function lcd()
{
    cd "$1" && ls
}
alias pcd='cd -P'
alias m='make'
alias c='cat'
alias ce='cat -e'
alias cn='cat -n'
alias df='df -h'
alias du='du -h --max-depth=1'
alias reload="source ~/.bashrc"
alias tx="tar -xf"
alias txv="tar -xvvvf"
alias v='vim'
alias e='~/.bash.d/emacs-quick.bash'
alias em='emacs -nw'
alias gdb='gdb --quiet'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias grep="grep --color --exclude='*.svn*' --exclude='*.o' --exclude=TAGS"
alias valgrind_mleak='valgrind --leak-check=full --leak-resolution=high --show-reachable=yes'
alias pwgen='pwgen --symbols --secure --num-passwords=5 --capitalize -C --ambiguous 16'
alias mplayer="mplayer -ao alsa -vo vdpau"

alias p='sudo pacman'
alias pu='p -Syu'

alias stats='~/develop/crawler-2/build/src/twenga/BinUtils/get-stats --host '

alias debian='sudo chroot /local/debian /bin/bash -c "su abique --shell=/bin/bash"'

function ssh_vnc_tunnel()
{
    if [[ $# -eq 0 ]] ; then
	return
    fi
    ssh -L5901:localhost:5901 root@"$1" -N &
    vncviewer localhost:1
    wait $!
}

function b16b64()
{
    if [[ $# -eq 0 ]] ; then
	read HASH
	HASH=$(echo -n "${HASH}" | cut -f 1 -d ' ')
    else
	HASH="$1"
    fi

    python <<EOF
import base64
print base64.b64encode(base64.b16decode('${HASH}', True))
EOF
}

function b64b16()
{
    python <<EOF
import base64
print base64.b16encode(base64.b64decode('$1'))
EOF
}

function x-ssh-agent()
{
    ssh-agent >~/.bash.d/ssh-agent.bash
    eval "$(<~/.bash.d/ssh-agent.bash)"
    ssh-add
}

function tg()
{
    "$@" >/dev/null 2>/dev/null
}

function lr()
{
    "$@" 2>&1 | less -R
}

function check_colors()
{
    for i in $(seq 30 37)
    do
        echo -e $((i - 30)): "\e[0;${i}mbande\e[m", "\e[1;${i}mbande\e[m", \
            "\e[3;${i}mbande\e[m", "\e[4;${i}mbande\e[m", \
            "\e[5;${i}mbande\e[m", "\e[7;${i}mbande\e[m"
    done
}

function aur_get()
{
    wget http://aur.archlinux.org/packages/"$1"/"$1".tar.gz
    tx "$1".tar.gz
}

function _kmtrace()
{
    LD_PRELOAD=/usr/lib/libktrace.so MALLOC_TRACE=ktrace.out "$@"
}

function emacs-byte-compile()
{
    for i in "$@"
    do
        emacs -batch -f batch-byte-compile "$i"
    done
}
