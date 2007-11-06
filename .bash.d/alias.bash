######################################
## My configuration
######################################

unalias -a

# ls/df/du human readable
if [[ `uname -s` = "FreeBSD" ]] ; then
    alias ls="ls -GhF"
elif [[ `uname -s` = "Linux" ]] ; then
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
alias e='emacs -Q -nw -eval "(setq make-backup-files nil)(setq delete-auto-save-files t)(setq delete-old-versions t)"'
alias em='emacs -nw'
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
alias make='colormake'
