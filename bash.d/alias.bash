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
function lcd()
{
    cd "$1" && ls
}
alias ssh_epita='ssh ssh.epita.fr ssh freebsd' # not working :/
alias ssh_acu='ssh ssh.epita.fr ssh acu.epita.fr' # not working :/
alias ssh_sj='ssh intranet.smartjog.net'
alias df='df -h'
alias du='du -h --max-depth=1'
alias reload="source ~/.bashrc"
alias emacs='emacs -fn 7x14'

function ema()
{
    emacs "$@" & disown
}

alias e='emacs -Q -nw -eval "(setq make-backup-files nil)(setq delete-auto-save-files t)(setq delete-old-versions t)"'
alias em='emacs -nw'
alias gdb='gdb --quiet --tui'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ps='ps -fx'
alias egrep="egrep --color --exclude='*.svn*'"
alias grep="egrep --color --exclude='*.svn*'"
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