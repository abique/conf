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
alias ssh_epita='ssh ssh.epita.fr'
alias ssh_acu='ssh ssh.epita.fr ssh acu.epita.fr' # not working :/
alias ssh_gistr='ssh bique_a@10.226.7.15'
alias ssh_sj='ssh intranet.smartjog.net'
alias df='df -h'
alias du='du -h --max-depth=1'
alias reload="source ~/.bashrc"
alias emacs='emacs -fn 7x14'
alias my_date="date +'%Y%m%d%H%M'"
alias gt='git'
alias cdozulis='cd ~/develop/ozulis'
alias cdioem='cd ~/develop/xen/ioemu'

function ema()
{
    emacs "$@" & disown
}

alias v='vim'
alias e='emacs -Q -nw -eval "(setq make-backup-files nil)(setq delete-auto-save-files t)(setq delete-old-versions t)"'
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
alias grep="egrep --color --exclude='*.svn*' --exclude='*.o' --exclude=TAGS"
alias egrep="grep -E"
alias esed='sed --regexp-extended'
alias screen="screen -U"
alias xgcc='gcc -W -Wall'
alias dsss='~/local/bin/dsss'
alias rebuild='~/local/bin/rebuild'
alias fixme='grep -rn FIXME .'
alias valgrind_mleak='valgrind --leak-check=full --leak-resolution=high --show-reachable=yes'
alias svn2cl='svn2cl --break-before-msg=2'
alias pwgen='pwgen --symbols --secure --num-passwords=5 --capitalize -C --ambiguous 12'
if which colormake >/dev/null 2>&1 && false ; then
    alias make='colormake'
fi

alias p='sudo pacman-color'
alias pu='p -Syu'
alias y='sudo yaourt'
alias poweroff='sudo poweroff'

alias soulmebaby_tail='tail -f -n 50 ~/.config/soulmebaby/log'
alias soulmebaby_sql='sqlite3 ~/.config/soulmebaby/database.sqlite'

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
    eval $(ssh-agent)
    ssh-add
}

function tg()
{
    "$@" >/dev/null 2>/dev/null
}
