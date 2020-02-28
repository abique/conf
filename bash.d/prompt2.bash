function prompt_abique()
{
    RET=$?

    if [[ $RET -eq 0 ]] ; then
        RET=""
    else
        RET="\[$redB\]$RET "
    fi

    tmp=$(jobs)
    if [[ ${#tmp} -gt 0 ]] ; then
        JOBS="\[$yellow\]\j "
    else
        JOBS=""
    fi

    my_pwd=$(sed "s,$HOME,~,g"'
s,\(/\?.\)[^/]*/,\1/,g' <<<"$PWD" )

    vcs=""
    if [[ -d .svn ]] ; then
        vcs=" \[$green\]svn:\[$yellowB\]$(svn info | grep Revision | sed 's/.* \(.*\)/\1/g')"
    elif tg git branch; then
        git_branch="$(git branch --show-current --no-color)"
        if [[ "$git_branch" = "" ]] ; then git_branch="(detached)"; fi
        vcs=" \[$green\]git:$git_branch"
    elif tg hg branch ; then
        hg_branch="$(hg branch)"
        vcs=" \[$green\]hg:$hg_branch"
    fi

    curtime="\[$grey\]$(date '+%y-%m-%d %H:%M:%S') "

    PS1="$curtime$RET$JOBS\[$cyanB\]\u@\H:\[$blueB\]$my_pwd$vcs\[$yellowB\]> \[$white\]"

# Change the window title of X terminals
    case $TERM in
	*xterm*|*rxvt*|Eterm)
	    echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"
	    ;;
	screen)
	    echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"
	    ;;
    esac
}

PROMPT_COMMAND="prompt_abique"
