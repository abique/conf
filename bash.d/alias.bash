unalias -a

if [[ `uname -s` = "FreeBSD" ]] ; then
    alias ls="ls -GhF"
elif [[ `uname -s` = "Linux" ]] ; then
    alias ls="ls --color=auto -hF"
fi
alias la='ls -a'
alias l='ls -l'
alias lt='l -t'
alias ll='la -l'
alias llt='ll -t'
alias lhc='l *.[hc]'

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
alias valgrind_mleak='valgrind --leak-check=full --leak-resolution=high --show-reachable=yes --track-fds=yes'
alias pwgen='pwgen --symbols --secure --num-passwords=5 --capitalize -C --ambiguous 16'

alias p='sudo pacman'
alias pu='p -Syu'

alias reaper='cd ~/.wine/drive_c/Program\ Files/REAPER\ \(x64\)/ && wine reaper.exe'
alias ableton='cd ~/.wine/drive_c/users/Public/Application\ Data/Ableton/Live\ 9\ Suite/Program/ && wine Ableton\ Live\ 9\ Suite.exe'
alias diablo3='cd ~/.wine/drive_c/Program\ Files\ \(x86\)/Diablo\ III/ && setarch i386 -3 -L -B -R wine Diablo\ III.exe -launch -opengl'

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

function b64d()
{
    python <<EOF
import base64
print(base64.b64decode('$1'))
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
    wget http://aur.archlinux.org/packages/"${1:0:2}"/"$1"/"$1".tar.gz
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

function xxx()
{
    find . -name '*.c' -o -name '*.h' -o -name '*.cc' -o \
        -name '*.cpp' -o -name '*.hh' -o -name '*.hxx' | \
        xargs grep -inC5 '\(XXX\|todo\)'
}

function paste-binouse-send()
(
    host="$1"
    src="$2"
    temp=0

    if [[ -z "$src" || "$src" = "-" ]] ; then
        src=$(mktemp)
        cat >"$src"
        temp=1
    fi

    if [[ ! -r "$src" ]] ; then
        return
    fi

    mime_type=$(file --mime-type "$src" | cut -f 2 -d ' ')
    hdr=$(mktemp)
    curl -D "$hdr" --data-urlencode "content-type=${mime_type}" \
        --data-urlencode "content@${src}" "$host"

    echo "$host"$(sed -n 's/location: \(.*\)/\1/p' "$hdr")
    rm -rf "$hdr"
    if [[ $temp -eq 1 ]] ; then
        rm -f "$src"
    fi
)

alias u-he-pb="paste-binouse-send http://archear.u-he:11013/"
alias u-he-rel="rm $HOME/.u-he/*/*.so $HOME/.u-he/*/dialog $HOME/.BitwigStudio/cache/vst-metadata"
