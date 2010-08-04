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
alias ssh_epita='ssh ssh.epita.fr'
alias ssh_acu='ssh ssh.epita.fr ssh acu.epita.fr' # not working :/
alias ssh_gistr='ssh bique_a@10.226.7.15'
alias ssh_sj='ssh intranet.smartjog.net'
alias dv3="ssh abique@85.17.216.131"
alias df='df -h'
alias du='du -h --max-depth=1'
alias reload="source ~/.bashrc"
if [[ $HOSTNAME = "dv3.twenga.com" ]] ; then
    alias emacs="$HOME/local/emacs/bin/emacs"
fi
alias my_date="date +'%Y%m%d%H%M'"
alias gt='git'
alias gp='git pull'
alias cdozulis='cd ~/develop/ozulis'
alias cdioem='cd ~/develop/xen/ioemu'
alias tx="tar -xf"
alias txv="tar -xvvvf"

function ema()
{
    emacs "$@" & disown
}

alias v='vim'
alias e='~/.bash.d/emacs-quick.bash'
alias em='emacs -nw'
alias gdb='gdb --quiet' # --tui'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias ps='ps -fx'
alias grep="grep --color --exclude='*.svn*' --exclude='*.o' --exclude=TAGS"
alias esed='sed --regexp-extended'
alias screen="screen -U"
alias xgcc='gcc -W -Wall'
alias dsss='~/local/bin/dsss'
alias rebuild='~/local/bin/rebuild'
alias fixme='grep -rn FIXME .'
alias valgrind_mleak='valgrind --leak-check=full --leak-resolution=high --show-reachable=yes'
alias svn2cl='svn2cl --break-before-msg=2'
alias pwgen='pwgen --symbols --secure --num-passwords=5 --capitalize -C --ambiguous 16'
if which colormake >/dev/null 2>&1 && false ; then
    alias make='colormake'
fi

if which pacman-color 2>/dev/null 1>/dev/null ; then
    alias p='sudo pacman-color'
else
    alias p='sudo pacman'
fi
alias pS='p -Ss'
alias pu='p -Syu'
alias y='sudo yaourt'
alias yS='yaourt -Ss'
alias poweroff='sudo poweroff'

alias soulmebaby_tail='tail -f -n 50 ~/.config/soulmebaby/log'
alias soulmebaby_sql='sqlite3 ~/.config/soulmebaby/database.sqlite'

alias stats='~/develop/crawler-2/build/src/Twenga/BinUtils/tw-get-statistics --host '

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

function tsql()
(
    if [ $# -ne 0 ]; then
        loadDbEnv "$@"
    fi

    if [[ -z "$TSQL_QUIET" ]] ; then
        echo "mysql --user=$TWENGA_DB_USERNAME --password=$TWENGA_DB_PASSWORD --host=$TWENGA_DB_HOST --database=$TWENGA_DB_DB"
    fi
    mysql --user=$TWENGA_DB_USERNAME --password=$TWENGA_DB_PASSWORD --host=$TWENGA_DB_HOST --database=$TWENGA_DB_DB $TSQL_EXTRA_PARAMS
)

function bprod()
{
    ssh bprod@batch$1
}
